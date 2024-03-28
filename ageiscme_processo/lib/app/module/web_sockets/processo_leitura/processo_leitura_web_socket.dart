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

  WebSocketChannel? webSocket;
  ProcessoLeituraWebSocket({
    required this.onMessageReceived,
    required this.onError,
    required this.handleKey,
  });

  Future connect() async {
    String routeBase = await _route;
    routeBase = routeBase.replaceAll('http', 'ws');
    webSocket =
        WebSocketChannel.connect(Uri.parse(routeBase + _webSocketRoute));

    webSocket!.stream.listen((event) {
      CommandResultModel result =
          CommandResultModel.fromJson(jsonDecode(event));
      if (!result.success) {
        onError(result.message);
        return;
      }
      (String, ProcessoLeituraMontagemModel)? leitura =
          (result.message, ProcessoLeituraMontagemModel.fromJson(result.data));
      onMessageReceived(leitura);
    });
  }

  Future tryConnect() async {
    if (webSocket?.closeCode == null) return;
    await connect();
  }

  void sendMessage(ProcessoLeituraMontagemModel montagem) async {
    await tryConnect();
    webSocket?.sink.add(jsonEncode(montagem.toJson()));
  }
}
