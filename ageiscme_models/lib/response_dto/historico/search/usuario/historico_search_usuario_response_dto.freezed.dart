// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'historico_search_usuario_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HistoricoSearchUsuarioResponseDTO _$HistoricoSearchUsuarioResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _HistoricoSearchUsuarioResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$HistoricoSearchUsuarioResponseDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  set nome(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistoricoSearchUsuarioResponseDTOCopyWith<HistoricoSearchUsuarioResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoricoSearchUsuarioResponseDTOCopyWith<$Res> {
  factory $HistoricoSearchUsuarioResponseDTOCopyWith(
          HistoricoSearchUsuarioResponseDTO value,
          $Res Function(HistoricoSearchUsuarioResponseDTO) then) =
      _$HistoricoSearchUsuarioResponseDTOCopyWithImpl<$Res,
          HistoricoSearchUsuarioResponseDTO>;
  @useResult
  $Res call({int cod, String nome});
}

/// @nodoc
class _$HistoricoSearchUsuarioResponseDTOCopyWithImpl<$Res,
        $Val extends HistoricoSearchUsuarioResponseDTO>
    implements $HistoricoSearchUsuarioResponseDTOCopyWith<$Res> {
  _$HistoricoSearchUsuarioResponseDTOCopyWithImpl(this._value, this._then);

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
abstract class _$$HistoricoSearchUsuarioResponseDTOImplCopyWith<$Res>
    implements $HistoricoSearchUsuarioResponseDTOCopyWith<$Res> {
  factory _$$HistoricoSearchUsuarioResponseDTOImplCopyWith(
          _$HistoricoSearchUsuarioResponseDTOImpl value,
          $Res Function(_$HistoricoSearchUsuarioResponseDTOImpl) then) =
      __$$HistoricoSearchUsuarioResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, String nome});
}

/// @nodoc
class __$$HistoricoSearchUsuarioResponseDTOImplCopyWithImpl<$Res>
    extends _$HistoricoSearchUsuarioResponseDTOCopyWithImpl<$Res,
        _$HistoricoSearchUsuarioResponseDTOImpl>
    implements _$$HistoricoSearchUsuarioResponseDTOImplCopyWith<$Res> {
  __$$HistoricoSearchUsuarioResponseDTOImplCopyWithImpl(
      _$HistoricoSearchUsuarioResponseDTOImpl _value,
      $Res Function(_$HistoricoSearchUsuarioResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? nome = null,
  }) {
    return _then(_$HistoricoSearchUsuarioResponseDTOImpl(
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
class _$HistoricoSearchUsuarioResponseDTOImpl
    with DiagnosticableTreeMixin
    implements _HistoricoSearchUsuarioResponseDTO {
  _$HistoricoSearchUsuarioResponseDTOImpl(
      {required this.cod, required this.nome});

  factory _$HistoricoSearchUsuarioResponseDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$HistoricoSearchUsuarioResponseDTOImplFromJson(json);

  @override
  int cod;
  @override
  String nome;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HistoricoSearchUsuarioResponseDTO(cod: $cod, nome: $nome)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HistoricoSearchUsuarioResponseDTO'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('nome', nome));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoricoSearchUsuarioResponseDTOImplCopyWith<
          _$HistoricoSearchUsuarioResponseDTOImpl>
      get copyWith => __$$HistoricoSearchUsuarioResponseDTOImplCopyWithImpl<
          _$HistoricoSearchUsuarioResponseDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HistoricoSearchUsuarioResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _HistoricoSearchUsuarioResponseDTO
    implements HistoricoSearchUsuarioResponseDTO {
  factory _HistoricoSearchUsuarioResponseDTO(
      {required int cod,
      required String nome}) = _$HistoricoSearchUsuarioResponseDTOImpl;

  factory _HistoricoSearchUsuarioResponseDTO.fromJson(
          Map<String, dynamic> json) =
      _$HistoricoSearchUsuarioResponseDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  String get nome;
  set nome(String value);
  @override
  @JsonKey(ignore: true)
  _$$HistoricoSearchUsuarioResponseDTOImplCopyWith<
          _$HistoricoSearchUsuarioResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
