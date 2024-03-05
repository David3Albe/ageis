import 'package:ageiscme_data/services/solicitacao_material/solicitacao_material_service.dart';
import 'package:ageiscme_models/models/solicitacao_material_item/solicitacao_material_item_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class SolicitacaoMaterialItemPageFrmCubit
    extends Cubit<SolicitacaoMaterialItemPageFrmState> {
  final SolicitacaoMaterialService service;
  final List<SolicitacaoMaterialItemModel> itemsList;
  SolicitacaoMaterialItemPageFrmCubit({
    required this.service,
    required this.itemsList,
  }) : super(
          SolicitacaoMaterialItemPageFrmState(
            itemsList: itemsList,
          ),
        );

  void addItemToGrid(List<SolicitacaoMaterialItemModel> updatedList) {
    emit(
      SolicitacaoMaterialItemPageFrmState(
        itemsList: updatedList,
      ),
    );
  }

  void loadItems(List<SolicitacaoMaterialItemModel> items) {
    emit(
      SolicitacaoMaterialItemPageFrmState(
        itemsList: items,
      ),
    );
  }

  void clear() {
    emit(
      SolicitacaoMaterialItemPageFrmState(
        itemsList: [],
      ),
    );
  }
}

class SolicitacaoMaterialItemPageFrmState {
  final String error;
  final bool saved;
  final String message;
  final List<SolicitacaoMaterialItemModel> itemsList;

  SolicitacaoMaterialItemPageFrmState({
    required this.itemsList,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}
