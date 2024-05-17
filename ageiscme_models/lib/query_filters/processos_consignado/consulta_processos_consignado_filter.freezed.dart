// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consulta_processos_consignado_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConsultaProcessosConsignadoFilter _$ConsultaProcessosConsignadoFilterFromJson(
    Map<String, dynamic> json) {
  return _ConsultaProcessosConsignadoFilter.fromJson(json);
}

/// @nodoc
mixin _$ConsultaProcessosConsignadoFilter {
  DateTime? get startDate => throw _privateConstructorUsedError;
  set startDate(DateTime? value) => throw _privateConstructorUsedError;
  DateTime? get finalDate => throw _privateConstructorUsedError;
  set finalDate(DateTime? value) => throw _privateConstructorUsedError;
  int? get codItemDescritor => throw _privateConstructorUsedError;
  set codItemDescritor(int? value) => throw _privateConstructorUsedError;
  int? get codItemConsignado => throw _privateConstructorUsedError;
  set codItemConsignado(int? value) => throw _privateConstructorUsedError;
  String? get idEtiquetaContem => throw _privateConstructorUsedError;
  set idEtiquetaContem(String? value) => throw _privateConstructorUsedError;
  int? get codProprietario => throw _privateConstructorUsedError;
  set codProprietario(int? value) => throw _privateConstructorUsedError;
  bool? get consignado => throw _privateConstructorUsedError;
  set consignado(bool? value) => throw _privateConstructorUsedError;
  ItemDescritorDropDownSearchResponseDTO? get itemDescritor =>
      throw _privateConstructorUsedError;
  set itemDescritor(ItemDescritorDropDownSearchResponseDTO? value) =>
      throw _privateConstructorUsedError;
  ItemModel? get item => throw _privateConstructorUsedError;
  set item(ItemModel? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConsultaProcessosConsignadoFilterCopyWith<ConsultaProcessosConsignadoFilter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultaProcessosConsignadoFilterCopyWith<$Res> {
  factory $ConsultaProcessosConsignadoFilterCopyWith(
          ConsultaProcessosConsignadoFilter value,
          $Res Function(ConsultaProcessosConsignadoFilter) then) =
      _$ConsultaProcessosConsignadoFilterCopyWithImpl<$Res,
          ConsultaProcessosConsignadoFilter>;
  @useResult
  $Res call(
      {DateTime? startDate,
      DateTime? finalDate,
      int? codItemDescritor,
      int? codItemConsignado,
      String? idEtiquetaContem,
      int? codProprietario,
      bool? consignado,
      ItemDescritorDropDownSearchResponseDTO? itemDescritor,
      ItemModel? item});

  $ItemDescritorDropDownSearchResponseDTOCopyWith<$Res>? get itemDescritor;
  $ItemModelCopyWith<$Res>? get item;
}

/// @nodoc
class _$ConsultaProcessosConsignadoFilterCopyWithImpl<$Res,
        $Val extends ConsultaProcessosConsignadoFilter>
    implements $ConsultaProcessosConsignadoFilterCopyWith<$Res> {
  _$ConsultaProcessosConsignadoFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = freezed,
    Object? finalDate = freezed,
    Object? codItemDescritor = freezed,
    Object? codItemConsignado = freezed,
    Object? idEtiquetaContem = freezed,
    Object? codProprietario = freezed,
    Object? consignado = freezed,
    Object? itemDescritor = freezed,
    Object? item = freezed,
  }) {
    return _then(_value.copyWith(
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      finalDate: freezed == finalDate
          ? _value.finalDate
          : finalDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      codItemDescritor: freezed == codItemDescritor
          ? _value.codItemDescritor
          : codItemDescritor // ignore: cast_nullable_to_non_nullable
              as int?,
      codItemConsignado: freezed == codItemConsignado
          ? _value.codItemConsignado
          : codItemConsignado // ignore: cast_nullable_to_non_nullable
              as int?,
      idEtiquetaContem: freezed == idEtiquetaContem
          ? _value.idEtiquetaContem
          : idEtiquetaContem // ignore: cast_nullable_to_non_nullable
              as String?,
      codProprietario: freezed == codProprietario
          ? _value.codProprietario
          : codProprietario // ignore: cast_nullable_to_non_nullable
              as int?,
      consignado: freezed == consignado
          ? _value.consignado
          : consignado // ignore: cast_nullable_to_non_nullable
              as bool?,
      itemDescritor: freezed == itemDescritor
          ? _value.itemDescritor
          : itemDescritor // ignore: cast_nullable_to_non_nullable
              as ItemDescritorDropDownSearchResponseDTO?,
      item: freezed == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as ItemModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ItemDescritorDropDownSearchResponseDTOCopyWith<$Res>? get itemDescritor {
    if (_value.itemDescritor == null) {
      return null;
    }

    return $ItemDescritorDropDownSearchResponseDTOCopyWith<$Res>(
        _value.itemDescritor!, (value) {
      return _then(_value.copyWith(itemDescritor: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ItemModelCopyWith<$Res>? get item {
    if (_value.item == null) {
      return null;
    }

    return $ItemModelCopyWith<$Res>(_value.item!, (value) {
      return _then(_value.copyWith(item: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ConsultaProcessosConsignadoFilterImplCopyWith<$Res>
    implements $ConsultaProcessosConsignadoFilterCopyWith<$Res> {
  factory _$$ConsultaProcessosConsignadoFilterImplCopyWith(
          _$ConsultaProcessosConsignadoFilterImpl value,
          $Res Function(_$ConsultaProcessosConsignadoFilterImpl) then) =
      __$$ConsultaProcessosConsignadoFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? startDate,
      DateTime? finalDate,
      int? codItemDescritor,
      int? codItemConsignado,
      String? idEtiquetaContem,
      int? codProprietario,
      bool? consignado,
      ItemDescritorDropDownSearchResponseDTO? itemDescritor,
      ItemModel? item});

  @override
  $ItemDescritorDropDownSearchResponseDTOCopyWith<$Res>? get itemDescritor;
  @override
  $ItemModelCopyWith<$Res>? get item;
}

/// @nodoc
class __$$ConsultaProcessosConsignadoFilterImplCopyWithImpl<$Res>
    extends _$ConsultaProcessosConsignadoFilterCopyWithImpl<$Res,
        _$ConsultaProcessosConsignadoFilterImpl>
    implements _$$ConsultaProcessosConsignadoFilterImplCopyWith<$Res> {
  __$$ConsultaProcessosConsignadoFilterImplCopyWithImpl(
      _$ConsultaProcessosConsignadoFilterImpl _value,
      $Res Function(_$ConsultaProcessosConsignadoFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = freezed,
    Object? finalDate = freezed,
    Object? codItemDescritor = freezed,
    Object? codItemConsignado = freezed,
    Object? idEtiquetaContem = freezed,
    Object? codProprietario = freezed,
    Object? consignado = freezed,
    Object? itemDescritor = freezed,
    Object? item = freezed,
  }) {
    return _then(_$ConsultaProcessosConsignadoFilterImpl(
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      finalDate: freezed == finalDate
          ? _value.finalDate
          : finalDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      codItemDescritor: freezed == codItemDescritor
          ? _value.codItemDescritor
          : codItemDescritor // ignore: cast_nullable_to_non_nullable
              as int?,
      codItemConsignado: freezed == codItemConsignado
          ? _value.codItemConsignado
          : codItemConsignado // ignore: cast_nullable_to_non_nullable
              as int?,
      idEtiquetaContem: freezed == idEtiquetaContem
          ? _value.idEtiquetaContem
          : idEtiquetaContem // ignore: cast_nullable_to_non_nullable
              as String?,
      codProprietario: freezed == codProprietario
          ? _value.codProprietario
          : codProprietario // ignore: cast_nullable_to_non_nullable
              as int?,
      consignado: freezed == consignado
          ? _value.consignado
          : consignado // ignore: cast_nullable_to_non_nullable
              as bool?,
      itemDescritor: freezed == itemDescritor
          ? _value.itemDescritor
          : itemDescritor // ignore: cast_nullable_to_non_nullable
              as ItemDescritorDropDownSearchResponseDTO?,
      item: freezed == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as ItemModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsultaProcessosConsignadoFilterImpl
    extends _ConsultaProcessosConsignadoFilter {
  _$ConsultaProcessosConsignadoFilterImpl(
      {required this.startDate,
      required this.finalDate,
      required this.codItemDescritor,
      required this.codItemConsignado,
      required this.idEtiquetaContem,
      required this.codProprietario,
      required this.consignado,
      this.itemDescritor,
      this.item})
      : super._();

  factory _$ConsultaProcessosConsignadoFilterImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ConsultaProcessosConsignadoFilterImplFromJson(json);

  @override
  DateTime? startDate;
  @override
  DateTime? finalDate;
  @override
  int? codItemDescritor;
  @override
  int? codItemConsignado;
  @override
  String? idEtiquetaContem;
  @override
  int? codProprietario;
  @override
  bool? consignado;
  @override
  ItemDescritorDropDownSearchResponseDTO? itemDescritor;
  @override
  ItemModel? item;

  @override
  String toString() {
    return 'ConsultaProcessosConsignadoFilter(startDate: $startDate, finalDate: $finalDate, codItemDescritor: $codItemDescritor, codItemConsignado: $codItemConsignado, idEtiquetaContem: $idEtiquetaContem, codProprietario: $codProprietario, consignado: $consignado, itemDescritor: $itemDescritor, item: $item)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsultaProcessosConsignadoFilterImplCopyWith<
          _$ConsultaProcessosConsignadoFilterImpl>
      get copyWith => __$$ConsultaProcessosConsignadoFilterImplCopyWithImpl<
          _$ConsultaProcessosConsignadoFilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsultaProcessosConsignadoFilterImplToJson(
      this,
    );
  }
}

abstract class _ConsultaProcessosConsignadoFilter
    extends ConsultaProcessosConsignadoFilter {
  factory _ConsultaProcessosConsignadoFilter(
      {required DateTime? startDate,
      required DateTime? finalDate,
      required int? codItemDescritor,
      required int? codItemConsignado,
      required String? idEtiquetaContem,
      required int? codProprietario,
      required bool? consignado,
      ItemDescritorDropDownSearchResponseDTO? itemDescritor,
      ItemModel? item}) = _$ConsultaProcessosConsignadoFilterImpl;
  _ConsultaProcessosConsignadoFilter._() : super._();

  factory _ConsultaProcessosConsignadoFilter.fromJson(
          Map<String, dynamic> json) =
      _$ConsultaProcessosConsignadoFilterImpl.fromJson;

  @override
  DateTime? get startDate;
  set startDate(DateTime? value);
  @override
  DateTime? get finalDate;
  set finalDate(DateTime? value);
  @override
  int? get codItemDescritor;
  set codItemDescritor(int? value);
  @override
  int? get codItemConsignado;
  set codItemConsignado(int? value);
  @override
  String? get idEtiquetaContem;
  set idEtiquetaContem(String? value);
  @override
  int? get codProprietario;
  set codProprietario(int? value);
  @override
  bool? get consignado;
  set consignado(bool? value);
  @override
  ItemDescritorDropDownSearchResponseDTO? get itemDescritor;
  set itemDescritor(ItemDescritorDropDownSearchResponseDTO? value);
  @override
  ItemModel? get item;
  set item(ItemModel? value);
  @override
  @JsonKey(ignore: true)
  _$$ConsultaProcessosConsignadoFilterImplCopyWith<
          _$ConsultaProcessosConsignadoFilterImpl>
      get copyWith => throw _privateConstructorUsedError;
}
