import 'dart:async';
import 'dart:convert';

import 'package:ageiscme_data/shared/app_config.dart';
import 'package:ageiscme_models/models/result/command_result_model.dart';
import 'package:ageiscme_processo/app/module/models/processo_leitura/processo_leitura_montagem_model.dart';
import 'package:dependencias_comuns/web_socket_export.dart';

class ProcessoLeituraWebSocket {
  Future<String> get _route async =>
      (await AppConfig.forEnvironment(false)).apiUrl;

  static const String _webSocketRoute = '/ws/processo-leitura-montagem';

  Function((String, ProcessoLeituraMontagemModel)) onMessageReceived;
  Function(String) onError;
  Function() handleKey;
  Function(String) onConnectionLost;
  Timer? TIMER;

  WebSocketChannel? _webSocket;
  ProcessoLeituraWebSocket({
    required this.onMessageReceived,
    required this.onError,
    required this.handleKey,
    required this.onConnectionLost,
  });

  Future connect() async {
    String routeBase = await _route;
    routeBase = routeBase.replaceAll('http', 'ws');
    _webSocket = WebSocketChannel.connect(
      Uri.parse(routeBase + _webSocketRoute),
    );
    TIMER?.cancel();
    TIMER = Timer.periodic(const Duration(minutes: 2), (timer) {
      if (timer.isActive != true) return;
      sendPing();
    });

    _webSocket!.stream.listen(
      (event) {
        if (event == 'pong') {
          print('pong');
          return;
        }
        CommandResultModel result =
            CommandResultModel.fromJson(jsonDecode(event));
        if (!result.success) {
          onError(result.message);
          return;
        }
        (String, ProcessoLeituraMontagemModel)? leitura = (
          result.message,
          ProcessoLeituraMontagemModel.fromJson(result.data)
        );
        onMessageReceived(leitura);
      },
      cancelOnError: false,
    );
  }

  void close() {
    TIMER?.cancel();
    _webSocket?.sink.close();
  }

  Future tryConnect() async {
    if (_webSocket?.closeCode == null) return;
    await connect();
  }

  void sendMessage(ProcessoLeituraMontagemModel montagem) async {
    await tryConnect();
    _webSocket?.sink.add(jsonEncode(montagem.toJson()));
  }

  Future sendPing() async {
    print('ping');
    await tryConnect();
    _webSocket?.sink.add('ping');
  }
}
