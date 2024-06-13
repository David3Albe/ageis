import 'package:compartilhados/componentes/campos/list_field/list_field_widget.dart';
import 'package:compartilhados/componentes/diagram/custom_diagram/selected_process_type_detail/cubits/selected_cubit.dart';
import 'package:compartilhados/componentes/diagram/custom_diagram/selected_process_type_detail/states/selected_state.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class SelectedProcessTypeDetailWidget extends StatelessWidget {
  const SelectedProcessTypeDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedCubit, SelectedState>(
      builder: (context, state) {
        return ListFieldWidget<String>(
          fontSize: 12,
          itemText: (p0) => p0,
          sourceList: state.materials ?? [],
          onItemSelected: (str) => null,
          removeButton: false,
        );
      },
    );
  }
}
