import 'package:ageiscme_login/app/module/cubits/module_selection/module_selection_cubit.dart';
import 'package:compartilhados/cores/cores.dart';
import 'package:compartilhados/fontes/fontes.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class ModuleSelectionCardWidget extends StatelessWidget {
  const ModuleSelectionCardWidget({
    required this.text,
    required this.icon,
    required this.onTap,
    Key? key,
  });

  final String text;
  final Icon icon;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    double scale = MediaQuery.of(context).size.width / 1920;
    return BlocProvider(
      create: (context) => ModuleSelectionCubit(),
      child: Builder(
        builder: (context) {
          bool hovered = context.watch<ModuleSelectionCubit>().state.hover;
          return InkWell(
            onTap: onTap,
            onHover: (bool hover) =>
                context.read<ModuleSelectionCubit>().changeHover(hover),
            child: Container(
              decoration: hovered
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: hovered ? Cores.corModuloSelecionado : null,
                      boxShadow: const [
                        BoxShadow(
                          color: Cores.corSombraModuloSelecionado,
                          blurRadius: 4.0,
                          spreadRadius: 0.0,
                          offset: Offset(0.0, 1.0),
                        ),
                      ],
                    )
                  : null,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.01,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon.icon,
                      size: icon.size,
                      color:
                          !hovered ? Cores.corModuloNaoSelecionado : icon.color,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20 * scale),
                      child: Text(
                        text,
                        style: Fontes.getRoboto(
                          cor: !hovered ? Cores.corModuloNaoSelecionado : null,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
