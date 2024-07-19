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

  Future reload() async {
    List<ServicoTipoModel> servicos = state.tiposServico;
    emit(
      ServicoTipoState(
        tiposServico: [],
        loading: true,
      ),
    );
    await Future.delayed(const Duration(milliseconds: 100));
    emit(
      ServicoTipoState(
        tiposServico: servicos,
        reloaded: true,
      ),
    );
  }
}

class ServicoTipoState {
  List<ServicoTipoModel> tiposServico;
  bool loading;
  bool reloaded;

  ServicoTipoState({
    required this.tiposServico,
    this.loading = false,
    this.reloaded = false,
  });
}
