import 'package:ageiscme_data/services/tipo_afastamento/tipo_afastamento_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class TipoAfastamentoCubit extends Cubit<TipoAfastamentoState> {
  TipoAfastamentoCubit() : super(TipoAfastamentoState(tiposAfastamento: []));

  void loadAll() async {
    emit(TipoAfastamentoState(tiposAfastamento: state.tiposAfastamento, loading: true));
    emit(TipoAfastamentoState(tiposAfastamento: await TipoAfastamentoService().GetAll()));
  }

  void clear() => emit(TipoAfastamentoState(tiposAfastamento: []));
}

class TipoAfastamentoState {
  bool loading;
  List<TipoAfastamentoModel> tiposAfastamento;

  TipoAfastamentoState({
    required this.tiposAfastamento,
    this.loading = false,
  });
}
