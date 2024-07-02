import 'package:ageiscme_data/services/entrada_automatica/entrada_automatica_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class EntradaAutomaticaPageCubit extends Cubit<EntradaAutomaticaPageState> {
  final EntradaAutomaticaService service;
  final EntradaAutomaticaModel entradaAutomaticaModel;
  EntradaAutomaticaPageCubit({
    required this.service,
    required this.entradaAutomaticaModel,
  }) : super(
          EntradaAutomaticaPageState(entradaAutomatica: entradaAutomaticaModel),
        );

  Future save(EntradaAutomaticaModel entradaAutomatica) async {
    try {
      (String message, EntradaAutomaticaModel entradaAutomatica)? result =
          await service.save(entradaAutomatica);
      if (result == null) return;
      emit(
        EntradaAutomaticaPageState(
          message: result.$1,
          saved: true,
          entradaAutomatica: result.$2,
        ),
      );
    } on Exception catch (ex) {
      emit(
        EntradaAutomaticaPageState(
          error: ex.toString(),
          entradaAutomatica: entradaAutomatica,
        ),
      );
    }
  }

  void clear() {
    emit(
      EntradaAutomaticaPageState(
        entradaAutomatica: EntradaAutomaticaModel.empty(),
      ),
    );
  }
}

class EntradaAutomaticaPageState {
  final String error;
  final bool saved;
  final String message;
  final EntradaAutomaticaModel entradaAutomatica;

  EntradaAutomaticaPageState({
    required this.entradaAutomatica,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}
