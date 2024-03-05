import 'package:ageiscme_data/services/fabricante/fabricante_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class FabricantePageCubit extends Cubit<FabricantePageState> {
  final FabricanteService service;
  FabricantePageCubit({required this.service})
      : super(
          FabricantePageState(
            fabricantes: [],
            loading: false,
          ),
        );

  void loadFabricante() async {
    emit(FabricantePageState(loading: true, fabricantes: []));
    try {
      List<FabricanteModel> fabricantes = await service.GetAll();
      emit(FabricantePageState(loading: false, fabricantes: fabricantes));
    } on Exception catch (ex) {
      emit(
        FabricantePageState(
          loading: false,
          fabricantes: [],
          error: ex.toString(),
        ),
      );
    }
  }

  void delete(FabricanteModel fabricante) async {
    try {
      (String, FabricanteModel)? result = await service.delete(fabricante);
      if (result == null) return;
      emit(
        FabricantePageState(
          loading: false,
          fabricantes: state.fabricantes,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (ex) {
      emit(
        FabricantePageState(
          loading: false,
          fabricantes: state.fabricantes,
          error: ex.toString(),
        ),
      );
    }
  }
}

class FabricantePageState {
  final bool loading;
  final bool deleted;
  final List<FabricanteModel> fabricantes;
  final String error;
  final String message;

  FabricantePageState({
    required this.loading,
    required this.fabricantes,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}
