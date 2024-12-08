import 'package:ageiscme_admin/app/module/pages/insumo/solicitacao_material_expedicoes/resumo/cubits/filter_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/solicitacao_material_expedicoes/resumo/cubits/form_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/solicitacao_material_expedicoes/resumo/cubits/search_cubit.dart';
import 'package:ageiscme_admin/app/module/pages/insumo/solicitacao_material_expedicoes/resumo/solicitacao_material_expedicoes_resumo_page.dart';
import 'package:ageiscme_models/dto/solicitacao_material/search/solicitacao_material_search_dto.dart';
import 'package:dependencias_comuns/bloc_export.dart';
import 'package:flutter/material.dart';

class SolicitacaoMaterialExpedicoesPage extends StatelessWidget {
  const SolicitacaoMaterialExpedicoesPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FilterCubit>(
          create: (context) => FilterCubit(),
        ),
        BlocProvider<SearchCubit>(
          create: (context) => SearchCubit()
            ..search(
              SolicitacaoMaterialSearchDTO(
                numeroRegistros: 500,
                ordenarPeloCodigoDecrescente: true,
              ),
            ),
        ),
        BlocProvider<FormCubit>(
          create: (context) => FormCubit(),
        ),
      ],
      child: const SolicitacaoMaterialExpedicoesResumoPage(),
    );
  }
}
