// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'atestado_saude_ocupacional_exame_query_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AtestadoSaudeOcupacionalExameQueryResponseDTO
    _$AtestadoSaudeOcupacionalExameQueryResponseDTOFromJson(
        Map<String, dynamic> json) {
  return _AtestadoSaudeOcupacionalExameQueryResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$AtestadoSaudeOcupacionalExameQueryResponseDTO {
  List<AtestadoSaudeOcupacionalExameQueryItemResponseDTO> get itens =>
      throw _privateConstructorUsedError;
  set itens(List<AtestadoSaudeOcupacionalExameQueryItemResponseDTO> value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AtestadoSaudeOcupacionalExameQueryResponseDTOCopyWith<
          AtestadoSaudeOcupacionalExameQueryResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AtestadoSaudeOcupacionalExameQueryResponseDTOCopyWith<$Res> {
  factory $AtestadoSaudeOcupacionalExameQueryResponseDTOCopyWith(
          AtestadoSaudeOcupacionalExameQueryResponseDTO value,
          $Res Function(AtestadoSaudeOcupacionalExameQueryResponseDTO) then) =
      _$AtestadoSaudeOcupacionalExameQueryResponseDTOCopyWithImpl<$Res,
          AtestadoSaudeOcupacionalExameQueryResponseDTO>;
  @useResult
  $Res call({List<AtestadoSaudeOcupacionalExameQueryItemResponseDTO> itens});
}

/// @nodoc
class _$AtestadoSaudeOcupacionalExameQueryResponseDTOCopyWithImpl<$Res,
        $Val extends AtestadoSaudeOcupacionalExameQueryResponseDTO>
    implements $AtestadoSaudeOcupacionalExameQueryResponseDTOCopyWith<$Res> {
  _$AtestadoSaudeOcupacionalExameQueryResponseDTOCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itens = null,
  }) {
    return _then(_value.copyWith(
      itens: null == itens
          ? _value.itens
          : itens // ignore: cast_nullable_to_non_nullable
              as List<AtestadoSaudeOcupacionalExameQueryItemResponseDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AtestadoSaudeOcupacionalExameQueryResponseDTOImplCopyWith<
        $Res>
    implements $AtestadoSaudeOcupacionalExameQueryResponseDTOCopyWith<$Res> {
  factory _$$AtestadoSaudeOcupacionalExameQueryResponseDTOImplCopyWith(
          _$AtestadoSaudeOcupacionalExameQueryResponseDTOImpl value,
          $Res Function(_$AtestadoSaudeOcupacionalExameQueryResponseDTOImpl)
              then) =
      __$$AtestadoSaudeOcupacionalExameQueryResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AtestadoSaudeOcupacionalExameQueryItemResponseDTO> itens});
}

/// @nodoc
class __$$AtestadoSaudeOcupacionalExameQueryResponseDTOImplCopyWithImpl<$Res>
    extends _$AtestadoSaudeOcupacionalExameQueryResponseDTOCopyWithImpl<$Res,
        _$AtestadoSaudeOcupacionalExameQueryResponseDTOImpl>
    implements
        _$$AtestadoSaudeOcupacionalExameQueryResponseDTOImplCopyWith<$Res> {
  __$$AtestadoSaudeOcupacionalExameQueryResponseDTOImplCopyWithImpl(
      _$AtestadoSaudeOcupacionalExameQueryResponseDTOImpl _value,
      $Res Function(_$AtestadoSaudeOcupacionalExameQueryResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itens = null,
  }) {
    return _then(_$AtestadoSaudeOcupacionalExameQueryResponseDTOImpl(
      itens: null == itens
          ? _value.itens
          : itens // ignore: cast_nullable_to_non_nullable
              as List<AtestadoSaudeOcupacionalExameQueryItemResponseDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AtestadoSaudeOcupacionalExameQueryResponseDTOImpl
    implements _AtestadoSaudeOcupacionalExameQueryResponseDTO {
  _$AtestadoSaudeOcupacionalExameQueryResponseDTOImpl({required this.itens});

  factory _$AtestadoSaudeOcupacionalExameQueryResponseDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AtestadoSaudeOcupacionalExameQueryResponseDTOImplFromJson(json);

  @override
  List<AtestadoSaudeOcupacionalExameQueryItemResponseDTO> itens;

  @override
  String toString() {
    return 'AtestadoSaudeOcupacionalExameQueryResponseDTO(itens: $itens)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AtestadoSaudeOcupacionalExameQueryResponseDTOImplCopyWith<
          _$AtestadoSaudeOcupacionalExameQueryResponseDTOImpl>
      get copyWith =>
          __$$AtestadoSaudeOcupacionalExameQueryResponseDTOImplCopyWithImpl<
                  _$AtestadoSaudeOcupacionalExameQueryResponseDTOImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AtestadoSaudeOcupacionalExameQueryResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _AtestadoSaudeOcupacionalExameQueryResponseDTO
    implements AtestadoSaudeOcupacionalExameQueryResponseDTO {
  factory _AtestadoSaudeOcupacionalExameQueryResponseDTO(
      {required List<AtestadoSaudeOcupacionalExameQueryItemResponseDTO>
          itens}) = _$AtestadoSaudeOcupacionalExameQueryResponseDTOImpl;

  factory _AtestadoSaudeOcupacionalExameQueryResponseDTO.fromJson(
          Map<String, dynamic> json) =
      _$AtestadoSaudeOcupacionalExameQueryResponseDTOImpl.fromJson;

  @override
  List<AtestadoSaudeOcupacionalExameQueryItemResponseDTO> get itens;
  set itens(List<AtestadoSaudeOcupacionalExameQueryItemResponseDTO> value);
  @override
  @JsonKey(ignore: true)
  _$$AtestadoSaudeOcupacionalExameQueryResponseDTOImplCopyWith<
          _$AtestadoSaudeOcupacionalExameQueryResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
