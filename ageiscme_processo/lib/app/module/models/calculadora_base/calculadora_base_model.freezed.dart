// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calculadora_base_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CalculadoraBaseModel _$CalculadoraBaseModelFromJson(Map<String, dynamic> json) {
  return _CalculadoraBaseModel.fromJson(json);
}

/// @nodoc
mixin _$CalculadoraBaseModel {
  bool? get utilizarCalculadora => throw _privateConstructorUsedError;
  set utilizarCalculadora(bool? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CalculadoraBaseModelCopyWith<CalculadoraBaseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalculadoraBaseModelCopyWith<$Res> {
  factory $CalculadoraBaseModelCopyWith(CalculadoraBaseModel value,
          $Res Function(CalculadoraBaseModel) then) =
      _$CalculadoraBaseModelCopyWithImpl<$Res, CalculadoraBaseModel>;
  @useResult
  $Res call({bool? utilizarCalculadora});
}

/// @nodoc
class _$CalculadoraBaseModelCopyWithImpl<$Res,
        $Val extends CalculadoraBaseModel>
    implements $CalculadoraBaseModelCopyWith<$Res> {
  _$CalculadoraBaseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? utilizarCalculadora = freezed,
  }) {
    return _then(_value.copyWith(
      utilizarCalculadora: freezed == utilizarCalculadora
          ? _value.utilizarCalculadora
          : utilizarCalculadora // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CalculadoraBaseModelImplCopyWith<$Res>
    implements $CalculadoraBaseModelCopyWith<$Res> {
  factory _$$CalculadoraBaseModelImplCopyWith(_$CalculadoraBaseModelImpl value,
          $Res Function(_$CalculadoraBaseModelImpl) then) =
      __$$CalculadoraBaseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? utilizarCalculadora});
}

/// @nodoc
class __$$CalculadoraBaseModelImplCopyWithImpl<$Res>
    extends _$CalculadoraBaseModelCopyWithImpl<$Res, _$CalculadoraBaseModelImpl>
    implements _$$CalculadoraBaseModelImplCopyWith<$Res> {
  __$$CalculadoraBaseModelImplCopyWithImpl(_$CalculadoraBaseModelImpl _value,
      $Res Function(_$CalculadoraBaseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? utilizarCalculadora = freezed,
  }) {
    return _then(_$CalculadoraBaseModelImpl(
      utilizarCalculadora: freezed == utilizarCalculadora
          ? _value.utilizarCalculadora
          : utilizarCalculadora // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CalculadoraBaseModelImpl extends _CalculadoraBaseModel
    with DiagnosticableTreeMixin {
  _$CalculadoraBaseModelImpl({required this.utilizarCalculadora}) : super._();

  factory _$CalculadoraBaseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CalculadoraBaseModelImplFromJson(json);

  @override
  bool? utilizarCalculadora;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CalculadoraBaseModel(utilizarCalculadora: $utilizarCalculadora)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CalculadoraBaseModel'))
      ..add(DiagnosticsProperty('utilizarCalculadora', utilizarCalculadora));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CalculadoraBaseModelImplCopyWith<_$CalculadoraBaseModelImpl>
      get copyWith =>
          __$$CalculadoraBaseModelImplCopyWithImpl<_$CalculadoraBaseModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CalculadoraBaseModelImplToJson(
      this,
    );
  }
}

abstract class _CalculadoraBaseModel extends CalculadoraBaseModel {
  factory _CalculadoraBaseModel({required bool? utilizarCalculadora}) =
      _$CalculadoraBaseModelImpl;
  _CalculadoraBaseModel._() : super._();

  factory _CalculadoraBaseModel.fromJson(Map<String, dynamic> json) =
      _$CalculadoraBaseModelImpl.fromJson;

  @override
  bool? get utilizarCalculadora;
  set utilizarCalculadora(bool? value);
  @override
  @JsonKey(ignore: true)
  _$$CalculadoraBaseModelImplCopyWith<_$CalculadoraBaseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
