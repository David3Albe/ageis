import 'package:compartilhados/componentes/grids/pluto_grid_api/enums/pluto_grid_filter_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pluto_grid_api_filter_model.g.dart';
part 'pluto_grid_api_filter_model.freezed.dart';

@unfreezed
sealed class PlutoGridApiFilterModel with _$PlutoGridApiFilterModel {
  factory PlutoGridApiFilterModel({
    required String field,
    required PlutoGridFilterType type,
    required String value,
  }) = _PlutoGridApiFilterModel;

  factory PlutoGridApiFilterModel.fromJson(Map<String, Object?> json) =>
      _$PlutoGridApiFilterModelFromJson(json);
}
