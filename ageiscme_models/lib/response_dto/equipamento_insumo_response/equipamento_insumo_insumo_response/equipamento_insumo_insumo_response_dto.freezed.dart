// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'equipamento_insumo_insumo_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EquipamentoInsumoInsumoResponseDTO _$EquipamentoInsumoInsumoResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _EquipamentoInsumoInsumoResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$EquipamentoInsumoInsumoResponseDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  String? get nome => throw _privateConstructorUsedError;
  set nome(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EquipamentoInsumoInsumoResponseDTOCopyWith<
          EquipamentoInsumoInsumoResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EquipamentoInsumoInsumoResponseDTOCopyWith<$Res> {
  factory $EquipamentoInsumoInsumoResponseDTOCopyWith(
          EquipamentoInsumoInsumoResponseDTO value,
          $Res Function(EquipamentoInsumoInsumoResponseDTO) then) =
      _$EquipamentoInsumoInsumoResponseDTOCopyWithImpl<$Res,
          EquipamentoInsumoInsumoResponseDTO>;
  @useResult
  $Res call({int cod, String? nome});
}

/// @nodoc
class _$EquipamentoInsumoInsumoResponseDTOCopyWithImpl<$Res,
        $Val extends EquipamentoInsumoInsumoResponseDTO>
    implements $EquipamentoInsumoInsumoResponseDTOCopyWith<$Res> {
  _$EquipamentoInsumoInsumoResponseDTOCopyWithImpl(this._value, this._then);

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
abstract class _$$EquipamentoInsumoInsumoResponseDTOImplCopyWith<$Res>
    implements $EquipamentoInsumoInsumoResponseDTOCopyWith<$Res> {
  factory _$$EquipamentoInsumoInsumoResponseDTOImplCopyWith(
          _$EquipamentoInsumoInsumoResponseDTOImpl value,
          $Res Function(_$EquipamentoInsumoInsumoResponseDTOImpl) then) =
      __$$EquipamentoInsumoInsumoResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, String? nome});
}

/// @nodoc
class __$$EquipamentoInsumoInsumoResponseDTOImplCopyWithImpl<$Res>
    extends _$EquipamentoInsumoInsumoResponseDTOCopyWithImpl<$Res,
        _$EquipamentoInsumoInsumoResponseDTOImpl>
    implements _$$EquipamentoInsumoInsumoResponseDTOImplCopyWith<$Res> {
  __$$EquipamentoInsumoInsumoResponseDTOImplCopyWithImpl(
      _$EquipamentoInsumoInsumoResponseDTOImpl _value,
      $Res Function(_$EquipamentoInsumoInsumoResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? nome = freezed,
  }) {
    return _then(_$EquipamentoInsumoInsumoResponseDTOImpl(
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
class _$EquipamentoInsumoInsumoResponseDTOImpl
    extends _EquipamentoInsumoInsumoResponseDTO with DiagnosticableTreeMixin {
  _$EquipamentoInsumoInsumoResponseDTOImpl({required this.cod, this.nome})
      : super._();

  factory _$EquipamentoInsumoInsumoResponseDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$EquipamentoInsumoInsumoResponseDTOImplFromJson(json);

  @override
  int cod;
  @override
  String? nome;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EquipamentoInsumoInsumoResponseDTO(cod: $cod, nome: $nome)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EquipamentoInsumoInsumoResponseDTO'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('nome', nome));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EquipamentoInsumoInsumoResponseDTOImplCopyWith<
          _$EquipamentoInsumoInsumoResponseDTOImpl>
      get copyWith => __$$EquipamentoInsumoInsumoResponseDTOImplCopyWithImpl<
          _$EquipamentoInsumoInsumoResponseDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EquipamentoInsumoInsumoResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _EquipamentoInsumoInsumoResponseDTO
    extends EquipamentoInsumoInsumoResponseDTO {
  factory _EquipamentoInsumoInsumoResponseDTO(
      {required int cod,
      String? nome}) = _$EquipamentoInsumoInsumoResponseDTOImpl;
  _EquipamentoInsumoInsumoResponseDTO._() : super._();

  factory _EquipamentoInsumoInsumoResponseDTO.fromJson(
          Map<String, dynamic> json) =
      _$EquipamentoInsumoInsumoResponseDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  String? get nome;
  set nome(String? value);
  @override
  @JsonKey(ignore: true)
  _$$EquipamentoInsumoInsumoResponseDTOImplCopyWith<
          _$EquipamentoInsumoInsumoResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
