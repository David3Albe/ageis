import 'package:ageiscme_data/services/motivo_remover_repor_item/motivo_remover_repor_item_service.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class MotivoRemoverReporItemPageFrmCubit
    extends Cubit<MotivoRemoverReporItemPageFrmState> {
  final MotivoRemoverReporItemService service;
  final MotivoRemoverReporItemModel motivoRemoverReporItemModel;
  MotivoRemoverReporItemPageFrmCubit({
    required this.service,
    required this.motivoRemoverReporItemModel,
  }) : super(
          MotivoRemoverReporItemPageFrmState(
            motivoRemoverReporItem: motivoRemoverReporItemModel,
          ),
        );

  void save(MotivoRemoverReporItemModel motivoRemoverReporItem) async {
    try {
      (
        String message,
        MotivoRemoverReporItemModel motivoRemoverReporItem
      )? result = await service.save(motivoRemoverReporItem);
      if (result == null) return;

      emit(
        MotivoRemoverReporItemPageFrmState(
          message: result.$1,
          saved: true,
          motivoRemoverReporItem: result.$2,
        ),
      );
    } on Exception catch (ex) {
      emit(
        MotivoRemoverReporItemPageFrmState(
          error: ex.toString(),
          motivoRemoverReporItem: motivoRemoverReporItem,
        ),
      );
    }
  }

  void clear() {
    emit(
      MotivoRemoverReporItemPageFrmState(
        motivoRemoverReporItem: MotivoRemoverReporItemModel.empty(),
      ),
    );
  }
}

class MotivoRemoverReporItemPageFrmState {
  final String error;
  final bool saved;
  final String message;
  final MotivoRemoverReporItemModel motivoRemoverReporItem;

  MotivoRemoverReporItemPageFrmState({
    required this.motivoRemoverReporItem,
    this.error = '',
    this.saved = false,
    this.message = '',
  });
}
