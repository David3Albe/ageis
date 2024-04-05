// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'solicitacao_material_search_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SolicitacaoMaterialSearchResponseDTO
    _$SolicitacaoMaterialSearchResponseDTOFromJson(Map<String, dynamic> json) {
  return _SolicitacaoMaterialSearchResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$SolicitacaoMaterialSearchResponseDTO {
  List<SolicitacaoMaterialSearchItemResponseDTO> get itens =>
      throw _privateConstructorUsedError;
  set itens(List<SolicitacaoMaterialSearchItemResponseDTO> value) =>
      throw _privateConstructorUsedError;
  Map<int, SolicitacaoMaterialSearchUsuarioResponseDTO> get usuarios =>
      throw _privateConstructorUsedError;
  set usuarios(Map<int, SolicitacaoMaterialSearchUsuarioResponseDTO> value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SolicitacaoMaterialSearchResponseDTOCopyWith<
          SolicitacaoMaterialSearchResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SolicitacaoMaterialSearchResponseDTOCopyWith<$Res> {
  factory $SolicitacaoMaterialSearchResponseDTOCopyWith(
          SolicitacaoMaterialSearchResponseDTO value,
          $Res Function(SolicitacaoMaterialSearchResponseDTO) then) =
      _$SolicitacaoMaterialSearchResponseDTOCopyWithImpl<$Res,
          SolicitacaoMaterialSearchResponseDTO>;
  @useResult
  $Res call(
      {List<SolicitacaoMaterialSearchItemResponseDTO> itens,
      Map<int, SolicitacaoMaterialSearchUsuarioResponseDTO> usuarios});
}

/// @nodoc
class _$SolicitacaoMaterialSearchResponseDTOCopyWithImpl<$Res,
        $Val extends SolicitacaoMaterialSearchResponseDTO>
    implements $SolicitacaoMaterialSearchResponseDTOCopyWith<$Res> {
  _$SolicitacaoMaterialSearchResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itens = null,
    Object? usuarios = null,
  }) {
    return _then(_value.copyWith(
      itens: null == itens
          ? _value.itens
          : itens // ignore: cast_nullable_to_non_nullable
              as List<SolicitacaoMaterialSearchItemResponseDTO>,
      usuarios: null == usuarios
          ? _value.usuarios
          : usuarios // ignore: cast_nullable_to_non_nullable
              as Map<int, SolicitacaoMaterialSearchUsuarioResponseDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SolicitacaoMaterialSearchResponseDTOImplCopyWith<$Res>
    implements $SolicitacaoMaterialSearchResponseDTOCopyWith<$Res> {
  factory _$$SolicitacaoMaterialSearchResponseDTOImplCopyWith(
          _$SolicitacaoMaterialSearchResponseDTOImpl value,
          $Res Function(_$SolicitacaoMaterialSearchResponseDTOImpl) then) =
      __$$SolicitacaoMaterialSearchResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<SolicitacaoMaterialSearchItemResponseDTO> itens,
      Map<int, SolicitacaoMaterialSearchUsuarioResponseDTO> usuarios});
}

/// @nodoc
class __$$SolicitacaoMaterialSearchResponseDTOImplCopyWithImpl<$Res>
    extends _$SolicitacaoMaterialSearchResponseDTOCopyWithImpl<$Res,
        _$SolicitacaoMaterialSearchResponseDTOImpl>
    implements _$$SolicitacaoMaterialSearchResponseDTOImplCopyWith<$Res> {
  __$$SolicitacaoMaterialSearchResponseDTOImplCopyWithImpl(
      _$SolicitacaoMaterialSearchResponseDTOImpl _value,
      $Res Function(_$SolicitacaoMaterialSearchResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itens = null,
    Object? usuarios = null,
  }) {
    return _then(_$SolicitacaoMaterialSearchResponseDTOImpl(
      itens: null == itens
          ? _value.itens
          : itens // ignore: cast_nullable_to_non_nullable
              as List<SolicitacaoMaterialSearchItemResponseDTO>,
      usuarios: null == usuarios
          ? _value.usuarios
          : usuarios // ignore: cast_nullable_to_non_nullable
              as Map<int, SolicitacaoMaterialSearchUsuarioResponseDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SolicitacaoMaterialSearchResponseDTOImpl
    with DiagnosticableTreeMixin
    implements _SolicitacaoMaterialSearchResponseDTO {
  _$SolicitacaoMaterialSearchResponseDTOImpl(
      {required this.itens, required this.usuarios});

  factory _$SolicitacaoMaterialSearchResponseDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SolicitacaoMaterialSearchResponseDTOImplFromJson(json);

  @override
  List<SolicitacaoMaterialSearchItemResponseDTO> itens;
  @override
  Map<int, SolicitacaoMaterialSearchUsuarioResponseDTO> usuarios;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SolicitacaoMaterialSearchResponseDTO(itens: $itens, usuarios: $usuarios)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SolicitacaoMaterialSearchResponseDTO'))
      ..add(DiagnosticsProperty('itens', itens))
      ..add(DiagnosticsProperty('usuarios', usuarios));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SolicitacaoMaterialSearchResponseDTOImplCopyWith<
          _$SolicitacaoMaterialSearchResponseDTOImpl>
      get copyWith => __$$SolicitacaoMaterialSearchResponseDTOImplCopyWithImpl<
          _$SolicitacaoMaterialSearchResponseDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SolicitacaoMaterialSearchResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _SolicitacaoMaterialSearchResponseDTO
    implements SolicitacaoMaterialSearchResponseDTO {
  factory _SolicitacaoMaterialSearchResponseDTO(
      {required List<SolicitacaoMaterialSearchItemResponseDTO> itens,
      required Map<int, SolicitacaoMaterialSearchUsuarioResponseDTO>
          usuarios}) = _$SolicitacaoMaterialSearchResponseDTOImpl;

  factory _SolicitacaoMaterialSearchResponseDTO.fromJson(
          Map<String, dynamic> json) =
      _$SolicitacaoMaterialSearchResponseDTOImpl.fromJson;

  @override
  List<SolicitacaoMaterialSearchItemResponseDTO> get itens;
  set itens(List<SolicitacaoMaterialSearchItemResponseDTO> value);
  @override
  Map<int, SolicitacaoMaterialSearchUsuarioResponseDTO> get usuarios;
  set usuarios(Map<int, SolicitacaoMaterialSearchUsuarioResponseDTO> value);
  @override
  @JsonKey(ignore: true)
  _$$SolicitacaoMaterialSearchResponseDTOImplCopyWith<
          _$SolicitacaoMaterialSearchResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
