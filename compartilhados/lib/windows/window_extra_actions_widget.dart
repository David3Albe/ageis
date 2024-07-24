import 'package:compartilhados/componentes/custom_popup_menu/custom_popup_menu_widget.dart';
import 'package:compartilhados/componentes/custom_popup_menu/models/custom_popup_item_model.dart';
import 'package:compartilhados/windows/windows_helper.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class WindowExtraActions extends StatelessWidget {
  const WindowExtraActions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomOverlayCubit, CustomOverlayState>(
      bloc: WindowsHelper.cubitOverlay,
      builder: (context, state) {
        List<CustomPopupItemModel> items = [
          CustomPopupItemModel(
            text: 'Fechar Todas',
            onTap: WindowsHelper.CloseAll,
          ),
          CustomPopupItemModel(
            text: 'Cascata',
            onTap: () => WindowsHelper.Cascate(context),
          ),
          CustomPopupItemModel(
            text: 'Alinhar Lado a Lado',
            onTap: () => WindowsHelper.Horizontal(context),
          ),
          CustomPopupItemModel(
            text: 'Alinhar Horizontal',
            onTap: () => WindowsHelper.Vertical(context),
          ),
        ];
        List<CustomOverlayWindow> windows = WindowsHelper.overlays;
        windows.sort((a, b) => a.ultimaEntrada.compareTo(b.ultimaEntrada));
        int count = 1;
        for (CustomOverlayWindow window in windows) {
          items.add(
            CustomPopupItemModel(
              text: count.toString() + ' - ' + window.title,
              onTap: () => WindowsHelper.SetToLast(window.chave),
            ),
          );
          count++;
        }

        return CustomPopupMenuWidget(
          icon: const Tooltip(
            message: 'Janelas',
            child: const Icon(Icons.window_sharp),
          ),
          items: items,
          tooltip: 'Janelas',
        );
      },
    );
  }
}
