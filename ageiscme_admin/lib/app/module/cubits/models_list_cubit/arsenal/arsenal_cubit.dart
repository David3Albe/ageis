import 'package:ageiscme_data/services/arsenal/arsenal_estoque_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class ArsenalEstoqueCubit extends Cubit<ArsenalEstoqueState> {
  ArsenalEstoqueCubit() : super(ArsenalEstoqueState(arsenaisEstoques: []));

  void loadAll() async {
    emit(ArsenalEstoqueState(arsenaisEstoques: [], loading: true));
    List<ArsenalEstoqueModel> arsenaisEstoques =
        await ArsenalEstoqueService().GetAll();
    emit(ArsenalEstoqueState(arsenaisEstoques: arsenaisEstoques, loaded: true));
  }

  void loadFilter(ArsenalEstoqueFilter filter) async {
    emit(
      ArsenalEstoqueState(
        arsenaisEstoques: [],
        loading: true,
      ),
    );
    List<ArsenalEstoqueModel> arsenaisEstoques =
        await ArsenalEstoqueService().Filter(filter);
    emit(
      ArsenalEstoqueState(
        arsenaisEstoques: arsenaisEstoques,
        loaded: true,
      ),
    );
  }

  void clear() => emit(ArsenalEstoqueState(arsenaisEstoques: []));
}

class ArsenalEstoqueState {
  List<ArsenalEstoqueModel> arsenaisEstoques;
  bool loading;
  bool loaded;

  ArsenalEstoqueState({
    required this.arsenaisEstoques,
    this.loaded = false,
    this.loading = false,
  });
}
