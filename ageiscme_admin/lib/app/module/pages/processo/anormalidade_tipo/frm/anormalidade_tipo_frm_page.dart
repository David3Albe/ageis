import 'package:ageiscme_admin/app/module/pages/processo/anormalidade_tipo/cubits/anormalidade_tipo_frm_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/processo/anormalidade_tipo/frm/page/anormalidade_tipo_frm_page.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class AnormalidadeTipoFrmPage extends StatefulWidget {
  const AnormalidadeTipoFrmPage({
    required this.cod,
    required this.onSaved,
    required this.onCancel,
    super.key,
  });
  final int? cod;
  final void Function() onSaved;
  final void Function() onCancel;

  @override
  State<AnormalidadeTipoFrmPage> createState() =>
      _AnormalidadeTipoFrmPageState();
}

class _AnormalidadeTipoFrmPageState extends State<AnormalidadeTipoFrmPage> {
  late AnormalidadeTipoFrmCubit cubit;

  @override
  void initState() {
    cubit = AnormalidadeTipoFrmCubit();
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
      child: AnormalidadeTipoFrmPageWidget(
        onCancel: widget.onCancel,
        onSaved: widget.onSaved,
      ),
    );
  }
}
