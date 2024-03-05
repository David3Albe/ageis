import 'package:ageiscme_data/services/solicitacao_material/solicitacao_material_service.dart';
import 'package:ageiscme_models/models/solicitacao_material/solicitacao_material_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class SolicitacaoMaterialPageCubit extends Cubit<SolicitacaoMaterialPageState> {
  final SolicitacaoMaterialService service;
  final SolicitacaoMaterialModel solicitacaoMaterialModel;
  SolicitacaoMaterialPageCubit({
    required this.service,
    required this.solicitacaoMaterialModel,
  }) : super(
          SolicitacaoMaterialPageState(
            solicitacaoMaterial: solicitacaoMaterialModel,
          ),
        );

  void save(SolicitacaoMaterialModel solicitacaoMaterial) async {
    try {
      (String message, SolicitacaoMaterialModel solicitacaoMaterial)? result =
          await service.save(solicitacaoMaterial);
      if (result == null) return;
      emit(
        SolicitacaoMaterialPageState(
          message: result.$1,
          saved: true,
          solicitacaoMaterial: result.$2,
        ),
      );
    } on Exception catch (ex) {
      emit(
        SolicitacaoMaterialPageState(
          error: ex.toString(),
          solicitacaoMaterial: solicitacaoMaterial,
        ),
      );
    }
  }

  void clear() {
    emit(
      SolicitacaoMaterialPageState(
        solicitacaoMaterial: SolicitacaoMaterialModel.empty(),
      ),
    );
  }
}

class SolicitacaoMaterialPageState {
  final String error;
  final bool saved;
  final String message;
  final SolicitacaoMaterialModel solicitacaoMaterial;

  SolicitacaoMaterialPageState({
    required this.solicitacaoMaterial,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}
