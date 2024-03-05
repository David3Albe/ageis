import 'package:ageiscme_data/services/destino_residuo/destino_residuo_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class DestinoResiduoPageFrmCubit extends Cubit<DestinoResiduoPageFrmState> {
  final DestinoResiduoService service;
  final DestinoResiduoModel destinoResiduoModel;
  DestinoResiduoPageFrmCubit({
    required this.service,
    required this.destinoResiduoModel,
  }) : super(
          DestinoResiduoPageFrmState(destinoResiduo: destinoResiduoModel),
        );

  void save(DestinoResiduoModel destinoResiduo) async {
    try {
      (String message, DestinoResiduoModel destinoResiduo)? result =
          await service.save(destinoResiduo);
      if (result == null) return;
      emit(
        DestinoResiduoPageFrmState(
          message: result.$1,
          saved: true,
          destinoResiduo: result.$2,
        ),
      );
    } on Exception catch (ex) {
      emit(
        DestinoResiduoPageFrmState(
          error: ex.toString(),
          destinoResiduo: destinoResiduo,
        ),
      );
    }
  }

  void clear() {
    emit(DestinoResiduoPageFrmState(destinoResiduo: DestinoResiduoModel.empty()));
  }
}

class DestinoResiduoPageFrmState {
  final String error;
  final bool saved;
  final String message;
  final DestinoResiduoModel destinoResiduo;

  DestinoResiduoPageFrmState({
    required this.destinoResiduo,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}
