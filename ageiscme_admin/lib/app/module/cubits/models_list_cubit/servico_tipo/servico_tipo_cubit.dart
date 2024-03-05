import 'package:ageiscme_data/services/servico_tipo/servico_tipo_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ServicoTipoCubit extends Cubit<ServicoTipoState> {
  ServicoTipoCubit() : super(ServicoTipoState(tiposServico: []));

  void loadAll() async {
    emit(ServicoTipoState(tiposServico: [], loading: true));
    List<ServicoTipoModel> servicosTipo = await ServicoTipoService().GetAll();
    emit(ServicoTipoState(tiposServico: servicosTipo));
  }

  void clear() => emit(ServicoTipoState(tiposServico: []));

  void reload() => emit(
        ServicoTipoState(
          tiposServico: state.tiposServico,
          loading: state.loading,
        ),
      );
}

class ServicoTipoState {
  List<ServicoTipoModel> tiposServico;
  bool loading;

  ServicoTipoState({required this.tiposServico, this.loading = false});
}
