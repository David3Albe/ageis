import 'package:ageiscme_admin/app/module/pages/insumo/solicitacao_material_expedicoes/resumo/states/filter_state.dart';
import 'package:ageiscme_models/dto/solicitacao_material/search/solicitacao_material_search_dto.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit()
      : super(
          FilterState(
            dto: SolicitacaoMaterialSearchDTO(
              numeroRegistros: 500,
              ordenarPeloCodigoDecrescente: true,
            ),
          ),
        );
}
