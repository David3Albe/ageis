// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'processo_leitura_cancelamento_preparo_search_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProcessoLeituraCancelamentoPreparoSearchResponseDTO
    _$ProcessoLeituraCancelamentoPreparoSearchResponseDTOFromJson(
        Map<String, dynamic> json) {
  return _ProcessoLeituraCancelamentoPreparoSearchResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$ProcessoLeituraCancelamentoPreparoSearchResponseDTO {
  List<ProcessoLeituraCancelamentoPreparoSearchLeituraResponseDTO>
      get leituras => throw _privateConstructorUsedError;
  set leituras(
          List<ProcessoLeituraCancelamentoPreparoSearchLeituraResponseDTO>
              value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProcessoLeituraCancelamentoPreparoSearchResponseDTOCopyWith<
          ProcessoLeituraCancelamentoPreparoSearchResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcessoLeituraCancelamentoPreparoSearchResponseDTOCopyWith<
    $Res> {
  factory $ProcessoLeituraCancelamentoPreparoSearchResponseDTOCopyWith(
          ProcessoLeituraCancelamentoPreparoSearchResponseDTO value,
          $Res Function(ProcessoLeituraCancelamentoPreparoSearchResponseDTO)
              then) =
      _$ProcessoLeituraCancelamentoPreparoSearchResponseDTOCopyWithImpl<$Res,
          ProcessoLeituraCancelamentoPreparoSearchResponseDTO>;
  @useResult
  $Res call(
      {List<ProcessoLeituraCancelamentoPreparoSearchLeituraResponseDTO>
          leituras});
}

/// @nodoc
class _$ProcessoLeituraCancelamentoPreparoSearchResponseDTOCopyWithImpl<$Res,
        $Val extends ProcessoLeituraCancelamentoPreparoSearchResponseDTO>
    implements
        $ProcessoLeituraCancelamentoPreparoSearchResponseDTOCopyWith<$Res> {
  _$ProcessoLeituraCancelamentoPreparoSearchResponseDTOCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? leituras = null,
  }) {
    return _then(_value.copyWith(
      leituras: null == leituras
          ? _value.leituras
          : leituras // ignore: cast_nullable_to_non_nullable
              as List<
                  ProcessoLeituraCancelamentoPreparoSearchLeituraResponseDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProcessoLeituraCancelamentoPreparoSearchResponseDTOImplCopyWith<
        $Res>
    implements
        $ProcessoLeituraCancelamentoPreparoSearchResponseDTOCopyWith<$Res> {
  factory _$$ProcessoLeituraCancelamentoPreparoSearchResponseDTOImplCopyWith(
          _$ProcessoLeituraCancelamentoPreparoSearchResponseDTOImpl value,
          $Res Function(
                  _$ProcessoLeituraCancelamentoPreparoSearchResponseDTOImpl)
              then) =
      __$$ProcessoLeituraCancelamentoPreparoSearchResponseDTOImplCopyWithImpl<
          $Res>;
  @override
  @useResult
  $Res call(
      {List<ProcessoLeituraCancelamentoPreparoSearchLeituraResponseDTO>
          leituras});
}

/// @nodoc
class __$$ProcessoLeituraCancelamentoPreparoSearchResponseDTOImplCopyWithImpl<
        $Res>
    extends _$ProcessoLeituraCancelamentoPreparoSearchResponseDTOCopyWithImpl<
        $Res, _$ProcessoLeituraCancelamentoPreparoSearchResponseDTOImpl>
    implements
        _$$ProcessoLeituraCancelamentoPreparoSearchResponseDTOImplCopyWith<
            $Res> {
  __$$ProcessoLeituraCancelamentoPreparoSearchResponseDTOImplCopyWithImpl(
      _$ProcessoLeituraCancelamentoPreparoSearchResponseDTOImpl _value,
      $Res Function(_$ProcessoLeituraCancelamentoPreparoSearchResponseDTOImpl)
          _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? leituras = null,
  }) {
    return _then(_$ProcessoLeituraCancelamentoPreparoSearchResponseDTOImpl(
      leituras: null == leituras
          ? _value.leituras
          : leituras // ignore: cast_nullable_to_non_nullable
              as List<
                  ProcessoLeituraCancelamentoPreparoSearchLeituraResponseDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProcessoLeituraCancelamentoPreparoSearchResponseDTOImpl
    with DiagnosticableTreeMixin
    implements _ProcessoLeituraCancelamentoPreparoSearchResponseDTO {
  _$ProcessoLeituraCancelamentoPreparoSearchResponseDTOImpl(
      {required this.leituras});

  factory _$ProcessoLeituraCancelamentoPreparoSearchResponseDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ProcessoLeituraCancelamentoPreparoSearchResponseDTOImplFromJson(json);

  @override
  List<ProcessoLeituraCancelamentoPreparoSearchLeituraResponseDTO> leituras;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProcessoLeituraCancelamentoPreparoSearchResponseDTO(leituras: $leituras)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'ProcessoLeituraCancelamentoPreparoSearchResponseDTO'))
      ..add(DiagnosticsProperty('leituras', leituras));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcessoLeituraCancelamentoPreparoSearchResponseDTOImplCopyWith<
          _$ProcessoLeituraCancelamentoPreparoSearchResponseDTOImpl>
      get copyWith =>
          __$$ProcessoLeituraCancelamentoPreparoSearchResponseDTOImplCopyWithImpl<
                  _$ProcessoLeituraCancelamentoPreparoSearchResponseDTOImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProcessoLeituraCancelamentoPreparoSearchResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _ProcessoLeituraCancelamentoPreparoSearchResponseDTO
    implements ProcessoLeituraCancelamentoPreparoSearchResponseDTO {
  factory _ProcessoLeituraCancelamentoPreparoSearchResponseDTO(
          {required List<
                  ProcessoLeituraCancelamentoPreparoSearchLeituraResponseDTO>
              leituras}) =
      _$ProcessoLeituraCancelamentoPreparoSearchResponseDTOImpl;

  factory _ProcessoLeituraCancelamentoPreparoSearchResponseDTO.fromJson(
          Map<String, dynamic> json) =
      _$ProcessoLeituraCancelamentoPreparoSearchResponseDTOImpl.fromJson;

  @override
  List<ProcessoLeituraCancelamentoPreparoSearchLeituraResponseDTO> get leituras;
  set leituras(
      List<ProcessoLeituraCancelamentoPreparoSearchLeituraResponseDTO> value);
  @override
  @JsonKey(ignore: true)
  _$$ProcessoLeituraCancelamentoPreparoSearchResponseDTOImplCopyWith<
          _$ProcessoLeituraCancelamentoPreparoSearchResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
