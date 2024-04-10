import 'package:ageiscme_data/services/insumo_movimento/insumo_movimento_service.dart';
import 'package:ageiscme_models/dto/insumo_movimento/save/insumo_movimento_save_dto.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class InsumoMovimentoPageFrmCubit extends Cubit<InsumoMovimentoPageFrmState> {
  final InsumoMovimentoService service;
  final InsumoMovimentoModel insumoMovimentoModel;
  InsumoMovimentoPageFrmCubit({
    required this.service,
    required this.insumoMovimentoModel,
  }) : super(
          InsumoMovimentoPageFrmState(insumoMovimento: insumoMovimentoModel),
        );

  void save(
    InsumoMovimentoModel insumoMovimento,
    int? numeroSolicitacaoItem,
  ) async {
    try {
      InsumoMovimentoSaveDTO saveDTO = InsumoMovimentoSaveDTO(
        insumoMovimento: insumoMovimento,
        numeroSolicitacaoItem: numeroSolicitacaoItem,
      );
      if (insumoMovimento.cod == null) insumoMovimento.cod = 0;
      (String message, InsumoMovimentoModel insumoMovimento)? result =
          await service.save(saveDTO);
      if (result == null) return;
      emit(
        InsumoMovimentoPageFrmState(
          message: result.$1,
          saved: true,
          insumoMovimento: result.$2,
        ),
      );
    } on Exception catch (ex) {
      emit(
        InsumoMovimentoPageFrmState(
          error: ex.toString(),
          insumoMovimento: insumoMovimento,
        ),
      );
    }
  }

  void clear() {
    emit(
      InsumoMovimentoPageFrmState(
        insumoMovimento: InsumoMovimentoModel.empty(),
      ),
    );
  }
}

class InsumoMovimentoPageFrmState {
  final String error;
  final bool saved;
  final String message;
  final InsumoMovimentoModel insumoMovimento;

  InsumoMovimentoPageFrmState({
    required this.insumoMovimento,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}
