import 'package:ageiscme_data/services/destino_residuo/destino_residuo_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class DestinoResiduoPageCubit extends Cubit<DestinoResiduoPageState> {
  final DestinoResiduoService service;
  DestinoResiduoPageCubit({required this.service})
      : super(
          DestinoResiduoPageState(
            destinosResiduo: [],
            loading: false,
          ),
        );

  void loadDestinoResiduo() async {
    emit(DestinoResiduoPageState(loading: true, destinosResiduo: []));
    try {
      List<DestinoResiduoModel> destinosResiduo = await service.GetAll();
      emit(
        DestinoResiduoPageState(
          loading: false,
          destinosResiduo: destinosResiduo,
        ),
      );
    } on Exception catch (ex) {
      emit(
        DestinoResiduoPageState(
          loading: false,
          destinosResiduo: [],
          error: ex.toString(),
        ),
      );
    }
  }

  void delete(DestinoResiduoModel destinoResiduo) async {
    try {
      (String, DestinoResiduoModel)? result =
          await service.delete(destinoResiduo);
      if (result == null) return;

      emit(
        DestinoResiduoPageState(
          loading: false,
          destinosResiduo: state.destinosResiduo,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (ex) {
      emit(
        DestinoResiduoPageState(
          loading: false,
          destinosResiduo: state.destinosResiduo,
          error: ex.toString(),
        ),
      );
    }
  }
}

class DestinoResiduoPageState {
  final bool loading;
  final bool deleted;
  final List<DestinoResiduoModel> destinosResiduo;
  final String error;
  final String message;

  DestinoResiduoPageState({
    required this.loading,
    required this.destinosResiduo,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}
