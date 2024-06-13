import 'package:compartilhados/componentes/grids/pluto_grid_api/models/filter/pluto_grid_api_filter_model.dart';
import 'package:compartilhados/componentes/grids/pluto_grid_api/models/sort/pluto_grid_api_sort_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pluto_grid_api_model.g.dart';
part 'pluto_grid_api_model.freezed.dart';

@unfreezed
sealed class PlutoGridApiModel with _$PlutoGridApiModel {
  factory PlutoGridApiModel({
    required int page,
    required List<PlutoGridApiFilterModel> filters,
    required bool loadRemaining,
    PlutoGridApiSortModel? sort,
  }) = _PlutoGridApiModel;

  factory PlutoGridApiModel.fromJson(Map<String, Object?> json) =>
      _$PlutoGridApiModelFromJson(json);
}
