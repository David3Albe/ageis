// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'integrador_kit_processo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IntegradorKitProcessoModel _$IntegradorKitProcessoModelFromJson(
    Map<String, dynamic> json) {
  return _IntegradorKitProcessoModel.fromJson(json);
}

/// @nodoc
mixin _$IntegradorKitProcessoModel {
  bool? get solicitouIntegradorKit => throw _privateConstructorUsedError;
  set solicitouIntegradorKit(bool? value) => throw _privateConstructorUsedError;
  bool? get utilizouIntegradorKit => throw _privateConstructorUsedError;
  set utilizouIntegradorKit(bool? value) => throw _privateConstructorUsedError;
  int? get codKit => throw _privateConstructorUsedError;
  set codKit(int? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IntegradorKitProcessoModelCopyWith<IntegradorKitProcessoModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IntegradorKitProcessoModelCopyWith<$Res> {
  factory $IntegradorKitProcessoModelCopyWith(IntegradorKitProcessoModel value,
          $Res Function(IntegradorKitProcessoModel) then) =
      _$IntegradorKitProcessoModelCopyWithImpl<$Res,
          IntegradorKitProcessoModel>;
  @useResult
  $Res call(
      {bool? solicitouIntegradorKit, bool? utilizouIntegradorKit, int? codKit});
}

/// @nodoc
class _$IntegradorKitProcessoModelCopyWithImpl<$Res,
        $Val extends IntegradorKitProcessoModel>
    implements $IntegradorKitProcessoModelCopyWith<$Res> {
  _$IntegradorKitProcessoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? solicitouIntegradorKit = freezed,
    Object? utilizouIntegradorKit = freezed,
    Object? codKit = freezed,
  }) {
    return _then(_value.copyWith(
      solicitouIntegradorKit: freezed == solicitouIntegradorKit
          ? _value.solicitouIntegradorKit
          : solicitouIntegradorKit // ignore: cast_nullable_to_non_nullable
              as bool?,
      utilizouIntegradorKit: freezed == utilizouIntegradorKit
          ? _value.utilizouIntegradorKit
          : utilizouIntegradorKit // ignore: cast_nullable_to_non_nullable
              as bool?,
      codKit: freezed == codKit
          ? _value.codKit
          : codKit // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IntegradorKitProcessoModelImplCopyWith<$Res>
    implements $IntegradorKitProcessoModelCopyWith<$Res> {
  factory _$$IntegradorKitProcessoModelImplCopyWith(
          _$IntegradorKitProcessoModelImpl value,
          $Res Function(_$IntegradorKitProcessoModelImpl) then) =
      __$$IntegradorKitProcessoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? solicitouIntegradorKit, bool? utilizouIntegradorKit, int? codKit});
}

/// @nodoc
class __$$IntegradorKitProcessoModelImplCopyWithImpl<$Res>
    extends _$IntegradorKitProcessoModelCopyWithImpl<$Res,
        _$IntegradorKitProcessoModelImpl>
    implements _$$IntegradorKitProcessoModelImplCopyWith<$Res> {
  __$$IntegradorKitProcessoModelImplCopyWithImpl(
      _$IntegradorKitProcessoModelImpl _value,
      $Res Function(_$IntegradorKitProcessoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? solicitouIntegradorKit = freezed,
    Object? utilizouIntegradorKit = freezed,
    Object? codKit = freezed,
  }) {
    return _then(_$IntegradorKitProcessoModelImpl(
      solicitouIntegradorKit: freezed == solicitouIntegradorKit
          ? _value.solicitouIntegradorKit
          : solicitouIntegradorKit // ignore: cast_nullable_to_non_nullable
              as bool?,
      utilizouIntegradorKit: freezed == utilizouIntegradorKit
          ? _value.utilizouIntegradorKit
          : utilizouIntegradorKit // ignore: cast_nullable_to_non_nullable
              as bool?,
      codKit: freezed == codKit
          ? _value.codKit
          : codKit // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IntegradorKitProcessoModelImpl extends _IntegradorKitProcessoModel
    with DiagnosticableTreeMixin {
  _$IntegradorKitProcessoModelImpl(
      {this.solicitouIntegradorKit, this.utilizouIntegradorKit, this.codKit})
      : super._();

  factory _$IntegradorKitProcessoModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$IntegradorKitProcessoModelImplFromJson(json);

  @override
  bool? solicitouIntegradorKit;
  @override
  bool? utilizouIntegradorKit;
  @override
  int? codKit;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IntegradorKitProcessoModel(solicitouIntegradorKit: $solicitouIntegradorKit, utilizouIntegradorKit: $utilizouIntegradorKit, codKit: $codKit)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'IntegradorKitProcessoModel'))
      ..add(
          DiagnosticsProperty('solicitouIntegradorKit', solicitouIntegradorKit))
      ..add(DiagnosticsProperty('utilizouIntegradorKit', utilizouIntegradorKit))
      ..add(DiagnosticsProperty('codKit', codKit));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IntegradorKitProcessoModelImplCopyWith<_$IntegradorKitProcessoModelImpl>
      get copyWith => __$$IntegradorKitProcessoModelImplCopyWithImpl<
          _$IntegradorKitProcessoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IntegradorKitProcessoModelImplToJson(
      this,
    );
  }
}

abstract class _IntegradorKitProcessoModel extends IntegradorKitProcessoModel {
  factory _IntegradorKitProcessoModel(
      {bool? solicitouIntegradorKit,
      bool? utilizouIntegradorKit,
      int? codKit}) = _$IntegradorKitProcessoModelImpl;
  _IntegradorKitProcessoModel._() : super._();

  factory _IntegradorKitProcessoModel.fromJson(Map<String, dynamic> json) =
      _$IntegradorKitProcessoModelImpl.fromJson;

  @override
  bool? get solicitouIntegradorKit;
  set solicitouIntegradorKit(bool? value);
  @override
  bool? get utilizouIntegradorKit;
  set utilizouIntegradorKit(bool? value);
  @override
  int? get codKit;
  set codKit(int? value);
  @override
  @JsonKey(ignore: true)
  _$$IntegradorKitProcessoModelImplCopyWith<_$IntegradorKitProcessoModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
