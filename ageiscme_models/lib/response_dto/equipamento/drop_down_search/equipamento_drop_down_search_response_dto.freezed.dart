// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'equipamento_drop_down_search_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EquipamentoDropDownSearchResponseDTO
    _$EquipamentoDropDownSearchResponseDTOFromJson(Map<String, dynamic> json) {
  return _EquipamentoDropDownSearchResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$EquipamentoDropDownSearchResponseDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  String get nome => throw _privateConstructorUsedError;
  set nome(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EquipamentoDropDownSearchResponseDTOCopyWith<
          EquipamentoDropDownSearchResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EquipamentoDropDownSearchResponseDTOCopyWith<$Res> {
  factory $EquipamentoDropDownSearchResponseDTOCopyWith(
          EquipamentoDropDownSearchResponseDTO value,
          $Res Function(EquipamentoDropDownSearchResponseDTO) then) =
      _$EquipamentoDropDownSearchResponseDTOCopyWithImpl<$Res,
          EquipamentoDropDownSearchResponseDTO>;
  @useResult
  $Res call({int cod, String nome});
}

/// @nodoc
class _$EquipamentoDropDownSearchResponseDTOCopyWithImpl<$Res,
        $Val extends EquipamentoDropDownSearchResponseDTO>
    implements $EquipamentoDropDownSearchResponseDTOCopyWith<$Res> {
  _$EquipamentoDropDownSearchResponseDTOCopyWithImpl(this._value, this._then);

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
abstract class _$$EquipamentoDropDownSearchResponseDTOImplCopyWith<$Res>
    implements $EquipamentoDropDownSearchResponseDTOCopyWith<$Res> {
  factory _$$EquipamentoDropDownSearchResponseDTOImplCopyWith(
          _$EquipamentoDropDownSearchResponseDTOImpl value,
          $Res Function(_$EquipamentoDropDownSearchResponseDTOImpl) then) =
      __$$EquipamentoDropDownSearchResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, String nome});
}

/// @nodoc
class __$$EquipamentoDropDownSearchResponseDTOImplCopyWithImpl<$Res>
    extends _$EquipamentoDropDownSearchResponseDTOCopyWithImpl<$Res,
        _$EquipamentoDropDownSearchResponseDTOImpl>
    implements _$$EquipamentoDropDownSearchResponseDTOImplCopyWith<$Res> {
  __$$EquipamentoDropDownSearchResponseDTOImplCopyWithImpl(
      _$EquipamentoDropDownSearchResponseDTOImpl _value,
      $Res Function(_$EquipamentoDropDownSearchResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? nome = null,
  }) {
    return _then(_$EquipamentoDropDownSearchResponseDTOImpl(
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
class _$EquipamentoDropDownSearchResponseDTOImpl
    extends _EquipamentoDropDownSearchResponseDTO with DiagnosticableTreeMixin {
  _$EquipamentoDropDownSearchResponseDTOImpl(
      {required this.cod, required this.nome})
      : super._();

  factory _$EquipamentoDropDownSearchResponseDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$EquipamentoDropDownSearchResponseDTOImplFromJson(json);

  @override
  int cod;
  @override
  String nome;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EquipamentoDropDownSearchResponseDTO(cod: $cod, nome: $nome)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EquipamentoDropDownSearchResponseDTO'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('nome', nome));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EquipamentoDropDownSearchResponseDTOImplCopyWith<
          _$EquipamentoDropDownSearchResponseDTOImpl>
      get copyWith => __$$EquipamentoDropDownSearchResponseDTOImplCopyWithImpl<
          _$EquipamentoDropDownSearchResponseDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EquipamentoDropDownSearchResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _EquipamentoDropDownSearchResponseDTO
    extends EquipamentoDropDownSearchResponseDTO {
  factory _EquipamentoDropDownSearchResponseDTO(
      {required int cod,
      required String nome}) = _$EquipamentoDropDownSearchResponseDTOImpl;
  _EquipamentoDropDownSearchResponseDTO._() : super._();

  factory _EquipamentoDropDownSearchResponseDTO.fromJson(
          Map<String, dynamic> json) =
      _$EquipamentoDropDownSearchResponseDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  String get nome;
  set nome(String value);
  @override
  @JsonKey(ignore: true)
  _$$EquipamentoDropDownSearchResponseDTOImplCopyWith<
          _$EquipamentoDropDownSearchResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
