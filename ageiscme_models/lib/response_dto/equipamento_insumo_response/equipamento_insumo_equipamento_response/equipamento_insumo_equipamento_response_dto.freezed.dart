// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'equipamento_insumo_equipamento_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EquipamentoInsumoEquipamentoResponseDTO
    _$EquipamentoInsumoEquipamentoResponseDTOFromJson(
        Map<String, dynamic> json) {
  return _EquipamentoInsumoEquipamentoResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$EquipamentoInsumoEquipamentoResponseDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  String? get nome => throw _privateConstructorUsedError;
  set nome(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EquipamentoInsumoEquipamentoResponseDTOCopyWith<
          EquipamentoInsumoEquipamentoResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EquipamentoInsumoEquipamentoResponseDTOCopyWith<$Res> {
  factory $EquipamentoInsumoEquipamentoResponseDTOCopyWith(
          EquipamentoInsumoEquipamentoResponseDTO value,
          $Res Function(EquipamentoInsumoEquipamentoResponseDTO) then) =
      _$EquipamentoInsumoEquipamentoResponseDTOCopyWithImpl<$Res,
          EquipamentoInsumoEquipamentoResponseDTO>;
  @useResult
  $Res call({int cod, String? nome});
}

/// @nodoc
class _$EquipamentoInsumoEquipamentoResponseDTOCopyWithImpl<$Res,
        $Val extends EquipamentoInsumoEquipamentoResponseDTO>
    implements $EquipamentoInsumoEquipamentoResponseDTOCopyWith<$Res> {
  _$EquipamentoInsumoEquipamentoResponseDTOCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? nome = freezed,
  }) {
    return _then(_value.copyWith(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      nome: freezed == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EquipamentoInsumoEquipamentoResponseDTOImplCopyWith<$Res>
    implements $EquipamentoInsumoEquipamentoResponseDTOCopyWith<$Res> {
  factory _$$EquipamentoInsumoEquipamentoResponseDTOImplCopyWith(
          _$EquipamentoInsumoEquipamentoResponseDTOImpl value,
          $Res Function(_$EquipamentoInsumoEquipamentoResponseDTOImpl) then) =
      __$$EquipamentoInsumoEquipamentoResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, String? nome});
}

/// @nodoc
class __$$EquipamentoInsumoEquipamentoResponseDTOImplCopyWithImpl<$Res>
    extends _$EquipamentoInsumoEquipamentoResponseDTOCopyWithImpl<$Res,
        _$EquipamentoInsumoEquipamentoResponseDTOImpl>
    implements _$$EquipamentoInsumoEquipamentoResponseDTOImplCopyWith<$Res> {
  __$$EquipamentoInsumoEquipamentoResponseDTOImplCopyWithImpl(
      _$EquipamentoInsumoEquipamentoResponseDTOImpl _value,
      $Res Function(_$EquipamentoInsumoEquipamentoResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? nome = freezed,
  }) {
    return _then(_$EquipamentoInsumoEquipamentoResponseDTOImpl(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      nome: freezed == nome
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EquipamentoInsumoEquipamentoResponseDTOImpl
    extends _EquipamentoInsumoEquipamentoResponseDTO
    with DiagnosticableTreeMixin {
  _$EquipamentoInsumoEquipamentoResponseDTOImpl({required this.cod, this.nome})
      : super._();

  factory _$EquipamentoInsumoEquipamentoResponseDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$EquipamentoInsumoEquipamentoResponseDTOImplFromJson(json);

  @override
  int cod;
  @override
  String? nome;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EquipamentoInsumoEquipamentoResponseDTO(cod: $cod, nome: $nome)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'EquipamentoInsumoEquipamentoResponseDTO'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('nome', nome));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EquipamentoInsumoEquipamentoResponseDTOImplCopyWith<
          _$EquipamentoInsumoEquipamentoResponseDTOImpl>
      get copyWith =>
          __$$EquipamentoInsumoEquipamentoResponseDTOImplCopyWithImpl<
              _$EquipamentoInsumoEquipamentoResponseDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EquipamentoInsumoEquipamentoResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _EquipamentoInsumoEquipamentoResponseDTO
    extends EquipamentoInsumoEquipamentoResponseDTO {
  factory _EquipamentoInsumoEquipamentoResponseDTO(
      {required int cod,
      String? nome}) = _$EquipamentoInsumoEquipamentoResponseDTOImpl;
  _EquipamentoInsumoEquipamentoResponseDTO._() : super._();

  factory _EquipamentoInsumoEquipamentoResponseDTO.fromJson(
          Map<String, dynamic> json) =
      _$EquipamentoInsumoEquipamentoResponseDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  String? get nome;
  set nome(String? value);
  @override
  @JsonKey(ignore: true)
  _$$EquipamentoInsumoEquipamentoResponseDTOImplCopyWith<
          _$EquipamentoInsumoEquipamentoResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
