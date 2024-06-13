// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sigla_short_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SiglaShortDTO _$SiglaShortDTOFromJson(Map<String, dynamic> json) {
  return _SiglaShortDTO.fromJson(json);
}

/// @nodoc
mixin _$SiglaShortDTO {
  String? get termoPesquisa => throw _privateConstructorUsedError;
  set termoPesquisa(String? value) => throw _privateConstructorUsedError;
  int get numeroRegistros => throw _privateConstructorUsedError;
  set numeroRegistros(int value) => throw _privateConstructorUsedError;
  bool? get ativosApenas => throw _privateConstructorUsedError;
  set ativosApenas(bool? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SiglaShortDTOCopyWith<SiglaShortDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SiglaShortDTOCopyWith<$Res> {
  factory $SiglaShortDTOCopyWith(
          SiglaShortDTO value, $Res Function(SiglaShortDTO) then) =
      _$SiglaShortDTOCopyWithImpl<$Res, SiglaShortDTO>;
  @useResult
  $Res call({String? termoPesquisa, int numeroRegistros, bool? ativosApenas});
}

/// @nodoc
class _$SiglaShortDTOCopyWithImpl<$Res, $Val extends SiglaShortDTO>
    implements $SiglaShortDTOCopyWith<$Res> {
  _$SiglaShortDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? termoPesquisa = freezed,
    Object? numeroRegistros = null,
    Object? ativosApenas = freezed,
  }) {
    return _then(_value.copyWith(
      termoPesquisa: freezed == termoPesquisa
          ? _value.termoPesquisa
          : termoPesquisa // ignore: cast_nullable_to_non_nullable
              as String?,
      numeroRegistros: null == numeroRegistros
          ? _value.numeroRegistros
          : numeroRegistros // ignore: cast_nullable_to_non_nullable
              as int,
      ativosApenas: freezed == ativosApenas
          ? _value.ativosApenas
          : ativosApenas // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SiglaShortDTOImplCopyWith<$Res>
    implements $SiglaShortDTOCopyWith<$Res> {
  factory _$$SiglaShortDTOImplCopyWith(
          _$SiglaShortDTOImpl value, $Res Function(_$SiglaShortDTOImpl) then) =
      __$$SiglaShortDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? termoPesquisa, int numeroRegistros, bool? ativosApenas});
}

/// @nodoc
class __$$SiglaShortDTOImplCopyWithImpl<$Res>
    extends _$SiglaShortDTOCopyWithImpl<$Res, _$SiglaShortDTOImpl>
    implements _$$SiglaShortDTOImplCopyWith<$Res> {
  __$$SiglaShortDTOImplCopyWithImpl(
      _$SiglaShortDTOImpl _value, $Res Function(_$SiglaShortDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? termoPesquisa = freezed,
    Object? numeroRegistros = null,
    Object? ativosApenas = freezed,
  }) {
    return _then(_$SiglaShortDTOImpl(
      termoPesquisa: freezed == termoPesquisa
          ? _value.termoPesquisa
          : termoPesquisa // ignore: cast_nullable_to_non_nullable
              as String?,
      numeroRegistros: null == numeroRegistros
          ? _value.numeroRegistros
          : numeroRegistros // ignore: cast_nullable_to_non_nullable
              as int,
      ativosApenas: freezed == ativosApenas
          ? _value.ativosApenas
          : ativosApenas // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SiglaShortDTOImpl implements _SiglaShortDTO {
  _$SiglaShortDTOImpl(
      {this.termoPesquisa, required this.numeroRegistros, this.ativosApenas});

  factory _$SiglaShortDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$SiglaShortDTOImplFromJson(json);

  @override
  String? termoPesquisa;
  @override
  int numeroRegistros;
  @override
  bool? ativosApenas;

  @override
  String toString() {
    return 'SiglaShortDTO(termoPesquisa: $termoPesquisa, numeroRegistros: $numeroRegistros, ativosApenas: $ativosApenas)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SiglaShortDTOImplCopyWith<_$SiglaShortDTOImpl> get copyWith =>
      __$$SiglaShortDTOImplCopyWithImpl<_$SiglaShortDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SiglaShortDTOImplToJson(
      this,
    );
  }
}

abstract class _SiglaShortDTO implements SiglaShortDTO {
  factory _SiglaShortDTO(
      {String? termoPesquisa,
      required int numeroRegistros,
      bool? ativosApenas}) = _$SiglaShortDTOImpl;

  factory _SiglaShortDTO.fromJson(Map<String, dynamic> json) =
      _$SiglaShortDTOImpl.fromJson;

  @override
  String? get termoPesquisa;
  set termoPesquisa(String? value);
  @override
  int get numeroRegistros;
  set numeroRegistros(int value);
  @override
  bool? get ativosApenas;
  set ativosApenas(bool? value);
  @override
  @JsonKey(ignore: true)
  _$$SiglaShortDTOImplCopyWith<_$SiglaShortDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
