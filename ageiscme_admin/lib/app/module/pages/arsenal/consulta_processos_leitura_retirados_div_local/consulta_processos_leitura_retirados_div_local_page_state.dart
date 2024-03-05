import 'package:dependencias_comuns/bloc_export.dart';
import 'package:ageiscme_models/query_models/processos_leitura_retirados_div_local/consulta_processos_leitura_retirados_div_local_model.dart';
import 'package:ageiscme_models/query_filters/processos_leitura_retirados_div_local/consulta_processos_leitura_retirados_div_local_filter.dart';
import 'package:ageiscme_data/query_services/processos_leitura_retirados_div_local/consulta_processos_leitura_retirados_div_local_service.dart';

class ConsultaProcessosLeituraRetiradosDivLocalPageCubit
    extends Cubit<ConsultaProcessosLeituraRetiradosDivLocalPageState> {
  final ConsultaProcessosLeituraRetiradosDivLocalService service;
  ConsultaProcessosLeituraRetiradosDivLocalPageCubit({required this.service})
      : super(
          ConsultaProcessosLeituraRetiradosDivLocalPageState(
            processosLeiturasRetiradosDivLocais: [],
            loading: false,
          ),
        );

  void loadMotivoProcessosLeituraRetiradosDivLocal(
    ConsultaProcessosLeituraRetiradosDivLocalFilter filter,
  ) async {
    emit(
      ConsultaProcessosLeituraRetiradosDivLocalPageState(
        loading: true,
        processosLeiturasRetiradosDivLocais: [],
      ),
    );
    try {
      (String, List<ConsultaProcessosLeituraRetiradosDivLocalModel>)? itens =
          await service.filter(
        filter,
      );
      if (itens == null) return;

      List<ConsultaProcessosLeituraRetiradosDivLocalModel>
          processosLeiturasRetiradosDivLocais = itens.$2;
      emit(
        ConsultaProcessosLeituraRetiradosDivLocalPageState(
          loading: false,
          processosLeiturasRetiradosDivLocais:
              processosLeiturasRetiradosDivLocais,
        ),
      );
    } on Exception catch (ex) {
      emit(
        ConsultaProcessosLeituraRetiradosDivLocalPageState(
          loading: false,
          processosLeiturasRetiradosDivLocais: [],
          error: ex.toString(),
        ),
      );
    }
  }
}

class ConsultaProcessosLeituraRetiradosDivLocalPageState {
  final bool loading;
  final List<ConsultaProcessosLeituraRetiradosDivLocalModel>
      processosLeiturasRetiradosDivLocais;
  final String error;
  final String message;

  ConsultaProcessosLeituraRetiradosDivLocalPageState({
    required this.loading,
    required this.processosLeiturasRetiradosDivLocais,
    this.error = '',
    this.message = '',
  });
}
