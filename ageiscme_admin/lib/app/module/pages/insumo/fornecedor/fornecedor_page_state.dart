import 'package:ageiscme_data/services/fornecedor/fornecedor_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class FornecedorPageCubit extends Cubit<FornecedorPageState> {
  final FornecedorService service;
  FornecedorPageCubit({required this.service})
      : super(
          FornecedorPageState(
            fornecedores: [],
            loading: false,
          ),
        );

  void loadFornecedor() async {
    emit(FornecedorPageState(loading: true, fornecedores: []));
    try {
      List<FornecedorModel> fornecedores = await service.GetAll();
      emit(FornecedorPageState(loading: false, fornecedores: fornecedores));
    } on Exception catch (ex) {
      emit(
        FornecedorPageState(
          loading: false,
          fornecedores: [],
          error: ex.toString(),
        ),
      );
    }
  }

  void delete(FornecedorModel fornecedor) async {
    try {
      (String, FornecedorModel)? result = await service.delete(fornecedor);
      if (result == null) return;
      emit(
        FornecedorPageState(
          loading: false,
          fornecedores: state.fornecedores,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (ex) {
      emit(
        FornecedorPageState(
          loading: false,
          fornecedores: state.fornecedores,
          error: ex.toString(),
        ),
      );
    }
  }
}

class FornecedorPageState {
  final bool loading;
  final bool deleted;
  final List<FornecedorModel> fornecedores;
  final String error;
  final String message;

  FornecedorPageState({
    required this.loading,
    required this.fornecedores,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}
