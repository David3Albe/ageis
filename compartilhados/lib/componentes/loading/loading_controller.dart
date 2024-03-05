import 'package:compartilhados/coletores/coletores_helper.dart';
import 'package:compartilhados/componentes/loading/loading_widget.dart';
import 'package:flutter/material.dart';

class LoadingController {
  bool _closed = false;
  bool _showed = false;
  bool get isOpen => _showed;
  BuildContext context;
  Color? barrierColor;
  FocusNode _textNode = FocusNode();
  late final ColetoresHelper coletorHelper = ColetoresHelper();

  LoadingController({
    required this.context,
    this.barrierColor,
    bool? cancelShow,
  }) {
    if (cancelShow == true) return;
    show(context);
  }

  void close(BuildContext? context, bool mounted) {
    if (_closed) return;
    if (!mounted) return;
    _closed = true;
    _showed = false;
    Navigator.of(context ?? this.context, rootNavigator: true).pop();
  }

  Future<void> show(BuildContext? context) {
    _closed = false;
    _showed = true;
    return showDialog(
      barrierColor: barrierColor,
      barrierDismissible: false,
      context: context ?? this.context,
      builder: (_) {
        return RawKeyboardListener(
          onKey: coletorHelper.handleKey,
          autofocus: true,
          focusNode: _textNode,
          child: const Center(
            child: LoadingWidget(),
          ),
        );
      },
    );
  }

  void setHandleKeyFunction(dynamic Function(String) onEnter) {
    coletorHelper.onEnter = onEnter;
  }

  void closeDefault() => close(null, true);
}
