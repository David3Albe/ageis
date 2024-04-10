// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'processo_leitura_cancelamento_preparo_cancel_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProcessoLeituraCancelamentoPreparoCancelDTO
    _$ProcessoLeituraCancelamentoPreparoCancelDTOFromJson(
        Map<String, dynamic> json) {
  return _ProcessoLeituraCancelamentoPreparoCancelDTO.fromJson(json);
}

/// @nodoc
mixin _$ProcessoLeituraCancelamentoPreparoCancelDTO {
  List<int> get codigos => throw _privateConstructorUsedError;
  set codigos(List<int> value) => throw _privateConstructorUsedError;
  int get codUsuarioCancelamento => throw _privateConstructorUsedError;
  set codUsuarioCancelamento(int value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProcessoLeituraCancelamentoPreparoCancelDTOCopyWith<
          ProcessoLeituraCancelamentoPreparoCancelDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcessoLeituraCancelamentoPreparoCancelDTOCopyWith<$Res> {
  factory $ProcessoLeituraCancelamentoPreparoCancelDTOCopyWith(
          ProcessoLeituraCancelamentoPreparoCancelDTO value,
          $Res Function(ProcessoLeituraCancelamentoPreparoCancelDTO) then) =
      _$ProcessoLeituraCancelamentoPreparoCancelDTOCopyWithImpl<$Res,
          ProcessoLeituraCancelamentoPreparoCancelDTO>;
  @useResult
  $Res call({List<int> codigos, int codUsuarioCancelamento});
}

/// @nodoc
class _$ProcessoLeituraCancelamentoPreparoCancelDTOCopyWithImpl<$Res,
        $Val extends ProcessoLeituraCancelamentoPreparoCancelDTO>
    implements $ProcessoLeituraCancelamentoPreparoCancelDTOCopyWith<$Res> {
  _$ProcessoLeituraCancelamentoPreparoCancelDTOCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codigos = null,
    Object? codUsuarioCancelamento = null,
  }) {
    return _then(_value.copyWith(
      codigos: null == codigos
          ? _value.codigos
          : codigos // ignore: cast_nullable_to_non_nullable
              as List<int>,
      codUsuarioCancelamento: null == codUsuarioCancelamento
          ? _value.codUsuarioCancelamento
          : codUsuarioCancelamento // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProcessoLeituraCancelamentoPreparoCancelDTOImplCopyWith<$Res>
    implements $ProcessoLeituraCancelamentoPreparoCancelDTOCopyWith<$Res> {
  factory _$$ProcessoLeituraCancelamentoPreparoCancelDTOImplCopyWith(
          _$ProcessoLeituraCancelamentoPreparoCancelDTOImpl value,
          $Res Function(_$ProcessoLeituraCancelamentoPreparoCancelDTOImpl)
              then) =
      __$$ProcessoLeituraCancelamentoPreparoCancelDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<int> codigos, int codUsuarioCancelamento});
}

/// @nodoc
class __$$ProcessoLeituraCancelamentoPreparoCancelDTOImplCopyWithImpl<$Res>
    extends _$ProcessoLeituraCancelamentoPreparoCancelDTOCopyWithImpl<$Res,
        _$ProcessoLeituraCancelamentoPreparoCancelDTOImpl>
    implements
        _$$ProcessoLeituraCancelamentoPreparoCancelDTOImplCopyWith<$Res> {
  __$$ProcessoLeituraCancelamentoPreparoCancelDTOImplCopyWithImpl(
      _$ProcessoLeituraCancelamentoPreparoCancelDTOImpl _value,
      $Res Function(_$ProcessoLeituraCancelamentoPreparoCancelDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codigos = null,
    Object? codUsuarioCancelamento = null,
  }) {
    return _then(_$ProcessoLeituraCancelamentoPreparoCancelDTOImpl(
      codigos: null == codigos
          ? _value.codigos
          : codigos // ignore: cast_nullable_to_non_nullable
              as List<int>,
      codUsuarioCancelamento: null == codUsuarioCancelamento
          ? _value.codUsuarioCancelamento
          : codUsuarioCancelamento // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProcessoLeituraCancelamentoPreparoCancelDTOImpl
    with DiagnosticableTreeMixin
    implements _ProcessoLeituraCancelamentoPreparoCancelDTO {
  _$ProcessoLeituraCancelamentoPreparoCancelDTOImpl(
      {required this.codigos, required this.codUsuarioCancelamento});

  factory _$ProcessoLeituraCancelamentoPreparoCancelDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ProcessoLeituraCancelamentoPreparoCancelDTOImplFromJson(json);

  @override
  List<int> codigos;
  @override
  int codUsuarioCancelamento;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProcessoLeituraCancelamentoPreparoCancelDTO(codigos: $codigos, codUsuarioCancelamento: $codUsuarioCancelamento)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'ProcessoLeituraCancelamentoPreparoCancelDTO'))
      ..add(DiagnosticsProperty('codigos', codigos))
      ..add(DiagnosticsProperty(
          'codUsuarioCancelamento', codUsuarioCancelamento));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcessoLeituraCancelamentoPreparoCancelDTOImplCopyWith<
          _$ProcessoLeituraCancelamentoPreparoCancelDTOImpl>
      get copyWith =>
          __$$ProcessoLeituraCancelamentoPreparoCancelDTOImplCopyWithImpl<
                  _$ProcessoLeituraCancelamentoPreparoCancelDTOImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProcessoLeituraCancelamentoPreparoCancelDTOImplToJson(
      this,
    );
  }
}

abstract class _ProcessoLeituraCancelamentoPreparoCancelDTO
    implements ProcessoLeituraCancelamentoPreparoCancelDTO {
  factory _ProcessoLeituraCancelamentoPreparoCancelDTO(
          {required List<int> codigos, required int codUsuarioCancelamento}) =
      _$ProcessoLeituraCancelamentoPreparoCancelDTOImpl;

  factory _ProcessoLeituraCancelamentoPreparoCancelDTO.fromJson(
          Map<String, dynamic> json) =
      _$ProcessoLeituraCancelamentoPreparoCancelDTOImpl.fromJson;

  @override
  List<int> get codigos;
  set codigos(List<int> value);
  @override
  int get codUsuarioCancelamento;
  set codUsuarioCancelamento(int value);
  @override
  @JsonKey(ignore: true)
  _$$ProcessoLeituraCancelamentoPreparoCancelDTOImplCopyWith<
          _$ProcessoLeituraCancelamentoPreparoCancelDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
