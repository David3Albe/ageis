import 'package:ageiscme_data/services/epi_entrega/epi_entrega_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class EpiEntregaCubit extends Cubit<EpiEntregaState> {
  EpiEntregaCubit() : super(EpiEntregaState(itens: []));

  void loadAll() async {
    emit(EpiEntregaState(itens: state.itens, loading: true));
    List<EpiEntregaModel> epis = await EpiEntregaService().GetAll();
    emit(EpiEntregaState(itens: epis));
  }

  void clear() => emit(EpiEntregaState(itens: []));
}

class EpiEntregaState {
  bool loading;
  List<EpiEntregaModel> itens;
  EpiEntregaState({required this.itens, this.loading = false});

}
