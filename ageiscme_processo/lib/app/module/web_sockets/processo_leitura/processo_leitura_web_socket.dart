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
  StreamSubscription? _subscription;

  WebSocketChannel? _webSocket;
  ProcessoLeituraWebSocket({
    required this.onMessageReceived,
    required this.onError,
    required this.handleKey,
    required this.onConnectionLost,
  });

  Future connect() async {
    close();
    await createWebSocket();
    preparatePing();
    listen();
  }

  Future createWebSocket() async {
    String routeBase = await _route;
    routeBase = routeBase.replaceAll('http', 'ws');
    _webSocket = WebSocketChannel.connect(
      Uri.parse(routeBase + _webSocketRoute),
    );
  }

  void preparatePing() {
    TIMER = Timer.periodic(const Duration(seconds: 30), (timer) {
      if (timer.isActive != true) return;
      sendPing();
    });
  }

  void listen() {
    _subscription = _webSocket!.stream.listen(
      onDone: () async {
        int? closeCode = _webSocket?.closeCode;
        if (closeCode == 1006 || closeCode == 1005) {
          onError(
            'A conexão com o servidor foi perdida, tente novamente e se o problema continuar entre em contato com o suporte. $closeCode',
          );
        }
      },
      (event) {
        if (event == 'pong') return;
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
    _subscription?.cancel();
    _webSocket?.sink.close();
  }

  Future tryConnect() async {
    if (_webSocket?.closeCode == null) return;
    await connect();
  }

  void sendMessage(ProcessoLeituraMontagemModel montagem) async {
    String json = jsonEncode(montagem.toJson());
    await sendJsonString(json: json);
  }

  Future sendJsonString({
    required String json,
    int? awaitTimeSeconds,
  }) async {
    await tryConnect();
    _webSocket?.sink.add(json);
  }

  Future sendPing() async {
    await tryConnect();
    _webSocket?.sink.add('ping');
  }
}
