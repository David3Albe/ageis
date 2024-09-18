import 'package:ageiscme_admin/app/module/pages/colaborador/turno/cubits/turno_frm_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/turno/frm/page/turno_frm_page_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class TurnoFrmPage extends StatefulWidget {
  const TurnoFrmPage({
    required this.onSaved,
    required this.onCancel,
    required this.cod,
    super.key,
  });
  final int? cod;
  final void Function() onSaved;
  final void Function() onCancel;

  @override
  State<TurnoFrmPage> createState() => _TurnoFrmPageState();
}

class _TurnoFrmPageState extends State<TurnoFrmPage> {
  late TurnoFrmCubit cubit;

  @override
  void initState() {
    cubit = TurnoFrmCubit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cubit.load(
        cod: widget.cod,
        context: context,
      );
    });

    super.initState();
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: cubit),
      ],
      child: TurnoFrmPageWidget(
        onCancel: widget.onCancel,
        onSaved: widget.onSaved,
      ),
    );
  }
}
