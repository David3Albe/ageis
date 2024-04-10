// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'solicitacao_material_receive_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SolicitacaoMaterialReceiveDTO _$SolicitacaoMaterialReceiveDTOFromJson(
    Map<String, dynamic> json) {
  return _SolicitacaoMaterialReceiveDTO.fromJson(json);
}

/// @nodoc
mixin _$SolicitacaoMaterialReceiveDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  String get codBarraUsuarioRecebedor => throw _privateConstructorUsedError;
  set codBarraUsuarioRecebedor(String value) =>
      throw _privateConstructorUsedError;
  int get codUsuarioEntrega => throw _privateConstructorUsedError;
  set codUsuarioEntrega(int value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SolicitacaoMaterialReceiveDTOCopyWith<SolicitacaoMaterialReceiveDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SolicitacaoMaterialReceiveDTOCopyWith<$Res> {
  factory $SolicitacaoMaterialReceiveDTOCopyWith(
          SolicitacaoMaterialReceiveDTO value,
          $Res Function(SolicitacaoMaterialReceiveDTO) then) =
      _$SolicitacaoMaterialReceiveDTOCopyWithImpl<$Res,
          SolicitacaoMaterialReceiveDTO>;
  @useResult
  $Res call({int cod, String codBarraUsuarioRecebedor, int codUsuarioEntrega});
}

/// @nodoc
class _$SolicitacaoMaterialReceiveDTOCopyWithImpl<$Res,
        $Val extends SolicitacaoMaterialReceiveDTO>
    implements $SolicitacaoMaterialReceiveDTOCopyWith<$Res> {
  _$SolicitacaoMaterialReceiveDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? codBarraUsuarioRecebedor = null,
    Object? codUsuarioEntrega = null,
  }) {
    return _then(_value.copyWith(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      codBarraUsuarioRecebedor: null == codBarraUsuarioRecebedor
          ? _value.codBarraUsuarioRecebedor
          : codBarraUsuarioRecebedor // ignore: cast_nullable_to_non_nullable
              as String,
      codUsuarioEntrega: null == codUsuarioEntrega
          ? _value.codUsuarioEntrega
          : codUsuarioEntrega // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SolicitacaoMaterialReceiveDTOImplCopyWith<$Res>
    implements $SolicitacaoMaterialReceiveDTOCopyWith<$Res> {
  factory _$$SolicitacaoMaterialReceiveDTOImplCopyWith(
          _$SolicitacaoMaterialReceiveDTOImpl value,
          $Res Function(_$SolicitacaoMaterialReceiveDTOImpl) then) =
      __$$SolicitacaoMaterialReceiveDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, String codBarraUsuarioRecebedor, int codUsuarioEntrega});
}

/// @nodoc
class __$$SolicitacaoMaterialReceiveDTOImplCopyWithImpl<$Res>
    extends _$SolicitacaoMaterialReceiveDTOCopyWithImpl<$Res,
        _$SolicitacaoMaterialReceiveDTOImpl>
    implements _$$SolicitacaoMaterialReceiveDTOImplCopyWith<$Res> {
  __$$SolicitacaoMaterialReceiveDTOImplCopyWithImpl(
      _$SolicitacaoMaterialReceiveDTOImpl _value,
      $Res Function(_$SolicitacaoMaterialReceiveDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? codBarraUsuarioRecebedor = null,
    Object? codUsuarioEntrega = null,
  }) {
    return _then(_$SolicitacaoMaterialReceiveDTOImpl(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      codBarraUsuarioRecebedor: null == codBarraUsuarioRecebedor
          ? _value.codBarraUsuarioRecebedor
          : codBarraUsuarioRecebedor // ignore: cast_nullable_to_non_nullable
              as String,
      codUsuarioEntrega: null == codUsuarioEntrega
          ? _value.codUsuarioEntrega
          : codUsuarioEntrega // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SolicitacaoMaterialReceiveDTOImpl
    with DiagnosticableTreeMixin
    implements _SolicitacaoMaterialReceiveDTO {
  _$SolicitacaoMaterialReceiveDTOImpl(
      {required this.cod,
      required this.codBarraUsuarioRecebedor,
      required this.codUsuarioEntrega});

  factory _$SolicitacaoMaterialReceiveDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SolicitacaoMaterialReceiveDTOImplFromJson(json);

  @override
  int cod;
  @override
  String codBarraUsuarioRecebedor;
  @override
  int codUsuarioEntrega;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SolicitacaoMaterialReceiveDTO(cod: $cod, codBarraUsuarioRecebedor: $codBarraUsuarioRecebedor, codUsuarioEntrega: $codUsuarioEntrega)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SolicitacaoMaterialReceiveDTO'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty(
          'codBarraUsuarioRecebedor', codBarraUsuarioRecebedor))
      ..add(DiagnosticsProperty('codUsuarioEntrega', codUsuarioEntrega));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SolicitacaoMaterialReceiveDTOImplCopyWith<
          _$SolicitacaoMaterialReceiveDTOImpl>
      get copyWith => __$$SolicitacaoMaterialReceiveDTOImplCopyWithImpl<
          _$SolicitacaoMaterialReceiveDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SolicitacaoMaterialReceiveDTOImplToJson(
      this,
    );
  }
}

abstract class _SolicitacaoMaterialReceiveDTO
    implements SolicitacaoMaterialReceiveDTO {
  factory _SolicitacaoMaterialReceiveDTO(
      {required int cod,
      required String codBarraUsuarioRecebedor,
      required int codUsuarioEntrega}) = _$SolicitacaoMaterialReceiveDTOImpl;

  factory _SolicitacaoMaterialReceiveDTO.fromJson(Map<String, dynamic> json) =
      _$SolicitacaoMaterialReceiveDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  String get codBarraUsuarioRecebedor;
  set codBarraUsuarioRecebedor(String value);
  @override
  int get codUsuarioEntrega;
  set codUsuarioEntrega(int value);
  @override
  @JsonKey(ignore: true)
  _$$SolicitacaoMaterialReceiveDTOImplCopyWith<
          _$SolicitacaoMaterialReceiveDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
