// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'insumo_movimento_drop_down_search_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InsumoMovimentoDropDownSearchDTO _$InsumoMovimentoDropDownSearchDTOFromJson(
    Map<String, dynamic> json) {
  return _InsumoMovimentoDropDownSearchDTO.fromJson(json);
}

/// @nodoc
mixin _$InsumoMovimentoDropDownSearchDTO {
  int get numeroRegistros => throw _privateConstructorUsedError;
  set numeroRegistros(int value) => throw _privateConstructorUsedError;
  int? get codInsumo => throw _privateConstructorUsedError;
  set codInsumo(int? value) => throw _privateConstructorUsedError;
  String? get search => throw _privateConstructorUsedError;
  set search(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InsumoMovimentoDropDownSearchDTOCopyWith<InsumoMovimentoDropDownSearchDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InsumoMovimentoDropDownSearchDTOCopyWith<$Res> {
  factory $InsumoMovimentoDropDownSearchDTOCopyWith(
          InsumoMovimentoDropDownSearchDTO value,
          $Res Function(InsumoMovimentoDropDownSearchDTO) then) =
      _$InsumoMovimentoDropDownSearchDTOCopyWithImpl<$Res,
          InsumoMovimentoDropDownSearchDTO>;
  @useResult
  $Res call({int numeroRegistros, int? codInsumo, String? search});
}

/// @nodoc
class _$InsumoMovimentoDropDownSearchDTOCopyWithImpl<$Res,
        $Val extends InsumoMovimentoDropDownSearchDTO>
    implements $InsumoMovimentoDropDownSearchDTOCopyWith<$Res> {
  _$InsumoMovimentoDropDownSearchDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numeroRegistros = null,
    Object? codInsumo = freezed,
    Object? search = freezed,
  }) {
    return _then(_value.copyWith(
      numeroRegistros: null == numeroRegistros
          ? _value.numeroRegistros
          : numeroRegistros // ignore: cast_nullable_to_non_nullable
              as int,
      codInsumo: freezed == codInsumo
          ? _value.codInsumo
          : codInsumo // ignore: cast_nullable_to_non_nullable
              as int?,
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InsumoMovimentoDropDownSearchDTOImplCopyWith<$Res>
    implements $InsumoMovimentoDropDownSearchDTOCopyWith<$Res> {
  factory _$$InsumoMovimentoDropDownSearchDTOImplCopyWith(
          _$InsumoMovimentoDropDownSearchDTOImpl value,
          $Res Function(_$InsumoMovimentoDropDownSearchDTOImpl) then) =
      __$$InsumoMovimentoDropDownSearchDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int numeroRegistros, int? codInsumo, String? search});
}

/// @nodoc
class __$$InsumoMovimentoDropDownSearchDTOImplCopyWithImpl<$Res>
    extends _$InsumoMovimentoDropDownSearchDTOCopyWithImpl<$Res,
        _$InsumoMovimentoDropDownSearchDTOImpl>
    implements _$$InsumoMovimentoDropDownSearchDTOImplCopyWith<$Res> {
  __$$InsumoMovimentoDropDownSearchDTOImplCopyWithImpl(
      _$InsumoMovimentoDropDownSearchDTOImpl _value,
      $Res Function(_$InsumoMovimentoDropDownSearchDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numeroRegistros = null,
    Object? codInsumo = freezed,
    Object? search = freezed,
  }) {
    return _then(_$InsumoMovimentoDropDownSearchDTOImpl(
      numeroRegistros: null == numeroRegistros
          ? _value.numeroRegistros
          : numeroRegistros // ignore: cast_nullable_to_non_nullable
              as int,
      codInsumo: freezed == codInsumo
          ? _value.codInsumo
          : codInsumo // ignore: cast_nullable_to_non_nullable
              as int?,
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InsumoMovimentoDropDownSearchDTOImpl
    implements _InsumoMovimentoDropDownSearchDTO {
  _$InsumoMovimentoDropDownSearchDTOImpl(
      {required this.numeroRegistros, this.codInsumo, this.search});

  factory _$InsumoMovimentoDropDownSearchDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$InsumoMovimentoDropDownSearchDTOImplFromJson(json);

  @override
  int numeroRegistros;
  @override
  int? codInsumo;
  @override
  String? search;

  @override
  String toString() {
    return 'InsumoMovimentoDropDownSearchDTO(numeroRegistros: $numeroRegistros, codInsumo: $codInsumo, search: $search)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InsumoMovimentoDropDownSearchDTOImplCopyWith<
          _$InsumoMovimentoDropDownSearchDTOImpl>
      get copyWith => __$$InsumoMovimentoDropDownSearchDTOImplCopyWithImpl<
          _$InsumoMovimentoDropDownSearchDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InsumoMovimentoDropDownSearchDTOImplToJson(
      this,
    );
  }
}

abstract class _InsumoMovimentoDropDownSearchDTO
    implements InsumoMovimentoDropDownSearchDTO {
  factory _InsumoMovimentoDropDownSearchDTO(
      {required int numeroRegistros,
      int? codInsumo,
      String? search}) = _$InsumoMovimentoDropDownSearchDTOImpl;

  factory _InsumoMovimentoDropDownSearchDTO.fromJson(
          Map<String, dynamic> json) =
      _$InsumoMovimentoDropDownSearchDTOImpl.fromJson;

  @override
  int get numeroRegistros;
  set numeroRegistros(int value);
  @override
  int? get codInsumo;
  set codInsumo(int? value);
  @override
  String? get search;
  set search(String? value);
  @override
  @JsonKey(ignore: true)
  _$$InsumoMovimentoDropDownSearchDTOImplCopyWith<
          _$InsumoMovimentoDropDownSearchDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
