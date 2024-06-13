// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anormalidade_tipo_short_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AnormalidadeTipoShortDTO _$AnormalidadeTipoShortDTOFromJson(
    Map<String, dynamic> json) {
  return _AnormalidadeTipoShortDTO.fromJson(json);
}

/// @nodoc
mixin _$AnormalidadeTipoShortDTO {
  String? get termoPesquisa => throw _privateConstructorUsedError;
  set termoPesquisa(String? value) => throw _privateConstructorUsedError;
  int get numeroRegistros => throw _privateConstructorUsedError;
  set numeroRegistros(int value) => throw _privateConstructorUsedError;
  bool? get ativosApenas => throw _privateConstructorUsedError;
  set ativosApenas(bool? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnormalidadeTipoShortDTOCopyWith<AnormalidadeTipoShortDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnormalidadeTipoShortDTOCopyWith<$Res> {
  factory $AnormalidadeTipoShortDTOCopyWith(AnormalidadeTipoShortDTO value,
          $Res Function(AnormalidadeTipoShortDTO) then) =
      _$AnormalidadeTipoShortDTOCopyWithImpl<$Res, AnormalidadeTipoShortDTO>;
  @useResult
  $Res call({String? termoPesquisa, int numeroRegistros, bool? ativosApenas});
}

/// @nodoc
class _$AnormalidadeTipoShortDTOCopyWithImpl<$Res,
        $Val extends AnormalidadeTipoShortDTO>
    implements $AnormalidadeTipoShortDTOCopyWith<$Res> {
  _$AnormalidadeTipoShortDTOCopyWithImpl(this._value, this._then);

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
abstract class _$$AnormalidadeTipoShortDTOImplCopyWith<$Res>
    implements $AnormalidadeTipoShortDTOCopyWith<$Res> {
  factory _$$AnormalidadeTipoShortDTOImplCopyWith(
          _$AnormalidadeTipoShortDTOImpl value,
          $Res Function(_$AnormalidadeTipoShortDTOImpl) then) =
      __$$AnormalidadeTipoShortDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? termoPesquisa, int numeroRegistros, bool? ativosApenas});
}

/// @nodoc
class __$$AnormalidadeTipoShortDTOImplCopyWithImpl<$Res>
    extends _$AnormalidadeTipoShortDTOCopyWithImpl<$Res,
        _$AnormalidadeTipoShortDTOImpl>
    implements _$$AnormalidadeTipoShortDTOImplCopyWith<$Res> {
  __$$AnormalidadeTipoShortDTOImplCopyWithImpl(
      _$AnormalidadeTipoShortDTOImpl _value,
      $Res Function(_$AnormalidadeTipoShortDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? termoPesquisa = freezed,
    Object? numeroRegistros = null,
    Object? ativosApenas = freezed,
  }) {
    return _then(_$AnormalidadeTipoShortDTOImpl(
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
class _$AnormalidadeTipoShortDTOImpl implements _AnormalidadeTipoShortDTO {
  _$AnormalidadeTipoShortDTOImpl(
      {this.termoPesquisa, required this.numeroRegistros, this.ativosApenas});

  factory _$AnormalidadeTipoShortDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnormalidadeTipoShortDTOImplFromJson(json);

  @override
  String? termoPesquisa;
  @override
  int numeroRegistros;
  @override
  bool? ativosApenas;

  @override
  String toString() {
    return 'AnormalidadeTipoShortDTO(termoPesquisa: $termoPesquisa, numeroRegistros: $numeroRegistros, ativosApenas: $ativosApenas)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnormalidadeTipoShortDTOImplCopyWith<_$AnormalidadeTipoShortDTOImpl>
      get copyWith => __$$AnormalidadeTipoShortDTOImplCopyWithImpl<
          _$AnormalidadeTipoShortDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnormalidadeTipoShortDTOImplToJson(
      this,
    );
  }
}

abstract class _AnormalidadeTipoShortDTO implements AnormalidadeTipoShortDTO {
  factory _AnormalidadeTipoShortDTO(
      {String? termoPesquisa,
      required int numeroRegistros,
      bool? ativosApenas}) = _$AnormalidadeTipoShortDTOImpl;

  factory _AnormalidadeTipoShortDTO.fromJson(Map<String, dynamic> json) =
      _$AnormalidadeTipoShortDTOImpl.fromJson;

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
  _$$AnormalidadeTipoShortDTOImplCopyWith<_$AnormalidadeTipoShortDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
