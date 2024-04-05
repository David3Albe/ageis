import 'package:ageiscme_admin/app/module/pages/insumo/solicitacao_material_expedicoes/resumo/states/form_state.dart';
import 'package:ageiscme_data/services/solicitacao_material/solicitacao_material_service.dart';
import 'package:ageiscme_models/dto/solicitacao_material/find_one/solicitacao_material_find_one_dto.dart';
import 'package:ageiscme_models/response_dto/solicitacao_material/find_one/solicitacao_material_find_one_response_dto.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class FormCubit extends Cubit<FormState> {
  FormCubit() : super(FormState());

  Future carregar(int cod) async {
    SolicitacaoMaterialService service = SolicitacaoMaterialService();
    emit(FormState(loading: true));
    (String, SolicitacaoMaterialFindOneResponseDTO)? result =
        await service.findOne(
      SolicitacaoMaterialFindOneDTO(
        cod: cod,
      ),
    );
    if (result == null) return null;
    emit(FormState(response: result.$2));
  }

  Future autorizar() async {
    SolicitacaoMaterialService service = SolicitacaoMaterialService();
  }

  Future dispensar() async {
    SolicitacaoMaterialService service = SolicitacaoMaterialService();
  }

  Future receber() async {
    SolicitacaoMaterialService service = SolicitacaoMaterialService();
  }
}
