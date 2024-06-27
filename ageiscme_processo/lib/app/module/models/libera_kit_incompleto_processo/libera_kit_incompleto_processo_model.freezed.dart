// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'libera_kit_incompleto_processo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LiberaKitIncompletoProcessoModel _$LiberaKitIncompletoProcessoModelFromJson(
    Map<String, dynamic> json) {
  return _LiberaKitIncompletoProcessoModel.fromJson(json);
}

/// @nodoc
mixin _$LiberaKitIncompletoProcessoModel {
  int? get codKit => throw _privateConstructorUsedError;
  set codKit(int? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LiberaKitIncompletoProcessoModelCopyWith<LiberaKitIncompletoProcessoModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiberaKitIncompletoProcessoModelCopyWith<$Res> {
  factory $LiberaKitIncompletoProcessoModelCopyWith(
          LiberaKitIncompletoProcessoModel value,
          $Res Function(LiberaKitIncompletoProcessoModel) then) =
      _$LiberaKitIncompletoProcessoModelCopyWithImpl<$Res,
          LiberaKitIncompletoProcessoModel>;
  @useResult
  $Res call({int? codKit});
}

/// @nodoc
class _$LiberaKitIncompletoProcessoModelCopyWithImpl<$Res,
        $Val extends LiberaKitIncompletoProcessoModel>
    implements $LiberaKitIncompletoProcessoModelCopyWith<$Res> {
  _$LiberaKitIncompletoProcessoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codKit = freezed,
  }) {
    return _then(_value.copyWith(
      codKit: freezed == codKit
          ? _value.codKit
          : codKit // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LiberaKitIncompletoProcessoModelImplCopyWith<$Res>
    implements $LiberaKitIncompletoProcessoModelCopyWith<$Res> {
  factory _$$LiberaKitIncompletoProcessoModelImplCopyWith(
          _$LiberaKitIncompletoProcessoModelImpl value,
          $Res Function(_$LiberaKitIncompletoProcessoModelImpl) then) =
      __$$LiberaKitIncompletoProcessoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? codKit});
}

/// @nodoc
class __$$LiberaKitIncompletoProcessoModelImplCopyWithImpl<$Res>
    extends _$LiberaKitIncompletoProcessoModelCopyWithImpl<$Res,
        _$LiberaKitIncompletoProcessoModelImpl>
    implements _$$LiberaKitIncompletoProcessoModelImplCopyWith<$Res> {
  __$$LiberaKitIncompletoProcessoModelImplCopyWithImpl(
      _$LiberaKitIncompletoProcessoModelImpl _value,
      $Res Function(_$LiberaKitIncompletoProcessoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codKit = freezed,
  }) {
    return _then(_$LiberaKitIncompletoProcessoModelImpl(
      codKit: freezed == codKit
          ? _value.codKit
          : codKit // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LiberaKitIncompletoProcessoModelImpl
    extends _LiberaKitIncompletoProcessoModel with DiagnosticableTreeMixin {
  _$LiberaKitIncompletoProcessoModelImpl({this.codKit}) : super._();

  factory _$LiberaKitIncompletoProcessoModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$LiberaKitIncompletoProcessoModelImplFromJson(json);

  @override
  int? codKit;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LiberaKitIncompletoProcessoModel(codKit: $codKit)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LiberaKitIncompletoProcessoModel'))
      ..add(DiagnosticsProperty('codKit', codKit));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LiberaKitIncompletoProcessoModelImplCopyWith<
          _$LiberaKitIncompletoProcessoModelImpl>
      get copyWith => __$$LiberaKitIncompletoProcessoModelImplCopyWithImpl<
          _$LiberaKitIncompletoProcessoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LiberaKitIncompletoProcessoModelImplToJson(
      this,
    );
  }
}

abstract class _LiberaKitIncompletoProcessoModel
    extends LiberaKitIncompletoProcessoModel {
  factory _LiberaKitIncompletoProcessoModel({int? codKit}) =
      _$LiberaKitIncompletoProcessoModelImpl;
  _LiberaKitIncompletoProcessoModel._() : super._();

  factory _LiberaKitIncompletoProcessoModel.fromJson(
          Map<String, dynamic> json) =
      _$LiberaKitIncompletoProcessoModelImpl.fromJson;

  @override
  int? get codKit;
  set codKit(int? value);
  @override
  @JsonKey(ignore: true)
  _$$LiberaKitIncompletoProcessoModelImplCopyWith<
          _$LiberaKitIncompletoProcessoModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
