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
  OverlayEntry? overlay;

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
    overlay?.remove();
    overlay = null;
  }

  void show(BuildContext? context) {
    _closed = false;
    _showed = true;
    Size size = MediaQuery.of(context ?? this.context).size;

    late OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => Container(
        color: Colors.black.withOpacity(0.2),
        width: size.width,
        height: size.height,
        child: KeyboardListener(
          onKeyEvent: coletorHelper.handleKey,
          autofocus: true,
          focusNode: _textNode,
          child: const Center(
            child: LoadingWidget(),
          ),
        ),
      ),
    );
    Overlay.of(context ?? this.context).insert(overlayEntry);
    overlay = overlayEntry;
  }

  void setHandleKeyFunction(dynamic Function(String) onEnter) {
    coletorHelper.onEnter = onEnter;
  }

  void closeDefault() => close(null, true);
}
