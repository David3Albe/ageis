import 'package:ageiscme_data/services/kit_descritor/kit_descritor_service.dart';
import 'package:ageiscme_models/filters/kit_descritor/kit_descritor_filter.dart';
import 'package:ageiscme_models/main.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class KitDescritorPageCubit extends Cubit<KitDescritorPageState> {
  final KitDescritorService service;
  KitDescritorPageCubit({required this.service})
      : super(
          KitDescritorPageState(
            kitsDescritor: [],
            loading: false,
          ),
        );

  Future loadKitDescritor() async {
    emit(KitDescritorPageState(loading: true, kitsDescritor: []));
    try {
      List<KitDescritorModel> kitsDescritor = await service.GetAll();
      emit(
        KitDescritorPageState(
          loading: false,
          kitsDescritor: kitsDescritor,
        ),
      );
    } on Exception catch (ex) {
      emit(
        KitDescritorPageState(
          loading: false,
          kitsDescritor: [],
          error: ex.toString(),
        ),
      );
    }
  }

    Future getScreenData(KitDescritorFilter filter) async {
    emit(KitDescritorPageState(loading: true, kitsDescritor: []));
    try {
      List<KitDescritorModel> kitsDescritor = await service.GetScreenData(filter);
      emit(
        KitDescritorPageState(
          loading: false,
          kitsDescritor: kitsDescritor,
        ),
      );
    } on Exception catch (ex) {
      emit(
        KitDescritorPageState(
          loading: false,
          kitsDescritor: [],
          error: ex.toString(),
        ),
      );
    }
  }

  void delete(KitDescritorModel kitDescritor) async {
    try {
      (String, KitDescritorModel)? result = await service.delete(kitDescritor);
      if (result == null) return;

      emit(
        KitDescritorPageState(
          loading: false,
          kitsDescritor: state.kitsDescritor,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (ex) {
      emit(
        KitDescritorPageState(
          loading: false,
          kitsDescritor: state.kitsDescritor,
          error: ex.toString(),
        ),
      );
    }
  }
}

class KitDescritorPageState {
  final bool loading;
  final bool deleted;
  final List<KitDescritorModel> kitsDescritor;
  final String error;
  final String message;

  KitDescritorPageState({
    required this.loading,
    required this.kitsDescritor,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}
