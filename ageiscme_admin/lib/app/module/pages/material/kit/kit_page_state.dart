import 'package:ageiscme_data/services/kit/kit_service.dart';
import 'package:ageiscme_models/dto/kit/kit_search/kit_search_dto.dart';
import 'package:ageiscme_models/main.dart';
import 'package:ageiscme_models/response_dto/kit/kit_search/kit_search_response_dto.dart';
import 'package:dependencias_comuns/bloc_export.dart';

class KitPageCubit extends Cubit<KitPageState> {
  final KitService service;
  KitPageCubit({required this.service})
      : super(
          KitPageState(
            response: null,
            loading: false,
          ),
        );

  void searchKits(KitSearchDTO dto) async {
    emit(KitPageState(loading: true, response: null));
    try {
      (String, KitSearchResponseDTO)? result = await service.search(dto: dto);
      emit(KitPageState(loading: false, response: result?.$2));
    } on Exception catch (ex) {
      emit(
        KitPageState(
          loading: false,
          response: null,
          error: ex.toString(),
        ),
      );
    }
  }

  void delete(KitModel kit) async {
    try {
      (String, KitModel?)? result = await service.delete(kit);
      if (result == null) return;
      emit(
        KitPageState(
          loading: false,
          response: state.response,
          deleted: true,
          message: result.$1,
        ),
      );
    } on Exception catch (ex) {
      emit(
        KitPageState(
          loading: false,
          response: state.response,
          error: ex.toString(),
        ),
      );
    }
  }
}

class KitPageState {
  final bool loading;
  final bool deleted;
  final KitSearchResponseDTO? response;
  final String error;
  final String message;

  KitPageState({
    required this.loading,
    required this.response,
    this.error = '',
    this.deleted = false,
    this.message = '',
  });
}
