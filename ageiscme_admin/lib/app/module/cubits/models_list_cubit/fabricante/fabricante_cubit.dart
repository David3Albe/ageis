import 'package:ageiscme_data/services/fabricante/fabricante_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class FabricanteCubit extends Cubit<FabricanteState> {
  FabricanteCubit() : super(FabricanteState(fabricantes: []));

  void loadAll() async {
    emit(
      FabricanteState(
        fabricantes: state.fabricantes,
        loading: true,
      ),
    );
    List<FabricanteModel> fabricantes = await FabricanteService().GetAll();
    emit(FabricanteState(fabricantes: fabricantes));
  }

  void clear() => emit(FabricanteState(fabricantes: []));
}

class FabricanteState {
  List<FabricanteModel> fabricantes;
  bool loading;

  FabricanteState({
    required this.fabricantes,
    this.loading = false,
  });
}
