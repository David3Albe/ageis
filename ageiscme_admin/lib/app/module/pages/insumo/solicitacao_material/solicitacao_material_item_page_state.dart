import 'package:ageiscme_data/services/solicitacao_material/solicitacao_material_service.dart';
import 'package:ageiscme_models/models/solicitacao_material_item/solicitacao_material_item_model.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class SolicitacaoMaterialItemPageCubit
    extends Cubit<SolicitacaoMaterialItemPageState> {
  final SolicitacaoMaterialService service;

  SolicitacaoMaterialItemPageCubit({
    required this.service,
    required List<SolicitacaoMaterialItemModel> itemsList,
  }) : super(
          SolicitacaoMaterialItemPageState(
            itemsList: itemsList,
          ),
        );

  void addItem(SolicitacaoMaterialItemModel item) {
    emit(
      SolicitacaoMaterialItemPageState(
        itemsList: [...state.itemsList, item],
      ),
    );
  }

  void removeItem(SolicitacaoMaterialItemModel item) {
    List<SolicitacaoMaterialItemModel> items = state.itemsList.where((e) => e != item).toList();
    emit(
      SolicitacaoMaterialItemPageState(
        itemsList: items,
      ),
    );
  }

  void clearItems() {
    emit(
      SolicitacaoMaterialItemPageState(
        itemsList: [],
      ),
    );
  }

  void loadItems(List<SolicitacaoMaterialItemModel> items) {
    emit(
      SolicitacaoMaterialItemPageState(
        itemsList: items,
      ),
    );
  }
}

class SolicitacaoMaterialItemPageState {
  late List<SolicitacaoMaterialItemModel> itemsList;
  final bool loading;

  SolicitacaoMaterialItemPageState({
    required this.itemsList,
    this.loading = false,
  });
}
