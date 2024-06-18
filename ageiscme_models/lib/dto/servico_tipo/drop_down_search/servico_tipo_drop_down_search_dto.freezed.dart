// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'servico_tipo_drop_down_search_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ServicoTipoDropDownSearchDTO _$ServicoTipoDropDownSearchDTOFromJson(
    Map<String, dynamic> json) {
  return _ServicoTipoDropDownSearchDTO.fromJson(json);
}

/// @nodoc
mixin _$ServicoTipoDropDownSearchDTO {
  int get numeroRegistros => throw _privateConstructorUsedError;
  set numeroRegistros(int value) => throw _privateConstructorUsedError;
  String? get search => throw _privateConstructorUsedError;
  set search(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServicoTipoDropDownSearchDTOCopyWith<ServicoTipoDropDownSearchDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServicoTipoDropDownSearchDTOCopyWith<$Res> {
  factory $ServicoTipoDropDownSearchDTOCopyWith(
          ServicoTipoDropDownSearchDTO value,
          $Res Function(ServicoTipoDropDownSearchDTO) then) =
      _$ServicoTipoDropDownSearchDTOCopyWithImpl<$Res,
          ServicoTipoDropDownSearchDTO>;
  @useResult
  $Res call({int numeroRegistros, String? search});
}

/// @nodoc
class _$ServicoTipoDropDownSearchDTOCopyWithImpl<$Res,
        $Val extends ServicoTipoDropDownSearchDTO>
    implements $ServicoTipoDropDownSearchDTOCopyWith<$Res> {
  _$ServicoTipoDropDownSearchDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numeroRegistros = null,
    Object? search = freezed,
  }) {
    return _then(_value.copyWith(
      numeroRegistros: null == numeroRegistros
          ? _value.numeroRegistros
          : numeroRegistros // ignore: cast_nullable_to_non_nullable
              as int,
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServicoTipoDropDownSearchDTOImplCopyWith<$Res>
    implements $ServicoTipoDropDownSearchDTOCopyWith<$Res> {
  factory _$$ServicoTipoDropDownSearchDTOImplCopyWith(
          _$ServicoTipoDropDownSearchDTOImpl value,
          $Res Function(_$ServicoTipoDropDownSearchDTOImpl) then) =
      __$$ServicoTipoDropDownSearchDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int numeroRegistros, String? search});
}

/// @nodoc
class __$$ServicoTipoDropDownSearchDTOImplCopyWithImpl<$Res>
    extends _$ServicoTipoDropDownSearchDTOCopyWithImpl<$Res,
        _$ServicoTipoDropDownSearchDTOImpl>
    implements _$$ServicoTipoDropDownSearchDTOImplCopyWith<$Res> {
  __$$ServicoTipoDropDownSearchDTOImplCopyWithImpl(
      _$ServicoTipoDropDownSearchDTOImpl _value,
      $Res Function(_$ServicoTipoDropDownSearchDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numeroRegistros = null,
    Object? search = freezed,
  }) {
    return _then(_$ServicoTipoDropDownSearchDTOImpl(
      numeroRegistros: null == numeroRegistros
          ? _value.numeroRegistros
          : numeroRegistros // ignore: cast_nullable_to_non_nullable
              as int,
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServicoTipoDropDownSearchDTOImpl
    implements _ServicoTipoDropDownSearchDTO {
  _$ServicoTipoDropDownSearchDTOImpl(
      {required this.numeroRegistros, this.search});

  factory _$ServicoTipoDropDownSearchDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ServicoTipoDropDownSearchDTOImplFromJson(json);

  @override
  int numeroRegistros;
  @override
  String? search;

  @override
  String toString() {
    return 'ServicoTipoDropDownSearchDTO(numeroRegistros: $numeroRegistros, search: $search)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServicoTipoDropDownSearchDTOImplCopyWith<
          _$ServicoTipoDropDownSearchDTOImpl>
      get copyWith => __$$ServicoTipoDropDownSearchDTOImplCopyWithImpl<
          _$ServicoTipoDropDownSearchDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServicoTipoDropDownSearchDTOImplToJson(
      this,
    );
  }
}

abstract class _ServicoTipoDropDownSearchDTO
    implements ServicoTipoDropDownSearchDTO {
  factory _ServicoTipoDropDownSearchDTO(
      {required int numeroRegistros,
      String? search}) = _$ServicoTipoDropDownSearchDTOImpl;

  factory _ServicoTipoDropDownSearchDTO.fromJson(Map<String, dynamic> json) =
      _$ServicoTipoDropDownSearchDTOImpl.fromJson;

  @override
  int get numeroRegistros;
  set numeroRegistros(int value);
  @override
  String? get search;
  set search(String? value);
  @override
  @JsonKey(ignore: true)
  _$$ServicoTipoDropDownSearchDTOImplCopyWith<
          _$ServicoTipoDropDownSearchDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
