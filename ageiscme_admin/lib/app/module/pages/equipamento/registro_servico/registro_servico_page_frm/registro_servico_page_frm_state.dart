import 'package:ageiscme_data/services/registro_servico/registro_servico_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class RegistroServicoPageFrmCubit extends Cubit<RegistroServicoPageFrmState> {
  final RegistroServicoService service;
  final RegistroServicoModel registroServicoModel;
  RegistroServicoPageFrmCubit({
    required this.service,
    required this.registroServicoModel,
  }) : super(
          RegistroServicoPageFrmState(registroServico: registroServicoModel),
        );

  void save(RegistroServicoModel registroServico) async {
    try {
      (String message, RegistroServicoModel registroServico)? result =
          await service.save(registroServico);
      if (result == null) return;

      emit(
        RegistroServicoPageFrmState(
          message: result.$1,
          saved: true,
          registroServico: result.$2,
        ),
      );
    } on Exception catch (ex) {
      emit(
        RegistroServicoPageFrmState(
          error: ex.toString(),
          registroServico: registroServico,
        ),
      );
    }
  }

  void clear() {
    // emit(
    //   RegistroServicoPageFrmState(
    //     registroServico: RegistroServicoModel.empty(),
    //   ),
    // );
  }
}

class RegistroServicoPageFrmState {
  final String error;
  final bool saved;
  final String message;
  final RegistroServicoModel registroServico;

  RegistroServicoPageFrmState({
    required this.registroServico,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}
