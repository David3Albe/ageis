import 'dart:async';
import 'dart:convert';

import 'package:ageiscme_data/shared/app_config.dart';
import 'package:ageiscme_data/shared/custom_dio.dart';
import 'package:ageiscme_models/enums/command_result_alert_type.dart';
import 'package:ageiscme_models/models/result/command_result_model.dart';
import 'package:ageiscme_processo/app/module/models/processo_leitura/processo_leitura_montagem_model.dart';
import 'package:dependencias_comuns/web_socket_export.dart';
import 'package:flutter/foundation.dart';

class ProcessoLeituraWebSocket {
  Future<CustomRoute> get _route async {
    AppConfig app = await AppConfig.forEnvironment(false);
    return app.useFailoverFirst
        ? CustomRoute(failover: true, url: app.apiUrlFailover)
        : CustomRoute(failover: false, url: app.apiUrl);
  }

  static const String _webSocketRoute = '/ws/processo-leitura-montagem';

  Function((String, ProcessoLeituraMontagemModel)) onMessageReceived;
  Function(String, CommandResultAlertType?) onError;
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
    bool socketConnected = false;
    while (socketConnected != true) {
      try {
        socketConnected = await _createWebSocket();
      } catch (ex) {
        debugPrint(ex.toString());
      }
    }
    preparatePing();
    listen();
  }

  Future<bool> _createWebSocket() async {
    CustomRoute rota = await _route;
    print('criouWebSocket');
    String routeBase = rota.url.replaceAll('http', 'ws');
    try {
      _webSocket = WebSocketChannel.connect(
        Uri.parse(routeBase + _webSocketRoute),
      );
      await _webSocket?.ready;
      return true;
    } catch (ex) {
      await Future.delayed(const Duration(seconds: 3));
      await AppConfig.setUseFailover(!rota.failover);
      return false;
    }
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
          await connect();
          // onError(
          //   'A conexão com o servidor foi perdida, tente novamente e se o problema continuar entre em contato com o suporte. $closeCode',
          //   null,
          // );
        }
      },
      (event) {
        if (event == 'pong') return;
        CommandResultModel result =
            CommandResultModel.fromJson(jsonDecode(event));
        if (!result.success) {
          onError(result.message, result.alertType);
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
    await _webSocket?.ready;
    String json = jsonEncode(montagem.toJson());
    await sendJsonString(json: json);
  }

  Future sendJsonString({
    required String json,
    int? awaitTimeSeconds,
  }) async {
    await _webSocket?.ready;
    await tryConnect();
    _webSocket?.sink.add(json);
  }

  Future sendPing() async {
    await _webSocket?.ready;
    await tryConnect();
    _webSocket?.sink.add('ping');
  }
}
