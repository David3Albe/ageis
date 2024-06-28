import 'package:compartilhados/windows/custom_default_window_component.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class CustomOverlayWindow {
  final CustomDefaultWindowComponent widget;
  DateTime ultimaEntrada;
  final int chave;
  final String title;
  final GlobalKey<CustomDefaultWindowComponentState> key;
  CustomOverlayWindow({
    required this.widget,
    required this.ultimaEntrada,
    required this.chave,
    required this.title,
    required this.key,
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
  static const int MAXIMO_JANELAS = 12;
  static CustomOverlayCubit cubitOverlay = CustomOverlayCubit();

  static void CloseAll() {
    overlays.clear();
    cubitOverlay.refresh();
  }

  static void Cascate(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double fullWidth = size.width * 0.6;
    double fullHeight = size.height * 0.8;

    int count = 0;
    for (CustomOverlayWindow overlay in overlays) {
      Offset offsetWindow = Offset(
        280.0 + (45.0 * count),
        15.0 + (30.0 * count),
      );
      overlay.key.currentState?.setWindow(
        width: fullWidth,
        height: fullHeight,
        offset: offsetWindow,
      );
      count++;
    }
  }

  static void Horizontal(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double fullWidth = getMaximizedWidth(size);
    double fullHeight = getMaximizedHeight(size);
    List<CustomOverlayWindow> windows = WindowsHelper.overlays;
    windows.sort((a, b) => a.ultimaEntrada.compareTo(b.ultimaEntrada));

    int count = 0;
    for (CustomOverlayWindow overlay in windows.reversed) {
      Offset offsetWindow = Offset(
        count * (fullWidth / 2 + 15),
        0,
      );
      overlay.key.currentState?.setWindow(
        width: fullWidth / 2 - 15,
        height: fullHeight,
        offset: offsetWindow,
      );
      overlay.key.currentState?.setAbsorbing(false);
      count++;
      if (count == 2) return;
    }
  }

  static void Vertical(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double fullWidth = getMaximizedWidth(size);
    double fullHeight = getMaximizedHeight(size);
    List<CustomOverlayWindow> windows = WindowsHelper.overlays;
    windows.sort((a, b) => a.ultimaEntrada.compareTo(b.ultimaEntrada));

    int count = 0;
    for (CustomOverlayWindow overlay in windows.reversed) {
      Offset offsetWindow = Offset(
        0,
        count * (fullHeight / 2 + 30),
      );
      overlay.key.currentState?.setWindow(
        width: fullWidth,
        height: fullHeight / 2 - 30,
        offset: offsetWindow,
      );
      overlay.key.currentState?.setAbsorbing(false);
      count++;
      if (count == 2) return;
    }
  }

  static double getMaximizedHeight(Size size) {
    return size.height - getToolbarHeight(size) - 55;
  }

  static double getMaximizedWidth(Size size) {
    return size.width - 30;
  }

  static double getToolbarHeight(Size size) {
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

  static void RemoverWidget(int key) {
    overlays.removeWhere((item) => item.chave == key);
    cubitOverlay.refresh();
    List<CustomOverlayWindow> windows = overlays;
    windows.sort((a, b) => a.ultimaEntrada.compareTo(b.ultimaEntrada));
    windows.lastOrNull?.key.currentState?.setAbsorbing(false);
  }

  static void SetToLast(int key) {
    CustomOverlayWindow? widget =
        overlays.where((element) => element.chave == key).firstOrNull;
    if (widget == null) return;
    widget.ultimaEntrada = DateTime.now();
    cubitOverlay.refresh();
    overlays.forEach((e) => e.key.currentState?.setAbsorbing(e.chave != key));
  }

  static bool isFirst(int key) {
    List<CustomOverlayWindow> windows = overlays;
    windows.sort((a, b) => a.ultimaEntrada.compareTo(b.ultimaEntrada));
    return windows.lastOrNull?.chave == key;
  }

  static bool isLast(int key) {
    List<CustomOverlayWindow> windows = overlays;
    windows.sort((a, b) => a.ultimaEntrada.compareTo(b.ultimaEntrada));
    return windows.firstOrNull?.chave == key;
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
    widget.key.currentState?.setAbsorbing(true);
    List<CustomOverlayWindow> windows = overlays;
    windows.sort((a, b) => a.ultimaEntrada.compareTo(b.ultimaEntrada));
    windows.lastOrNull?.key.currentState?.setAbsorbing(false);
  }

  static void RemoverJanelsExcessivas() {
    if (overlays.length <= MAXIMO_JANELAS) return;
    List<CustomOverlayWindow> datas = overlays;
    datas.sort((a, b) => a.ultimaEntrada.compareTo(b.ultimaEntrada));
    CustomOverlayWindow firstWindow = datas.first;
    overlays.removeWhere((item) => item.chave == firstWindow.chave);
  }

  static void AdicionarOverlayCustomizada({
    required int chave,
    required final CustomDefaultWindowComponent overlay,
    required final String title,
    required final GlobalKey<CustomDefaultWindowComponentState> key,
  }) {
    overlays.add(
      CustomOverlayWindow(
        key: key,
        chave: chave,
        widget: overlay,
        ultimaEntrada: DateTime.now(),
        title: title,
      ),
    );
    RemoverJanelsExcessivas();
    cubitOverlay.refresh();
    key.currentState?.setAbsorbing(true);
  }

  static int GetNextChave() {
    _actual_key += 1;
    return _actual_key;
  }

  static CustomOverlayWindow? setFirstIfTitleExist({
    required final String title,
  }) {
    CustomOverlayWindow? window =
        overlays.where((element) => element.title == title).firstOrNull;
    if (window == null) {
      return window;
    }
    SetToLast(window.chave);
    return window;
  }

  static int OpenDefaultWindows({
    required final Widget widget,
    required final String title,
    final ThemeData? theme,
  }) {
    CustomOverlayWindow? existWindow = setFirstIfTitleExist(title: title);
    if (existWindow != null) return existWindow.chave;
    Size size = MediaQuery.of(windowContext!).size;
    if (windows > 8) windows = 0;
    double right = 300 + (windows * 50);
    double width = size.width / 2.5;
    double height = size.height * 0.8;

    int chave = GetNextChave();
    final GlobalKey<CustomDefaultWindowComponentState> key =
        GlobalKey<CustomDefaultWindowComponentState>();
    CustomDefaultWindowComponent window = CustomDefaultWindowComponent(
      key: key,
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
      key: key,
      chave: chave,
      widget: window,
      ultimaEntrada: DateTime.now(),
      title: title,
    ));
    RemoverJanelsExcessivas();
    cubitOverlay.refresh();
    windows++;
    return chave;
  }
}
