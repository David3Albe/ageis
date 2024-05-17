// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consulta_item_etiqueta_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConsultaItemEtiquetaFilter _$ConsultaItemEtiquetaFilterFromJson(
    Map<String, dynamic> json) {
  return _ConsultaItemEtiquetaFilter.fromJson(json);
}

/// @nodoc
mixin _$ConsultaItemEtiquetaFilter {
  DateTime? get startDate => throw _privateConstructorUsedError;
  set startDate(DateTime? value) => throw _privateConstructorUsedError;
  DateTime? get finalDate => throw _privateConstructorUsedError;
  set finalDate(DateTime? value) => throw _privateConstructorUsedError;
  int? get codProprietario => throw _privateConstructorUsedError;
  set codProprietario(int? value) => throw _privateConstructorUsedError;
  int? get codItemDescritor => throw _privateConstructorUsedError;
  set codItemDescritor(int? value) => throw _privateConstructorUsedError;
  int? get codKit => throw _privateConstructorUsedError;
  set codKit(int? value) => throw _privateConstructorUsedError;
  String? get idEtiqueta => throw _privateConstructorUsedError;
  set idEtiqueta(String? value) => throw _privateConstructorUsedError;
  bool? get descartar => throw _privateConstructorUsedError;
  set descartar(bool? value) => throw _privateConstructorUsedError;
  String? get codBarraKitContem => throw _privateConstructorUsedError;
  set codBarraKitContem(String? value) => throw _privateConstructorUsedError;
  ItemDescritorDropDownSearchResponseDTO? get itemDescritor =>
      throw _privateConstructorUsedError;
  set itemDescritor(ItemDescritorDropDownSearchResponseDTO? value) =>
      throw _privateConstructorUsedError;
  int? get numeroRegistros => throw _privateConstructorUsedError;
  set numeroRegistros(int? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConsultaItemEtiquetaFilterCopyWith<ConsultaItemEtiquetaFilter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultaItemEtiquetaFilterCopyWith<$Res> {
  factory $ConsultaItemEtiquetaFilterCopyWith(ConsultaItemEtiquetaFilter value,
          $Res Function(ConsultaItemEtiquetaFilter) then) =
      _$ConsultaItemEtiquetaFilterCopyWithImpl<$Res,
          ConsultaItemEtiquetaFilter>;
  @useResult
  $Res call(
      {DateTime? startDate,
      DateTime? finalDate,
      int? codProprietario,
      int? codItemDescritor,
      int? codKit,
      String? idEtiqueta,
      bool? descartar,
      String? codBarraKitContem,
      ItemDescritorDropDownSearchResponseDTO? itemDescritor,
      int? numeroRegistros});

  $ItemDescritorDropDownSearchResponseDTOCopyWith<$Res>? get itemDescritor;
}

/// @nodoc
class _$ConsultaItemEtiquetaFilterCopyWithImpl<$Res,
        $Val extends ConsultaItemEtiquetaFilter>
    implements $ConsultaItemEtiquetaFilterCopyWith<$Res> {
  _$ConsultaItemEtiquetaFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = freezed,
    Object? finalDate = freezed,
    Object? codProprietario = freezed,
    Object? codItemDescritor = freezed,
    Object? codKit = freezed,
    Object? idEtiqueta = freezed,
    Object? descartar = freezed,
    Object? codBarraKitContem = freezed,
    Object? itemDescritor = freezed,
    Object? numeroRegistros = freezed,
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
      codProprietario: freezed == codProprietario
          ? _value.codProprietario
          : codProprietario // ignore: cast_nullable_to_non_nullable
              as int?,
      codItemDescritor: freezed == codItemDescritor
          ? _value.codItemDescritor
          : codItemDescritor // ignore: cast_nullable_to_non_nullable
              as int?,
      codKit: freezed == codKit
          ? _value.codKit
          : codKit // ignore: cast_nullable_to_non_nullable
              as int?,
      idEtiqueta: freezed == idEtiqueta
          ? _value.idEtiqueta
          : idEtiqueta // ignore: cast_nullable_to_non_nullable
              as String?,
      descartar: freezed == descartar
          ? _value.descartar
          : descartar // ignore: cast_nullable_to_non_nullable
              as bool?,
      codBarraKitContem: freezed == codBarraKitContem
          ? _value.codBarraKitContem
          : codBarraKitContem // ignore: cast_nullable_to_non_nullable
              as String?,
      itemDescritor: freezed == itemDescritor
          ? _value.itemDescritor
          : itemDescritor // ignore: cast_nullable_to_non_nullable
              as ItemDescritorDropDownSearchResponseDTO?,
      numeroRegistros: freezed == numeroRegistros
          ? _value.numeroRegistros
          : numeroRegistros // ignore: cast_nullable_to_non_nullable
              as int?,
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
}

/// @nodoc
abstract class _$$ConsultaItemEtiquetaFilterImplCopyWith<$Res>
    implements $ConsultaItemEtiquetaFilterCopyWith<$Res> {
  factory _$$ConsultaItemEtiquetaFilterImplCopyWith(
          _$ConsultaItemEtiquetaFilterImpl value,
          $Res Function(_$ConsultaItemEtiquetaFilterImpl) then) =
      __$$ConsultaItemEtiquetaFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? startDate,
      DateTime? finalDate,
      int? codProprietario,
      int? codItemDescritor,
      int? codKit,
      String? idEtiqueta,
      bool? descartar,
      String? codBarraKitContem,
      ItemDescritorDropDownSearchResponseDTO? itemDescritor,
      int? numeroRegistros});

  @override
  $ItemDescritorDropDownSearchResponseDTOCopyWith<$Res>? get itemDescritor;
}

