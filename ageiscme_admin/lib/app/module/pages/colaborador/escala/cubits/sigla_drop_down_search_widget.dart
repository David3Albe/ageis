import 'package:ageiscme_models/response_dto/sigla/short/sigla_short_response_dto.dart';
import 'package:dependencias_comuns/dropdown_search_export.dart';
import 'package:dependencias_comuns/main.dart';
import 'package:flutter/material.dart';

class SiglaDropDownSearchWidget extends StatefulWidget {
  const SiglaDropDownSearchWidget({
    super.key,
    required this.siglasFormatas,
    required this.renderContext,
  });
  final PlutoColumnRendererContext renderContext;

  final List<SiglaShortResponseDTO> siglasFormatas;

  @override
  State<SiglaDropDownSearchWidget> createState() =>
      _SiglaDropDownSearchWidgetState();
}

class _SiglaDropDownSearchWidgetState extends State<SiglaDropDownSearchWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownSearch<SiglaShortResponseDTO>(
      onBeforeChange: (prevItem, nextItem) async {
        if (nextItem?.cod == 0) {
          setState(() {
            widget.renderContext.cell.value = null;
            PlutoGridStateManager stateManager =
                widget.renderContext.stateManager;
            stateManager.toggleSelectingRow(widget.renderContext.rowIdx);
            stateManager.toggleSelectingRow(widget.renderContext.rowIdx);
          });
          return false;
        }
        return true;
      },
      popupProps: const PopupProps.menu(
        showSearchBox: true,
      ),
      itemAsString: (item) => item.Sigla(),
      items: widget.siglasFormatas,
      onChanged: (item) {
        setState(() {
          widget.renderContext.cell.value = item;
          PlutoGridStateManager stateManager =
              widget.renderContext.stateManager;
          stateManager.toggleSelectingRow(widget.renderContext.rowIdx);
          stateManager.toggleSelectingRow(widget.renderContext.rowIdx);
        });
      },
      selectedItem: widget.renderContext.cell.value,
      filterFn: (sigla, filter) =>
          sigla.sigla.toUpperCase().contains(filter.toUpperCase()),
    );
  }
}
