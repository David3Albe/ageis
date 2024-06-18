import 'package:ageiscme_admin/app/module/cubits/models_list_cubit/turno/turno_short_response_cubit.dart';
import 'package:ageiscme_models/response_dto/turno/short/turno_short_response_dto.dart';
import 'package:compartilhados/componentes/botoes/cancel_button_unfilled_widget.dart';
import 'package:compartilhados/componentes/botoes/confirm_button_widget.dart';
import 'package:compartilhados/componentes/campos/drop_down_search_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class EscalaGridPageAdicionarTurnoWidget extends StatefulWidget {
  const EscalaGridPageAdicionarTurnoWidget({super.key});

  @override
  State<EscalaGridPageAdicionarTurnoWidget> createState() =>
      _EscalaGridPageAdicionarTurnoWidgetState();
}

class _EscalaGridPageAdicionarTurnoWidgetState
    extends State<EscalaGridPageAdicionarTurnoWidget> {
  TurnoShortResponseDTO? dto;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      title: const Text('Seleção de Turno'),
      content: Container(
        constraints: const BoxConstraints(
          minHeight: 400,
          maxHeight: 600,
          maxWidth: 800,
          minWidth: 500,
        ),
        height: size.height * 0.4,
        width: size.width * 0.5,
        child: Column(
          children: [
            DropDownSearchWidget(
              placeholder: 'Turno',
              expandOnStart: true,
              initialValue: dto,
              textFunction: (p0) => p0.Descricao(),
              sourceList: BlocProvider.of<TurnoShortResponseCubit>(context)
                  .state
                  .turnos,
              onChanged: (value) => dto = value,
            ),
            const Padding(padding: EdgeInsets.only(top: 16)),
            Row(
              children: [
                const Spacer(),
                CancelButtonUnfilledWidget(
                  onPressed: () => Navigator.of(context).pop(null),
                ),
                const Padding(padding: EdgeInsets.only(left: 8)),
                ConfirmButtonWidget(
                  onPressed: () => Navigator.of(context).pop(dto),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
