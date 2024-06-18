// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'processo_tipo_ultima_leitura_item_kit_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProcessoTipoUltimaLeituraItemKitDTO
    _$ProcessoTipoUltimaLeituraItemKitDTOFromJson(Map<String, dynamic> json) {
  return _ProcessoTipoUltimaLeituraItemKitDTO.fromJson(json);
}

/// @nodoc
mixin _$ProcessoTipoUltimaLeituraItemKitDTO {
  String? get codBarraKit => throw _privateConstructorUsedError;
  set codBarraKit(String? value) => throw _privateConstructorUsedError;
  String? get idEtiqueta => throw _privateConstructorUsedError;
  set idEtiqueta(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProcessoTipoUltimaLeituraItemKitDTOCopyWith<
          ProcessoTipoUltimaLeituraItemKitDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcessoTipoUltimaLeituraItemKitDTOCopyWith<$Res> {
  factory $ProcessoTipoUltimaLeituraItemKitDTOCopyWith(
          ProcessoTipoUltimaLeituraItemKitDTO value,
          $Res Function(ProcessoTipoUltimaLeituraItemKitDTO) then) =
      _$ProcessoTipoUltimaLeituraItemKitDTOCopyWithImpl<$Res,
          ProcessoTipoUltimaLeituraItemKitDTO>;
  @useResult
  $Res call({String? codBarraKit, String? idEtiqueta});
}

/// @nodoc
class _$ProcessoTipoUltimaLeituraItemKitDTOCopyWithImpl<$Res,
        $Val extends ProcessoTipoUltimaLeituraItemKitDTO>
    implements $ProcessoTipoUltimaLeituraItemKitDTOCopyWith<$Res> {
  _$ProcessoTipoUltimaLeituraItemKitDTOCopyWithImpl(this._value, this._then);

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
abstract class _$$ProcessoTipoUltimaLeituraItemKitDTOImplCopyWith<$Res>
    implements $ProcessoTipoUltimaLeituraItemKitDTOCopyWith<$Res> {
  factory _$$ProcessoTipoUltimaLeituraItemKitDTOImplCopyWith(
          _$ProcessoTipoUltimaLeituraItemKitDTOImpl value,
          $Res Function(_$ProcessoTipoUltimaLeituraItemKitDTOImpl) then) =
      __$$ProcessoTipoUltimaLeituraItemKitDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? codBarraKit, String? idEtiqueta});
}

/// @nodoc
class __$$ProcessoTipoUltimaLeituraItemKitDTOImplCopyWithImpl<$Res>
    extends _$ProcessoTipoUltimaLeituraItemKitDTOCopyWithImpl<$Res,
        _$ProcessoTipoUltimaLeituraItemKitDTOImpl>
    implements _$$ProcessoTipoUltimaLeituraItemKitDTOImplCopyWith<$Res> {
  __$$ProcessoTipoUltimaLeituraItemKitDTOImplCopyWithImpl(
      _$ProcessoTipoUltimaLeituraItemKitDTOImpl _value,
      $Res Function(_$ProcessoTipoUltimaLeituraItemKitDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codBarraKit = freezed,
    Object? idEtiqueta = freezed,
  }) {
    return _then(_$ProcessoTipoUltimaLeituraItemKitDTOImpl(
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
class _$ProcessoTipoUltimaLeituraItemKitDTOImpl
    with DiagnosticableTreeMixin
    implements _ProcessoTipoUltimaLeituraItemKitDTO {
  _$ProcessoTipoUltimaLeituraItemKitDTOImpl(
      {this.codBarraKit, this.idEtiqueta});

  factory _$ProcessoTipoUltimaLeituraItemKitDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ProcessoTipoUltimaLeituraItemKitDTOImplFromJson(json);

  @override
  String? codBarraKit;
  @override
  String? idEtiqueta;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProcessoTipoUltimaLeituraItemKitDTO(codBarraKit: $codBarraKit, idEtiqueta: $idEtiqueta)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProcessoTipoUltimaLeituraItemKitDTO'))
      ..add(DiagnosticsProperty('codBarraKit', codBarraKit))
      ..add(DiagnosticsProperty('idEtiqueta', idEtiqueta));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcessoTipoUltimaLeituraItemKitDTOImplCopyWith<
          _$ProcessoTipoUltimaLeituraItemKitDTOImpl>
      get copyWith => __$$ProcessoTipoUltimaLeituraItemKitDTOImplCopyWithImpl<
          _$ProcessoTipoUltimaLeituraItemKitDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProcessoTipoUltimaLeituraItemKitDTOImplToJson(
      this,
    );
  }
}

abstract class _ProcessoTipoUltimaLeituraItemKitDTO
    implements ProcessoTipoUltimaLeituraItemKitDTO {
  factory _ProcessoTipoUltimaLeituraItemKitDTO(
      {String? codBarraKit,
      String? idEtiqueta}) = _$ProcessoTipoUltimaLeituraItemKitDTOImpl;

  factory _ProcessoTipoUltimaLeituraItemKitDTO.fromJson(
          Map<String, dynamic> json) =
      _$ProcessoTipoUltimaLeituraItemKitDTOImpl.fromJson;

  @override
  String? get codBarraKit;
  set codBarraKit(String? value);
  @override
  String? get idEtiqueta;
  set idEtiqueta(String? value);
  @override
  @JsonKey(ignore: true)
  _$$ProcessoTipoUltimaLeituraItemKitDTOImplCopyWith<
          _$ProcessoTipoUltimaLeituraItemKitDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
