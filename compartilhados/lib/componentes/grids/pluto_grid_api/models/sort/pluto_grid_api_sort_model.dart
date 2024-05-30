import 'package:compartilhados/componentes/grids/pluto_grid_api/enums/pluto_grid_order_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pluto_grid_api_sort_model.g.dart';
part 'pluto_grid_api_sort_model.freezed.dart';

@unfreezed
sealed class PlutoGridApiSortModel with _$PlutoGridApiSortModel {
  factory PlutoGridApiSortModel({
    required String field,
    required PlutoGridOrderType name,
  }) = _PlutoGridApiSortModel;

  factory PlutoGridApiSortModel.fromJson(Map<String, Object?> json) =>
      _$PlutoGridApiSortModelFromJson(json);
}
