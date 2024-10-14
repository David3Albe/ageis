import 'package:ageiscme_data/services/registro_servico/registro_servico_service.dart';
import 'package:ageiscme_models/filters/registro_servico/registro_servico_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/response_dto/registro_servico/search_dto/registro_servico_search_dto_response_dto.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class RegistroServicoPageCubit extends Cubit<RegistroServicoPageState> {
  final RegistroServicoService service;
  RegistroServicoPageCubit({required this.service})
      : super(
          RegistroServicoPageState(
            registrosServicos: [],
            loading: false,
          ),
        );

  void loadRegistroServicoFilter(RegistroServicoFilter filter) async {
    emit(
      RegistroServicoPageState(
        loading: true,
        registrosServicos: [],
      ),
    );
    try {
      List<RegistroServicoSearchResponseDTO>? itens = await service.Search(filter);
      emit(
        RegistroServicoPageState(
          loading: false,
          registrosServicos: itens,
        ),
      );
    } on Exception catch (ex) {
      emit(
        RegistroServicoPageState(
          loading: false,
          registrosServicos: [],
          error: ex.toString(),
        ),
      );
    }
  }

  void delete(RegistroServicoSearchResponseDTO registroServico) async {
    try {
      (String, RegistroServicoModel)? result =
          await service.delete(registroServico);
      if (result == null) return;
      emit(
        RegistroServicoPageState(
          loading: false,
          registrosServicos: state.registrosServicos,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (ex) {
      emit(
        RegistroServicoPageState(
          loading: false,
          registrosServicos: state.registrosServicos,
          error: ex.toString(),
        ),
      );
    }
  }
}

class RegistroServicoPageState {
  final bool loading;
  final bool deleted;
  final List<RegistroServicoSearchResponseDTO> registrosServicos;
  final String error;
  final String message;

  RegistroServicoPageState({
    required this.loading,
    required this.registrosServicos,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}
