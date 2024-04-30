// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'servico_tipo_drop_down_search_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ServicoTipoDropDownSearchResponseDTO
    _$ServicoTipoDropDownSearchResponseDTOFromJson(Map<String, dynamic> json) {
  return _ServicoTipoDropDownSearchResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$ServicoTipoDropDownSearchResponseDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  set nome(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServicoTipoDropDownSearchResponseDTOCopyWith<
          ServicoTipoDropDownSearchResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServicoTipoDropDownSearchResponseDTOCopyWith<$Res> {
  factory $ServicoTipoDropDownSearchResponseDTOCopyWith(
          ServicoTipoDropDownSearchResponseDTO value,
          $Res Function(ServicoTipoDropDownSearchResponseDTO) then) =
      _$ServicoTipoDropDownSearchResponseDTOCopyWithImpl<$Res,
          ServicoTipoDropDownSearchResponseDTO>;
  @useResult
  $Res call({int cod, String nome});
}

/// @nodoc
class _$ServicoTipoDropDownSearchResponseDTOCopyWithImpl<$Res,
        $Val extends ServicoTipoDropDownSearchResponseDTO>
    implements $ServicoTipoDropDownSearchResponseDTOCopyWith<$Res> {
  _$ServicoTipoDropDownSearchResponseDTOCopyWithImpl(this._value, this._then);

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
abstract class _$$ServicoTipoDropDownSearchResponseDTOImplCopyWith<$Res>
    implements $ServicoTipoDropDownSearchResponseDTOCopyWith<$Res> {
  factory _$$ServicoTipoDropDownSearchResponseDTOImplCopyWith(
          _$ServicoTipoDropDownSearchResponseDTOImpl value,
          $Res Function(_$ServicoTipoDropDownSearchResponseDTOImpl) then) =
      __$$ServicoTipoDropDownSearchResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, String nome});
}

/// @nodoc
class __$$ServicoTipoDropDownSearchResponseDTOImplCopyWithImpl<$Res>
    extends _$ServicoTipoDropDownSearchResponseDTOCopyWithImpl<$Res,
        _$ServicoTipoDropDownSearchResponseDTOImpl>
    implements _$$ServicoTipoDropDownSearchResponseDTOImplCopyWith<$Res> {
  __$$ServicoTipoDropDownSearchResponseDTOImplCopyWithImpl(
      _$ServicoTipoDropDownSearchResponseDTOImpl _value,
      $Res Function(_$ServicoTipoDropDownSearchResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? nome = null,
  }) {
    return _then(_$ServicoTipoDropDownSearchResponseDTOImpl(
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
class _$ServicoTipoDropDownSearchResponseDTOImpl
    extends _ServicoTipoDropDownSearchResponseDTO with DiagnosticableTreeMixin {
  _$ServicoTipoDropDownSearchResponseDTOImpl(
      {required this.cod, required this.nome})
      : super._();

  factory _$ServicoTipoDropDownSearchResponseDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ServicoTipoDropDownSearchResponseDTOImplFromJson(json);

  @override
  int cod;
  @override
  String nome;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ServicoTipoDropDownSearchResponseDTO(cod: $cod, nome: $nome)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ServicoTipoDropDownSearchResponseDTO'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('nome', nome));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServicoTipoDropDownSearchResponseDTOImplCopyWith<
          _$ServicoTipoDropDownSearchResponseDTOImpl>
      get copyWith => __$$ServicoTipoDropDownSearchResponseDTOImplCopyWithImpl<
          _$ServicoTipoDropDownSearchResponseDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServicoTipoDropDownSearchResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _ServicoTipoDropDownSearchResponseDTO
    extends ServicoTipoDropDownSearchResponseDTO {
  factory _ServicoTipoDropDownSearchResponseDTO(
      {required int cod,
      required String nome}) = _$ServicoTipoDropDownSearchResponseDTOImpl;
  _ServicoTipoDropDownSearchResponseDTO._() : super._();

  factory _ServicoTipoDropDownSearchResponseDTO.fromJson(
          Map<String, dynamic> json) =
      _$ServicoTipoDropDownSearchResponseDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  String get nome;
  set nome(String value);
  @override
  @JsonKey(ignore: true)
  _$$ServicoTipoDropDownSearchResponseDTOImplCopyWith<
          _$ServicoTipoDropDownSearchResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
