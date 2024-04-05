// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_etiqueta_usuario_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ItemEtiquetaUsuarioResponseDTO _$ItemEtiquetaUsuarioResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _ItemEtiquetaUsuarioResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$ItemEtiquetaUsuarioResponseDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  set nome(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemEtiquetaUsuarioResponseDTOCopyWith<ItemEtiquetaUsuarioResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemEtiquetaUsuarioResponseDTOCopyWith<$Res> {
  factory $ItemEtiquetaUsuarioResponseDTOCopyWith(
          ItemEtiquetaUsuarioResponseDTO value,
          $Res Function(ItemEtiquetaUsuarioResponseDTO) then) =
      _$ItemEtiquetaUsuarioResponseDTOCopyWithImpl<$Res,
          ItemEtiquetaUsuarioResponseDTO>;
  @useResult
  $Res call({int cod, String nome});
}

/// @nodoc
class _$ItemEtiquetaUsuarioResponseDTOCopyWithImpl<$Res,
        $Val extends ItemEtiquetaUsuarioResponseDTO>
    implements $ItemEtiquetaUsuarioResponseDTOCopyWith<$Res> {
  _$ItemEtiquetaUsuarioResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? nome = null,
  }) {
    return _then(_value.copyWith(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemEtiquetaUsuarioResponseDTOImplCopyWith<$Res>
    implements $ItemEtiquetaUsuarioResponseDTOCopyWith<$Res> {
  factory _$$ItemEtiquetaUsuarioResponseDTOImplCopyWith(
          _$ItemEtiquetaUsuarioResponseDTOImpl value,
          $Res Function(_$ItemEtiquetaUsuarioResponseDTOImpl) then) =
      __$$ItemEtiquetaUsuarioResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, String nome});
}

/// @nodoc
class __$$ItemEtiquetaUsuarioResponseDTOImplCopyWithImpl<$Res>
    extends _$ItemEtiquetaUsuarioResponseDTOCopyWithImpl<$Res,
        _$ItemEtiquetaUsuarioResponseDTOImpl>
    implements _$$ItemEtiquetaUsuarioResponseDTOImplCopyWith<$Res> {
  __$$ItemEtiquetaUsuarioResponseDTOImplCopyWithImpl(
      _$ItemEtiquetaUsuarioResponseDTOImpl _value,
      $Res Function(_$ItemEtiquetaUsuarioResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? nome = null,
  }) {
    return _then(_$ItemEtiquetaUsuarioResponseDTOImpl(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      nome: null == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemEtiquetaUsuarioResponseDTOImpl
    with DiagnosticableTreeMixin
    implements _ItemEtiquetaUsuarioResponseDTO {
  _$ItemEtiquetaUsuarioResponseDTOImpl({required this.cod, required this.nome});

  factory _$ItemEtiquetaUsuarioResponseDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ItemEtiquetaUsuarioResponseDTOImplFromJson(json);

  @override
  int cod;
  @override
  String nome;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ItemEtiquetaUsuarioResponseDTO(cod: $cod, nome: $nome)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ItemEtiquetaUsuarioResponseDTO'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('nome', nome));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemEtiquetaUsuarioResponseDTOImplCopyWith<
          _$ItemEtiquetaUsuarioResponseDTOImpl>
      get copyWith => __$$ItemEtiquetaUsuarioResponseDTOImplCopyWithImpl<
          _$ItemEtiquetaUsuarioResponseDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemEtiquetaUsuarioResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _ItemEtiquetaUsuarioResponseDTO
    implements ItemEtiquetaUsuarioResponseDTO {
  factory _ItemEtiquetaUsuarioResponseDTO(
      {required int cod,
      required String nome}) = _$ItemEtiquetaUsuarioResponseDTOImpl;

  factory _ItemEtiquetaUsuarioResponseDTO.fromJson(Map<String, dynamic> json) =
      _$ItemEtiquetaUsuarioResponseDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  String get nome;
  set nome(String value);
  @override
  @JsonKey(ignore: true)
  _$$ItemEtiquetaUsuarioResponseDTOImplCopyWith<
          _$ItemEtiquetaUsuarioResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
