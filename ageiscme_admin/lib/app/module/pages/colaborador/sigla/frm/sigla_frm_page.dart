import 'package:ageiscme_admin/app/module/pages/colaborador/sigla/cubits/sigla_frm_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/colaborador/sigla/frm/page/sigla_frm_page_widget.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class SiglaFrmPage extends StatefulWidget {
  const SiglaFrmPage({required this.cod, super.key});
  final int? cod;

  @override
  State<SiglaFrmPage> createState() =>
      _SiglaFrmPageState();
}

class _SiglaFrmPageState extends State<SiglaFrmPage> {
  late SiglaFrmCubit cubit;

  @override
  void initState() {
    cubit = SiglaFrmCubit();
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
      child: const SiglaFrmPageWidget(),
    );
  }
}
