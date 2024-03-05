import 'package:ageiscme_data/services/localizacao_arsenal/localizacao_arsenal_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class LocalizacaoArsenalPageFrmCubit
    extends Cubit<LocalizacaoArsenalPageFrmState> {
  final LocalizacaoArsenalService service;
  final LocalizacaoArsenalModel localizacaoArsenalModel;
  LocalizacaoArsenalPageFrmCubit({
    required this.service,
    required this.localizacaoArsenalModel,
  }) : super(
          LocalizacaoArsenalPageFrmState(
            localizacaoArsenal: localizacaoArsenalModel,
          ),
        );

  void save(LocalizacaoArsenalModel localizacaoArsenal) async {
    try {
      (String message, LocalizacaoArsenalModel localizacaoArsenal)? result =
          await service.save(localizacaoArsenal);
      if (result == null) return;

      emit(
        LocalizacaoArsenalPageFrmState(
          message: result.$1,
          saved: true,
          localizacaoArsenal: result.$2,
        ),
      );
    } on Exception catch (ex) {
      emit(
        LocalizacaoArsenalPageFrmState(
          error: ex.toString(),
          localizacaoArsenal: localizacaoArsenal,
        ),
      );
    }
  }

  void clear() {
    emit(
      LocalizacaoArsenalPageFrmState(
        localizacaoArsenal: LocalizacaoArsenalModel.empty(),
      ),
    );
  }
}

class LocalizacaoArsenalPageFrmState {
  final String error;
  final bool saved;
  final String message;
  final LocalizacaoArsenalModel localizacaoArsenal;

  LocalizacaoArsenalPageFrmState({
    required this.localizacaoArsenal,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}
