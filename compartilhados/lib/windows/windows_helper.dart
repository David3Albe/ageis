import 'package:compartilhados/windows/custom_default_window_component.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class CustomOverlayWindow {
  final Widget widget;
  DateTime ultimaEntrada;
  final int chave;
  CustomOverlayWindow({
    required this.widget,
    required this.ultimaEntrada,
    required this.chave,
  });
}

class CustomOverlayCubit extends Cubit<CustomOverlayState> {
  CustomOverlayCubit() : super(CustomOverlayState());

  void refresh() {
    emit(CustomOverlayState());
  }

  void order() {
    emit(CustomOverlayOrderState());
  }
}

class CustomOverlayState {}

class CustomOverlayOrderState extends CustomOverlayState {}

class CustomOverlayWidget extends StatelessWidget {
  const CustomOverlayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomOverlayCubit, CustomOverlayState>(
      bloc: WindowsHelper.cubitOverlay,
      builder: (context, state) {
        List<CustomOverlayWindow> windows = WindowsHelper.overlays;
        windows.sort((a, b) => a.ultimaEntrada.compareTo(b.ultimaEntrada));
        List<Widget> widgets = windows.map((e) => e.widget).toList();
        return Stack(
          children: widgets,
        );
      },
    );
  }
}

class WindowsHelper {
  static double windows = 0;
  static int _actual_key = 0;
  static final List<CustomOverlayWindow> overlays = [];
  static BuildContext? windowContext;
  static bool get isOverlayVisible => overlays.isNotEmpty;
  static CustomOverlayCubit cubitOverlay = CustomOverlayCubit();

  static void CloseAll() {
    overlays.clear();
    cubitOverlay.refresh();
  }

  static void RemoverWidget(int key) {
    overlays.removeWhere((item) => item.chave == key);
    cubitOverlay.refresh();
  }

  static void SetToLast(int key) {
    CustomOverlayWindow? widget =
        overlays.where((element) => element.chave == key).firstOrNull;
    if (widget == null) return;
    widget.ultimaEntrada = DateTime.now();
    cubitOverlay.refresh();
  }

  static void SetToFirst(int key) {
    CustomOverlayWindow? widget =
        overlays.where((element) => element.chave == key).firstOrNull;
    if (widget == null) return;
    List<DateTime> datas = overlays.map((e) => e.ultimaEntrada).toList();
    if (datas.isEmpty) {
      widget.ultimaEntrada = DateTime.now().add(const Duration(days: -3));
    } else {
      datas.sort((a, b) => a.compareTo(b));
      widget.ultimaEntrada = datas.first.add(const Duration(minutes: -1));
    }
    cubitOverlay.refresh();
  }

  static void AdicionarOverlayCustomizada({
    required int chave,
    required final Widget overlay,
  }) {
    overlays.add(
      CustomOverlayWindow(
        chave: chave,
        widget: overlay,
        ultimaEntrada: DateTime.now(),
      ),
    );
    cubitOverlay.refresh();
  }

  static int GetNextChave() {
    _actual_key += 1;
    return _actual_key;
  }

  static int OpenDefaultWindows({
    required final Widget widget,
    required final String title,
    final ThemeData? theme,
  }) {
    Size size = MediaQuery.of(windowContext!).size;
    if (windows > 8) windows = 0;
    double right = 300 + (windows * 50);
    double width = size.width / 2.5;
    double height = size.height * 0.8;

    int chave = GetNextChave();
    Widget window = CustomDefaultWindowComponent(
      key: UniqueKey(),
      chave: chave,
      remove: RemoverWidget,
      setToLast: SetToLast,
      setToFirst: SetToFirst,
      title: title,
      maximizarOnOpen: true,
      width: width,
      height: height,
      ofssetBase: Offset(right, 60),
      child: widget,
    );

    overlays.add(CustomOverlayWindow(
      chave: chave,
      widget: window,
      ultimaEntrada: DateTime.now(),
    ));
    cubitOverlay.refresh();
    windows++;
    return chave;
  }

  static int openDefaultDialog({
    required final Widget widget,
    bool dismissable = false,
  }) {
    Size size = MediaQuery.of(windowContext!).size;

    int chave = GetNextChave();
    Widget window = GestureDetector(
      onTap: dismissable ? () => RemoverWidget(chave) : null,
      child: Container(
        color: Colors.black.withOpacity(0.2),
        width: size.width,
        height: size.height,
        child: AlertDialog(
          content: GestureDetector(
            onTap: dismissable ? () => {} : null,
            child: widget,
          ),
          titlePadding: EdgeInsets.zero,
          contentPadding: const EdgeInsets.all(8),
          actionsPadding: EdgeInsets.zero,
        ),
      ),
    );

    overlays.add(CustomOverlayWindow(
      chave: chave,
      widget: window,
      ultimaEntrada: DateTime.now(),
    ));
    cubitOverlay.refresh();
    windows++;
    return chave;
  }
}
