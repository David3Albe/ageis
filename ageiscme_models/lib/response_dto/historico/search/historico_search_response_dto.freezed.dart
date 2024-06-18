// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'historico_search_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HistoricoSearchResponseDTO _$HistoricoSearchResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _HistoricoSearchResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$HistoricoSearchResponseDTO {
  List<HistoricoSearchItemResponseDTO> get itens =>
      throw _privateConstructorUsedError;
  set itens(List<HistoricoSearchItemResponseDTO> value) =>
      throw _privateConstructorUsedError;
  Map<int, HistoricoSearchUsuarioResponseDTO> get usuarios =>
      throw _privateConstructorUsedError;
  set usuarios(Map<int, HistoricoSearchUsuarioResponseDTO> value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistoricoSearchResponseDTOCopyWith<HistoricoSearchResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoricoSearchResponseDTOCopyWith<$Res> {
  factory $HistoricoSearchResponseDTOCopyWith(HistoricoSearchResponseDTO value,
          $Res Function(HistoricoSearchResponseDTO) then) =
      _$HistoricoSearchResponseDTOCopyWithImpl<$Res,
          HistoricoSearchResponseDTO>;
  @useResult
  $Res call(
      {List<HistoricoSearchItemResponseDTO> itens,
      Map<int, HistoricoSearchUsuarioResponseDTO> usuarios});
}

/// @nodoc
class _$HistoricoSearchResponseDTOCopyWithImpl<$Res,
        $Val extends HistoricoSearchResponseDTO>
    implements $HistoricoSearchResponseDTOCopyWith<$Res> {
  _$HistoricoSearchResponseDTOCopyWithImpl(this._value, this._then);

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
              as List<HistoricoSearchItemResponseDTO>,
      usuarios: null == usuarios
          ? _value.usuarios
          : usuarios // ignore: cast_nullable_to_non_nullable
              as Map<int, HistoricoSearchUsuarioResponseDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HistoricoSearchResponseDTOImplCopyWith<$Res>
    implements $HistoricoSearchResponseDTOCopyWith<$Res> {
  factory _$$HistoricoSearchResponseDTOImplCopyWith(
          _$HistoricoSearchResponseDTOImpl value,
          $Res Function(_$HistoricoSearchResponseDTOImpl) then) =
      __$$HistoricoSearchResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<HistoricoSearchItemResponseDTO> itens,
      Map<int, HistoricoSearchUsuarioResponseDTO> usuarios});
}

/// @nodoc
class __$$HistoricoSearchResponseDTOImplCopyWithImpl<$Res>
    extends _$HistoricoSearchResponseDTOCopyWithImpl<$Res,
        _$HistoricoSearchResponseDTOImpl>
    implements _$$HistoricoSearchResponseDTOImplCopyWith<$Res> {
  __$$HistoricoSearchResponseDTOImplCopyWithImpl(
      _$HistoricoSearchResponseDTOImpl _value,
      $Res Function(_$HistoricoSearchResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itens = null,
    Object? usuarios = null,
  }) {
    return _then(_$HistoricoSearchResponseDTOImpl(
      itens: null == itens
          ? _value.itens
          : itens // ignore: cast_nullable_to_non_nullable
              as List<HistoricoSearchItemResponseDTO>,
      usuarios: null == usuarios
          ? _value.usuarios
          : usuarios // ignore: cast_nullable_to_non_nullable
              as Map<int, HistoricoSearchUsuarioResponseDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HistoricoSearchResponseDTOImpl
    with DiagnosticableTreeMixin
    implements _HistoricoSearchResponseDTO {
  _$HistoricoSearchResponseDTOImpl(
      {required this.itens, required this.usuarios});

  factory _$HistoricoSearchResponseDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$HistoricoSearchResponseDTOImplFromJson(json);

  @override
  List<HistoricoSearchItemResponseDTO> itens;
  @override
  Map<int, HistoricoSearchUsuarioResponseDTO> usuarios;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HistoricoSearchResponseDTO(itens: $itens, usuarios: $usuarios)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HistoricoSearchResponseDTO'))
      ..add(DiagnosticsProperty('itens', itens))
      ..add(DiagnosticsProperty('usuarios', usuarios));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoricoSearchResponseDTOImplCopyWith<_$HistoricoSearchResponseDTOImpl>
      get copyWith => __$$HistoricoSearchResponseDTOImplCopyWithImpl<
          _$HistoricoSearchResponseDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HistoricoSearchResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _HistoricoSearchResponseDTO
    implements HistoricoSearchResponseDTO {
  factory _HistoricoSearchResponseDTO(
          {required List<HistoricoSearchItemResponseDTO> itens,
          required Map<int, HistoricoSearchUsuarioResponseDTO> usuarios}) =
      _$HistoricoSearchResponseDTOImpl;

  factory _HistoricoSearchResponseDTO.fromJson(Map<String, dynamic> json) =
      _$HistoricoSearchResponseDTOImpl.fromJson;

  @override
  List<HistoricoSearchItemResponseDTO> get itens;
  set itens(List<HistoricoSearchItemResponseDTO> value);
  @override
  Map<int, HistoricoSearchUsuarioResponseDTO> get usuarios;
  set usuarios(Map<int, HistoricoSearchUsuarioResponseDTO> value);
  @override
  @JsonKey(ignore: true)
  _$$HistoricoSearchResponseDTOImplCopyWith<_$HistoricoSearchResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
