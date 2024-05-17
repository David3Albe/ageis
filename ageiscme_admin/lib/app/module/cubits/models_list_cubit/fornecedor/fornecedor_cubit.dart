import 'package:ageiscme_data/services/fornecedor/fornecedor_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class FornecedorCubit extends Cubit<FornecedorState> {
  FornecedorCubit() : super(FornecedorState(fornecedores: []));

  void loadAll() async {
    emit(
      FornecedorState(
        fornecedores: state.fornecedores,
        loading: true,
      ),
    );
    List<FornecedorModel> fornecedores = await FornecedorService().GetAll();
    emit(FornecedorState(fornecedores: fornecedores));
  }

  void clear() => emit(FornecedorState(fornecedores: []));
}

class FornecedorState {
  List<FornecedorModel> fornecedores;
  bool loading;

  FornecedorState({
    required this.fornecedores,
    this.loading = false,
  });
}
