// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'turno_short_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TurnoShortDTO _$TurnoShortDTOFromJson(Map<String, dynamic> json) {
  return _TurnoShortDTO.fromJson(json);
}

/// @nodoc
mixin _$TurnoShortDTO {
  String? get termoPesquisa => throw _privateConstructorUsedError;
  set termoPesquisa(String? value) => throw _privateConstructorUsedError;
  int get numeroRegistros => throw _privateConstructorUsedError;
  set numeroRegistros(int value) => throw _privateConstructorUsedError;
  bool? get ativosApenas => throw _privateConstructorUsedError;
  set ativosApenas(bool? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TurnoShortDTOCopyWith<TurnoShortDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TurnoShortDTOCopyWith<$Res> {
  factory $TurnoShortDTOCopyWith(
          TurnoShortDTO value, $Res Function(TurnoShortDTO) then) =
      _$TurnoShortDTOCopyWithImpl<$Res, TurnoShortDTO>;
  @useResult
  $Res call({String? termoPesquisa, int numeroRegistros, bool? ativosApenas});
}

/// @nodoc
class _$TurnoShortDTOCopyWithImpl<$Res, $Val extends TurnoShortDTO>
    implements $TurnoShortDTOCopyWith<$Res> {
  _$TurnoShortDTOCopyWithImpl(this._value, this._then);

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
abstract class _$$TurnoShortDTOImplCopyWith<$Res>
    implements $TurnoShortDTOCopyWith<$Res> {
  factory _$$TurnoShortDTOImplCopyWith(
          _$TurnoShortDTOImpl value, $Res Function(_$TurnoShortDTOImpl) then) =
      __$$TurnoShortDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? termoPesquisa, int numeroRegistros, bool? ativosApenas});
}

/// @nodoc
class __$$TurnoShortDTOImplCopyWithImpl<$Res>
    extends _$TurnoShortDTOCopyWithImpl<$Res, _$TurnoShortDTOImpl>
    implements _$$TurnoShortDTOImplCopyWith<$Res> {
  __$$TurnoShortDTOImplCopyWithImpl(
      _$TurnoShortDTOImpl _value, $Res Function(_$TurnoShortDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? termoPesquisa = freezed,
    Object? numeroRegistros = null,
    Object? ativosApenas = freezed,
  }) {
    return _then(_$TurnoShortDTOImpl(
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
class _$TurnoShortDTOImpl implements _TurnoShortDTO {
  _$TurnoShortDTOImpl(
      {this.termoPesquisa, required this.numeroRegistros, this.ativosApenas});

  factory _$TurnoShortDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$TurnoShortDTOImplFromJson(json);

  @override
  String? termoPesquisa;
  @override
  int numeroRegistros;
  @override
  bool? ativosApenas;

  @override
  String toString() {
    return 'TurnoShortDTO(termoPesquisa: $termoPesquisa, numeroRegistros: $numeroRegistros, ativosApenas: $ativosApenas)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TurnoShortDTOImplCopyWith<_$TurnoShortDTOImpl> get copyWith =>
      __$$TurnoShortDTOImplCopyWithImpl<_$TurnoShortDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TurnoShortDTOImplToJson(
      this,
    );
  }
}

abstract class _TurnoShortDTO implements TurnoShortDTO {
  factory _TurnoShortDTO(
      {String? termoPesquisa,
      required int numeroRegistros,
      bool? ativosApenas}) = _$TurnoShortDTOImpl;

  factory _TurnoShortDTO.fromJson(Map<String, dynamic> json) =
      _$TurnoShortDTOImpl.fromJson;

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
  _$$TurnoShortDTOImplCopyWith<_$TurnoShortDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
