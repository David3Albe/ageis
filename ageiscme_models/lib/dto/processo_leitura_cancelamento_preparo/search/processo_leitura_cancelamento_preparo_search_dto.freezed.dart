// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'processo_leitura_cancelamento_preparo_search_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProcessoLeituraCancelamentoPreparoSearchDTO
    _$ProcessoLeituraCancelamentoPreparoSearchDTOFromJson(
        Map<String, dynamic> json) {
  return _ProcessoLeituraCancelamentoPreparoSearchDTO.fromJson(json);
}

/// @nodoc
mixin _$ProcessoLeituraCancelamentoPreparoSearchDTO {
  String? get codBarraKit => throw _privateConstructorUsedError;
  set codBarraKit(String? value) => throw _privateConstructorUsedError;
  String? get idEtiqueta => throw _privateConstructorUsedError;
  set idEtiqueta(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProcessoLeituraCancelamentoPreparoSearchDTOCopyWith<
          ProcessoLeituraCancelamentoPreparoSearchDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcessoLeituraCancelamentoPreparoSearchDTOCopyWith<$Res> {
  factory $ProcessoLeituraCancelamentoPreparoSearchDTOCopyWith(
          ProcessoLeituraCancelamentoPreparoSearchDTO value,
          $Res Function(ProcessoLeituraCancelamentoPreparoSearchDTO) then) =
      _$ProcessoLeituraCancelamentoPreparoSearchDTOCopyWithImpl<$Res,
          ProcessoLeituraCancelamentoPreparoSearchDTO>;
  @useResult
  $Res call({String? codBarraKit, String? idEtiqueta});
}

/// @nodoc
class _$ProcessoLeituraCancelamentoPreparoSearchDTOCopyWithImpl<$Res,
        $Val extends ProcessoLeituraCancelamentoPreparoSearchDTO>
    implements $ProcessoLeituraCancelamentoPreparoSearchDTOCopyWith<$Res> {
  _$ProcessoLeituraCancelamentoPreparoSearchDTOCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codBarraKit = freezed,
    Object? idEtiqueta = freezed,
  }) {
    return _then(_value.copyWith(
      codBarraKit: freezed == codBarraKit
          ? _value.codBarraKit
          : codBarraKit // ignore: cast_nullable_to_non_nullable
              as String?,
      idEtiqueta: freezed == idEtiqueta
          ? _value.idEtiqueta
          : idEtiqueta // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProcessoLeituraCancelamentoPreparoSearchDTOImplCopyWith<$Res>
    implements $ProcessoLeituraCancelamentoPreparoSearchDTOCopyWith<$Res> {
  factory _$$ProcessoLeituraCancelamentoPreparoSearchDTOImplCopyWith(
          _$ProcessoLeituraCancelamentoPreparoSearchDTOImpl value,
          $Res Function(_$ProcessoLeituraCancelamentoPreparoSearchDTOImpl)
              then) =
      __$$ProcessoLeituraCancelamentoPreparoSearchDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? codBarraKit, String? idEtiqueta});
}

/// @nodoc
class __$$ProcessoLeituraCancelamentoPreparoSearchDTOImplCopyWithImpl<$Res>
    extends _$ProcessoLeituraCancelamentoPreparoSearchDTOCopyWithImpl<$Res,
        _$ProcessoLeituraCancelamentoPreparoSearchDTOImpl>
    implements
        _$$ProcessoLeituraCancelamentoPreparoSearchDTOImplCopyWith<$Res> {
  __$$ProcessoLeituraCancelamentoPreparoSearchDTOImplCopyWithImpl(
      _$ProcessoLeituraCancelamentoPreparoSearchDTOImpl _value,
      $Res Function(_$ProcessoLeituraCancelamentoPreparoSearchDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codBarraKit = freezed,
    Object? idEtiqueta = freezed,
  }) {
    return _then(_$ProcessoLeituraCancelamentoPreparoSearchDTOImpl(
      codBarraKit: freezed == codBarraKit
          ? _value.codBarraKit
          : codBarraKit // ignore: cast_nullable_to_non_nullable
              as String?,
      idEtiqueta: freezed == idEtiqueta
          ? _value.idEtiqueta
          : idEtiqueta // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProcessoLeituraCancelamentoPreparoSearchDTOImpl
    with DiagnosticableTreeMixin
    implements _ProcessoLeituraCancelamentoPreparoSearchDTO {
  _$ProcessoLeituraCancelamentoPreparoSearchDTOImpl(
      {this.codBarraKit, this.idEtiqueta});

  factory _$ProcessoLeituraCancelamentoPreparoSearchDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ProcessoLeituraCancelamentoPreparoSearchDTOImplFromJson(json);

  @override
  String? codBarraKit;
  @override
  String? idEtiqueta;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProcessoLeituraCancelamentoPreparoSearchDTO(codBarraKit: $codBarraKit, idEtiqueta: $idEtiqueta)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'ProcessoLeituraCancelamentoPreparoSearchDTO'))
      ..add(DiagnosticsProperty('codBarraKit', codBarraKit))
      ..add(DiagnosticsProperty('idEtiqueta', idEtiqueta));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcessoLeituraCancelamentoPreparoSearchDTOImplCopyWith<
          _$ProcessoLeituraCancelamentoPreparoSearchDTOImpl>
      get copyWith =>
          __$$ProcessoLeituraCancelamentoPreparoSearchDTOImplCopyWithImpl<
                  _$ProcessoLeituraCancelamentoPreparoSearchDTOImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProcessoLeituraCancelamentoPreparoSearchDTOImplToJson(
      this,
    );
  }
}

abstract class _ProcessoLeituraCancelamentoPreparoSearchDTO
    implements ProcessoLeituraCancelamentoPreparoSearchDTO {
  factory _ProcessoLeituraCancelamentoPreparoSearchDTO(
      {String? codBarraKit,
      String? idEtiqueta}) = _$ProcessoLeituraCancelamentoPreparoSearchDTOImpl;

  factory _ProcessoLeituraCancelamentoPreparoSearchDTO.fromJson(
          Map<String, dynamic> json) =
      _$ProcessoLeituraCancelamentoPreparoSearchDTOImpl.fromJson;

  @override
  String? get codBarraKit;
  set codBarraKit(String? value);
  @override
  String? get idEtiqueta;
  set idEtiqueta(String? value);
  @override
  @JsonKey(ignore: true)
  _$$ProcessoLeituraCancelamentoPreparoSearchDTOImplCopyWith<
          _$ProcessoLeituraCancelamentoPreparoSearchDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
