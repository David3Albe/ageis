// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lote_equipamento_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoteEquipamentoModel _$LoteEquipamentoModelFromJson(Map<String, dynamic> json) {
  return _LoteEquipamentoModel.fromJson(json);
}

/// @nodoc
mixin _$LoteEquipamentoModel {
  String? get codLote => throw _privateConstructorUsedError;
  set codLote(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoteEquipamentoModelCopyWith<LoteEquipamentoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoteEquipamentoModelCopyWith<$Res> {
  factory $LoteEquipamentoModelCopyWith(LoteEquipamentoModel value,
          $Res Function(LoteEquipamentoModel) then) =
      _$LoteEquipamentoModelCopyWithImpl<$Res, LoteEquipamentoModel>;
  @useResult
  $Res call({String? codLote});
}

/// @nodoc
class _$LoteEquipamentoModelCopyWithImpl<$Res,
        $Val extends LoteEquipamentoModel>
    implements $LoteEquipamentoModelCopyWith<$Res> {
  _$LoteEquipamentoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codLote = freezed,
  }) {
    return _then(_value.copyWith(
      codLote: freezed == codLote
          ? _value.codLote
          : codLote // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoteEquipamentoModelImplCopyWith<$Res>
    implements $LoteEquipamentoModelCopyWith<$Res> {
  factory _$$LoteEquipamentoModelImplCopyWith(_$LoteEquipamentoModelImpl value,
          $Res Function(_$LoteEquipamentoModelImpl) then) =
      __$$LoteEquipamentoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? codLote});
}

/// @nodoc
class __$$LoteEquipamentoModelImplCopyWithImpl<$Res>
    extends _$LoteEquipamentoModelCopyWithImpl<$Res, _$LoteEquipamentoModelImpl>
    implements _$$LoteEquipamentoModelImplCopyWith<$Res> {
  __$$LoteEquipamentoModelImplCopyWithImpl(_$LoteEquipamentoModelImpl _value,
      $Res Function(_$LoteEquipamentoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codLote = freezed,
  }) {
    return _then(_$LoteEquipamentoModelImpl(
      codLote: freezed == codLote
          ? _value.codLote
          : codLote // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoteEquipamentoModelImpl extends _LoteEquipamentoModel
    with DiagnosticableTreeMixin {
  _$LoteEquipamentoModelImpl({this.codLote}) : super._();

  factory _$LoteEquipamentoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoteEquipamentoModelImplFromJson(json);

  @override
  String? codLote;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoteEquipamentoModel(codLote: $codLote)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoteEquipamentoModel'))
      ..add(DiagnosticsProperty('codLote', codLote));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoteEquipamentoModelImplCopyWith<_$LoteEquipamentoModelImpl>
      get copyWith =>
          __$$LoteEquipamentoModelImplCopyWithImpl<_$LoteEquipamentoModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoteEquipamentoModelImplToJson(
      this,
    );
  }
}

abstract class _LoteEquipamentoModel extends LoteEquipamentoModel {
  factory _LoteEquipamentoModel({String? codLote}) = _$LoteEquipamentoModelImpl;
  _LoteEquipamentoModel._() : super._();

  factory _LoteEquipamentoModel.fromJson(Map<String, dynamic> json) =
      _$LoteEquipamentoModelImpl.fromJson;

  @override
  String? get codLote;
  set codLote(String? value);
  @override
  @JsonKey(ignore: true)
  _$$LoteEquipamentoModelImplCopyWith<_$LoteEquipamentoModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