/// @nodoc
class __$$ConsultaItemEtiquetaFilterImplCopyWithImpl<$Res>
    extends _$ConsultaItemEtiquetaFilterCopyWithImpl<$Res,
        _$ConsultaItemEtiquetaFilterImpl>
    implements _$$ConsultaItemEtiquetaFilterImplCopyWith<$Res> {
  __$$ConsultaItemEtiquetaFilterImplCopyWithImpl(
      _$ConsultaItemEtiquetaFilterImpl _value,
      $Res Function(_$ConsultaItemEtiquetaFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = freezed,
    Object? finalDate = freezed,
    Object? codProprietario = freezed,
    Object? codItemDescritor = freezed,
    Object? codKit = freezed,
    Object? idEtiqueta = freezed,
    Object? descartar = freezed,
    Object? codBarraKitContem = freezed,
    Object? itemDescritor = freezed,
    Object? numeroRegistros = freezed,
  }) {
    return _then(_$ConsultaItemEtiquetaFilterImpl(
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      finalDate: freezed == finalDate
          ? _value.finalDate
          : finalDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      codProprietario: freezed == codProprietario
          ? _value.codProprietario
          : codProprietario // ignore: cast_nullable_to_non_nullable
              as int?,
      codItemDescritor: freezed == codItemDescritor
          ? _value.codItemDescritor
          : codItemDescritor // ignore: cast_nullable_to_non_nullable
              as int?,
      codKit: freezed == codKit
          ? _value.codKit
          : codKit // ignore: cast_nullable_to_non_nullable
              as int?,
      idEtiqueta: freezed == idEtiqueta
          ? _value.idEtiqueta
          : idEtiqueta // ignore: cast_nullable_to_non_nullable
              as String?,
      descartar: freezed == descartar
          ? _value.descartar
          : descartar // ignore: cast_nullable_to_non_nullable
              as bool?,
      codBarraKitContem: freezed == codBarraKitContem
          ? _value.codBarraKitContem
          : codBarraKitContem // ignore: cast_nullable_to_non_nullable
              as String?,
      itemDescritor: freezed == itemDescritor
          ? _value.itemDescritor
          : itemDescritor // ignore: cast_nullable_to_non_nullable
              as ItemDescritorDropDownSearchResponseDTO?,
      numeroRegistros: freezed == numeroRegistros
          ? _value.numeroRegistros
          : numeroRegistros // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsultaItemEtiquetaFilterImpl extends _ConsultaItemEtiquetaFilter {
  _$ConsultaItemEtiquetaFilterImpl(
      {required this.startDate,
      required this.finalDate,
      required this.codProprietario,
      required this.codItemDescritor,
      required this.codKit,
      required this.idEtiqueta,
      required this.descartar,
      this.codBarraKitContem,
      this.itemDescritor,
      this.numeroRegistros})
      : super._();

  factory _$ConsultaItemEtiquetaFilterImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ConsultaItemEtiquetaFilterImplFromJson(json);

  @override
  DateTime? startDate;
  @override
  DateTime? finalDate;
  @override
  int? codProprietario;
  @override
  int? codItemDescritor;
  @override
  int? codKit;
  @override
  String? idEtiqueta;
  @override
  bool? descartar;
  @override
  String? codBarraKitContem;
  @override
  ItemDescritorDropDownSearchResponseDTO? itemDescritor;
  @override
  int? numeroRegistros;

  @override
  String toString() {
    return 'ConsultaItemEtiquetaFilter(startDate: $startDate, finalDate: $finalDate, codProprietario: $codProprietario, codItemDescritor: $codItemDescritor, codKit: $codKit, idEtiqueta: $idEtiqueta, descartar: $descartar, codBarraKitContem: $codBarraKitContem, itemDescritor: $itemDescritor, numeroRegistros: $numeroRegistros)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsultaItemEtiquetaFilterImplCopyWith<_$ConsultaItemEtiquetaFilterImpl>
      get copyWith => __$$ConsultaItemEtiquetaFilterImplCopyWithImpl<
          _$ConsultaItemEtiquetaFilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsultaItemEtiquetaFilterImplToJson(
      this,
    );
  }
}

abstract class _ConsultaItemEtiquetaFilter extends ConsultaItemEtiquetaFilter {
  factory _ConsultaItemEtiquetaFilter(
      {required DateTime? startDate,
      required DateTime? finalDate,
      required int? codProprietario,
      required int? codItemDescritor,
      required int? codKit,
      required String? idEtiqueta,
      required bool? descartar,
      String? codBarraKitContem,
      ItemDescritorDropDownSearchResponseDTO? itemDescritor,
      int? numeroRegistros}) = _$ConsultaItemEtiquetaFilterImpl;
  _ConsultaItemEtiquetaFilter._() : super._();

  factory _ConsultaItemEtiquetaFilter.fromJson(Map<String, dynamic> json) =
      _$ConsultaItemEtiquetaFilterImpl.fromJson;

  @override
  DateTime? get startDate;
  set startDate(DateTime? value);
  @override
  DateTime? get finalDate;
  set finalDate(DateTime? value);
  @override
  int? get codProprietario;
  set codProprietario(int? value);
  @override
  int? get codItemDescritor;
  set codItemDescritor(int? value);
  @override
  int? get codKit;
  set codKit(int? value);
  @override
  String? get idEtiqueta;
  set idEtiqueta(String? value);
  @override
  bool? get descartar;
  set descartar(bool? value);
  @override
  String? get codBarraKitContem;
  set codBarraKitContem(String? value);
  @override
  ItemDescritorDropDownSearchResponseDTO? get itemDescritor;
  set itemDescritor(ItemDescritorDropDownSearchResponseDTO? value);
  @override
  int? get numeroRegistros;
  set numeroRegistros(int? value);
  @override
  @JsonKey(ignore: true)
  _$$ConsultaItemEtiquetaFilterImplCopyWith<_$ConsultaItemEtiquetaFilterImpl>
      get copyWith => throw _privateConstructorUsedError;
}
