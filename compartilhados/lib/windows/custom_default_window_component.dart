import 'package:compartilhados/componentes/toasts/toast_utils.dart';
import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:compartilhados/windows/window_extra_actions_widget.dart';
import 'package:compartilhados/windows/windows_helper.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class CustomDefaultWindowComponent extends StatefulWidget {
  CustomDefaultWindowComponent({
    required this.child,
    required this.title,
    required this.setToLast,
    required this.setToFirst,
    required this.remove,
    required this.chave,
    required this.ofssetBase,
    this.height = 400,
    this.width = 400,
    this.onEnter,
    this.maximizarOnOpen = false,
    super.key,
  });
  final int chave;
  final Widget child;
  final Offset ofssetBase;
  final Function()? onEnter;
  final double width;
  final double height;
  final String title;
  final bool maximizarOnOpen;
  final void Function(int) setToLast;
  final void Function(int) setToFirst;
  final void Function(int) remove;

  @override
  State<CustomDefaultWindowComponent> createState() =>
      CustomDefaultWindowComponentState(
        height: height,
        width: width,
      );
}

class CustomDefaultWindowComponentState
    extends State<CustomDefaultWindowComponent> {
  CustomDefaultWindowComponentState({
    required this.width,
    required this.height,
  });

  void setAbsorbing(bool absorbing) {
    setState(() {
      this.absorbing = absorbing;
    });
  }

  void setTooltipDisabled() {
    setState(() {
      tooltipDisabled = true;
    });
  }

  void setWindow({
    required double width,
    required double height,
    required Offset offset,
  }) {
    normalizar();
    setState(() {
      this.width = width;
      this.height = height;
      this.offset = offset;
    });
  }

  void setWindowSizeOfsset({
    required double width,
    required double height,
    required Offset offset,
  }) {
    setState(() {
      this.width = width;
      this.height = height;
      this.offset = offset;
    });
  }

  late Offset offset = widget.ofssetBase;
  double scale = 1;
  double width;
  double height;
  bool maximizado = false;
  bool maximizadoMetade = false;
  bool minimizado = false;
  bool absorbing = true;
  bool tooltipDisabled = false;
  bool alinhadoHorizontal = false;
  bool alinhadoVertical = false;
  late Tooltip tooltipFechar = Tooltip(
    message: 'Fechar',
    child: IconButton(
      onPressed: () => widget.remove(widget.chave),
      icon: const Icon(Symbols.close),
    ),
  );

  @override
  void initState() {
    super.initState();
    if (widget.maximizarOnOpen) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => maximizarMetade(),
      );
    }
  }

  double getToolbarHeight(Size size) {
    double height = size.height;
    if (height > 1000) {
      return 52;
    } else if (height > 900) {
      return 48;
    } else if (height > 800) {
      return 44;
    } else if (height > 700) {
      return 40;
    } else if (height > 600) {
      return 36;
    } else if (height > 500) {
      return 34;
    } else if (height > 400) {
      return 32;
    }
    return 30;
  }

  double getMaximizedHeight(Size size) {
    return size.height - getToolbarHeight(size) - 55;
  }

  double getMaximizedWidth(Size size) {
    return size.width - 30;
  }

  (double, double) getWidthAppBar(Size size) {
    double height = size.height;
    if (height > 800) {
      return (250, 78);
    } else if (height > 700) {
      return (230, 72);
    } else if (height > 600) {
      return (210, 68);
    }
    return (190, 64);
  }

  double getMaximizedMetadeWidth(Size size) {
    (double, double) width = getWidthAppBar(size);
    return size.width - 30 - width.$1;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Positioned(
      left: maximizado
          ? 0
          : maximizadoMetade
              ? getWidthAppBar(size).$1 + 1
              : offset.dx,
      top: maximizado
          ? 0
          : maximizadoMetade
              ? 0
              : offset.dy,
      child: Material(
        elevation: 5,
        child: Column(
          children: [
            MouseRegion(
              cursor: maximizado == true || maximizadoMetade
                  ? SystemMouseCursors.basic
                  : SystemMouseCursors.move,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: onEnter,
                    onPanUpdate: (details) {
                      WindowsHelper.SetToLast(widget.chave);
                      setState(() {
                        double newOffsetY = offset.dy + details.delta.dy;
                        if (newOffsetY < -10) {
                          setState(() {
                            maximizado = true;
                            offset = Offset(
                              offset.dx + details.delta.dx,
                              20,
                            );
                          });
                          return;
                        }
                        offset = Offset(
                          offset.dx + details.delta.dx,
                          offset.dy + details.delta.dy,
                        );
                      });
                    },
                    child: Container(
                      width: maximizado
                          ? getMaximizedWidth(size) + 30
                          : maximizadoMetade
                              ? getMaximizedMetadeWidth(size) + 30
                              : width + 28,
                      color: absorbing
                          ? Colors.grey.shade300
                          : Colors.grey.shade100,
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 8),
                          ),
                          Text(
                            widget.title,
                            style: Fontes.getRoboto(fontSize: 14),
                          ),
                          const Spacer(),
                          const Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: WindowExtraActions(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Tooltip(
                              message: 'Minimizar',
                              child: IconButton(
                                onPressed: minimizado ? normalizar : minimizar,
                                icon: minimizado
                                    ? const Icon(Icons.splitscreen)
                                    : const Icon(Icons.minimize),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Tooltip(
                              message: 'Tela cheia',
                              child: IconButton(
                                onPressed: maximizado ? normalizar : maximizar,
                                icon: maximizado
                                    ? const Icon(Icons.fit_screen)
                                    : const Icon(Icons.fullscreen),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Tooltip(
                              message: 'Expandir',
                              child: IconButton(
                                onPressed: maximizadoMetade
                                    ? normalizar
                                    : maximizarMetade,
                                icon: maximizadoMetade
                                    ? const Icon(Icons.screen_lock_landscape)
                                    : const Icon(Icons.smart_screen),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Stack(
                              children: [
                                TooltipVisibility(
                                  visible: !tooltipDisabled,
                                  child: Tooltip(
                                    message: 'Fechar',
                                    child: IconButton(
                                      onPressed: () =>
                                          widget.remove(widget.chave),
                                      icon: const Icon(Symbols.close),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: minimizado == false,
              maintainState: true,
              child: BorderWindowWidget(
                onEnter: onEnter,
                cursor: SystemMouseCursors.resizeRight,
                onPanUpdate: onPanUpdate,
                padding: const EdgeInsets.only(right: 6),
                widget: BorderWindowWidget(
                  onEnter: onEnter,
                  cursor: SystemMouseCursors.resizeLeft,
                  onPanUpdate: onPanUpdate,
                  padding: const EdgeInsets.only(left: 6),
                  widget: BorderWindowWidget(
                    onEnter: onEnter,
                    cursor: SystemMouseCursors.resizeDown,
                    onPanUpdate: onPanUpdate,
                    padding: const EdgeInsets.only(bottom: 6),
                    widget: MouseRegion(
                      cursor: SystemMouseCursors.basic,
                      child: GestureDetector(
                        onPanUpdate: (details) {},
                        onTap: onEnter,
                        child: IgnorePointer(
                          ignoring: absorbing,
                          child: Theme(
                            data: Theme.of(ToastUtils.routerOutletContext!),
                            child: Material(
                              elevation: 0,
                              color: Cores.materialCorPrincipal.shade300,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: maximizado || maximizadoMetade
                                          ? getMaximizedHeight(size)
                                          : height,
                                      width: maximizado
                                          ? getMaximizedWidth(size)
                                          : maximizadoMetade
                                              ? getMaximizedMetadeWidth(size)
                                              : width,
                                      child: widget.child,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void maximizar() {
    setState(() {
      maximizado = true;
      maximizadoMetade = false;
      minimizado = false;
      alinhadoHorizontal = false;
      alinhadoVertical = false;
    });
    WindowsHelper.SetToLast(widget.chave);
    WindowsHelper.MaximizouExpandiu(widget.chave);
  }

  void maximizarMetade() {
    setState(() {
      maximizado = false;
      maximizadoMetade = true;
      minimizado = false;
      alinhadoHorizontal = false;
      alinhadoVertical = false;
    });
    WindowsHelper.SetToLast(widget.chave);
    WindowsHelper.MaximizouExpandiu(widget.chave);
  }

  void normalizar() {
    setState(() {
      maximizadoMetade = false;
      maximizado = false;
      minimizado = false;
      alinhadoHorizontal = false;
      alinhadoVertical = false;
    });
  }

  void minimizar() {
    setState(() {
      maximizadoMetade = false;
      maximizado = false;
      minimizado = true;
      alinhadoHorizontal = false;
      alinhadoVertical = false;
    });
    widget.setToFirst(widget.chave);
  }

  void onPanUpdate(DragUpdateDetails details) {
    double newWidth = width + details.delta.dx;
    double newHeight = height + details.delta.dy;
    setState(() {
      if (newWidth >= 475 || newWidth > width) {
        width = newWidth;
      }
      if (newHeight >= 400 || newHeight > height) {
        height = newHeight;
      }
    });
  }

  void onEnter() {
    widget.setToLast(widget.chave);
  }
}

class BorderWindowWidget extends StatefulWidget {
  const BorderWindowWidget({
    super.key,
    required this.widget,
    required this.onPanUpdate,
    required this.padding,
    required this.cursor,
    required this.onEnter,
  });
  final Widget widget;
  final void Function(DragUpdateDetails details) onPanUpdate;
  final EdgeInsets padding;
  final MouseCursor cursor;
  final void Function() onEnter;
  @override
  State<BorderWindowWidget> createState() => _BorderWindowWidgetState();
}

class _BorderWindowWidgetState extends State<BorderWindowWidget> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.cursor,
      child: GestureDetector(
        onTap: widget.onEnter,
        onPanUpdate: widget.onPanUpdate,
        child: Container(
          padding: widget.padding,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
          ),
          child: widget.widget,
        ),
      ),
    );
  }
}
