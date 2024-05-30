import 'package:freezed_annotation/freezed_annotation.dart';

part 'pluto_grid_infinite_scroll_model.g.dart';
part 'pluto_grid_infinite_scroll_model.freezed.dart';

@unfreezed
sealed class PlutoGridInfiniteScrollModel with _$PlutoGridInfiniteScrollModel {
  factory PlutoGridInfiniteScrollModel({
    required bool lastRow,
    required int records,
    required List<dynamic> data,
  }) = _PlutoGridInfiniteScrollModel;

  factory PlutoGridInfiniteScrollModel.fromJson(Map<String, Object?> json) =>
      _$PlutoGridInfiniteScrollModelFromJson(json);
}
