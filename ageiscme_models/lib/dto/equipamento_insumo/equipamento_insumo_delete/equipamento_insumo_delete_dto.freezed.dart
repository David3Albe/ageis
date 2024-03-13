// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'equipamento_insumo_delete_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EquipamentoInsumoDeleteDTO _$EquipamentoInsumoDeleteDTOFromJson(
    Map<String, dynamic> json) {
  return _EquipamentoInsumoDeleteDTO.fromJson(json);
}

/// @nodoc
mixin _$EquipamentoInsumoDeleteDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EquipamentoInsumoDeleteDTOCopyWith<EquipamentoInsumoDeleteDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EquipamentoInsumoDeleteDTOCopyWith<$Res> {
  factory $EquipamentoInsumoDeleteDTOCopyWith(EquipamentoInsumoDeleteDTO value,
          $Res Function(EquipamentoInsumoDeleteDTO) then) =
      _$EquipamentoInsumoDeleteDTOCopyWithImpl<$Res,
          EquipamentoInsumoDeleteDTO>;
  @useResult
  $Res call({int cod});
}

/// @nodoc
class _$EquipamentoInsumoDeleteDTOCopyWithImpl<$Res,
        $Val extends EquipamentoInsumoDeleteDTO>
    implements $EquipamentoInsumoDeleteDTOCopyWith<$Res> {
  _$EquipamentoInsumoDeleteDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
  }) {
    return _then(_value.copyWith(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EquipamentoInsumoDeleteDTOImplCopyWith<$Res>
    implements $EquipamentoInsumoDeleteDTOCopyWith<$Res> {
  factory _$$EquipamentoInsumoDeleteDTOImplCopyWith(
          _$EquipamentoInsumoDeleteDTOImpl value,
          $Res Function(_$EquipamentoInsumoDeleteDTOImpl) then) =
      __$$EquipamentoInsumoDeleteDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod});
}

/// @nodoc
class __$$EquipamentoInsumoDeleteDTOImplCopyWithImpl<$Res>
    extends _$EquipamentoInsumoDeleteDTOCopyWithImpl<$Res,
        _$EquipamentoInsumoDeleteDTOImpl>
    implements _$$EquipamentoInsumoDeleteDTOImplCopyWith<$Res> {
  __$$EquipamentoInsumoDeleteDTOImplCopyWithImpl(
      _$EquipamentoInsumoDeleteDTOImpl _value,
      $Res Function(_$EquipamentoInsumoDeleteDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
  }) {
    return _then(_$EquipamentoInsumoDeleteDTOImpl(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EquipamentoInsumoDeleteDTOImpl extends _EquipamentoInsumoDeleteDTO
    with DiagnosticableTreeMixin {
  _$EquipamentoInsumoDeleteDTOImpl({required this.cod}) : super._();

  factory _$EquipamentoInsumoDeleteDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$EquipamentoInsumoDeleteDTOImplFromJson(json);

  @override
  int cod;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EquipamentoInsumoDeleteDTO(cod: $cod)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EquipamentoInsumoDeleteDTO'))
      ..add(DiagnosticsProperty('cod', cod));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EquipamentoInsumoDeleteDTOImplCopyWith<_$EquipamentoInsumoDeleteDTOImpl>
      get copyWith => __$$EquipamentoInsumoDeleteDTOImplCopyWithImpl<
          _$EquipamentoInsumoDeleteDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EquipamentoInsumoDeleteDTOImplToJson(
      this,
    );
  }
}

abstract class _EquipamentoInsumoDeleteDTO extends EquipamentoInsumoDeleteDTO {
  factory _EquipamentoInsumoDeleteDTO({required int cod}) =
      _$EquipamentoInsumoDeleteDTOImpl;
  _EquipamentoInsumoDeleteDTO._() : super._();

  factory _EquipamentoInsumoDeleteDTO.fromJson(Map<String, dynamic> json) =
      _$EquipamentoInsumoDeleteDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  @JsonKey(ignore: true)
  _$$EquipamentoInsumoDeleteDTOImplCopyWith<_$EquipamentoInsumoDeleteDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
