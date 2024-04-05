import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class InsumoSelecionadoCubit extends Cubit<InsumoSelecionadoState> {
  InsumoSelecionadoCubit()
      : super(
          InsumoSelecionadoState(),
        );

  void set(InsumoModel? insumo) {
    emit(
      InsumoSelecionadoState(
        insumo: insumo,
      ),
    );
  }
}

class InsumoSelecionadoState {
  final InsumoModel? insumo;

  InsumoSelecionadoState({
    this.insumo,
  });
}
