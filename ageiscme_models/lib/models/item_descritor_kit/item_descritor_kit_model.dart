import 'package:ageiscme_models/response_dto/item_descritor/drop_down_search/item_descritor_drop_down_search_response_dto.dart';
import 'package:ageiscme_models/response_dto/kit_descritor/drop_down_search/kit_descritor_drop_down_search_response_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_descritor_kit_model.g.dart';
part 'item_descritor_kit_model.freezed.dart';

@unfreezed
abstract class ItemDescritorKitModel with _$ItemDescritorKitModel {
  factory ItemDescritorKitModel({
    required int? cod,
    required int? codDescritorKit,
    required int? codDescritorItem,
    required int? quantidade,
    required int? codInstituicao,
    required DateTime? ultimaAlteracao,
    @JsonKey(name: 'tStamp') required String? tstamp,
     KitDescritorDropDownSearchResponseDTO? kitDescritor,
     ItemDescritorDropDownSearchResponseDTO? itemDescritor,
  }) = _ItemDescritorKitModel;

  factory ItemDescritorKitModel.fromJson(Map<String, Object?> json) =>
      _$ItemDescritorKitModelFromJson(json);

  static ItemDescritorKitModel copy(ItemDescritorKitModel itemDescritorKit) =>
      ItemDescritorKitModel.fromJson(itemDescritorKit.toJson());

  factory ItemDescritorKitModel.empty() => ItemDescritorKitModel(
        cod: 0,
        codDescritorKit: 0,
        codDescritorItem: 0,
        quantidade: null,
        codInstituicao: 0,
        ultimaAlteracao: null,
        tstamp: '',
      );
}
