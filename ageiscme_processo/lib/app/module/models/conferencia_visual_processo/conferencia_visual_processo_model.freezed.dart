// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conferencia_visual_processo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConferenciaVisualProcessoModel _$ConferenciaVisualProcessoModelFromJson(
    Map<String, dynamic> json) {
  return _ConferenciaVisualProcessoModel.fromJson(json);
}

/// @nodoc
mixin _$ConferenciaVisualProcessoModel {
  int? get codKit => throw _privateConstructorUsedError;
  set codKit(int? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConferenciaVisualProcessoModelCopyWith<ConferenciaVisualProcessoModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConferenciaVisualProcessoModelCopyWith<$Res> {
  factory $ConferenciaVisualProcessoModelCopyWith(
          ConferenciaVisualProcessoModel value,
          $Res Function(ConferenciaVisualProcessoModel) then) =
      _$ConferenciaVisualProcessoModelCopyWithImpl<$Res,
          ConferenciaVisualProcessoModel>;
  @useResult
  $Res call({int? codKit});
}

/// @nodoc
class _$ConferenciaVisualProcessoModelCopyWithImpl<$Res,
        $Val extends ConferenciaVisualProcessoModel>
    implements $ConferenciaVisualProcessoModelCopyWith<$Res> {
  _$ConferenciaVisualProcessoModelCopyWithImpl(this._value, this._then);

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
abstract class _$$ConferenciaVisualProcessoModelImplCopyWith<$Res>
    implements $ConferenciaVisualProcessoModelCopyWith<$Res> {
  factory _$$ConferenciaVisualProcessoModelImplCopyWith(
          _$ConferenciaVisualProcessoModelImpl value,
          $Res Function(_$ConferenciaVisualProcessoModelImpl) then) =
      __$$ConferenciaVisualProcessoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? codKit});
}

/// @nodoc
class __$$ConferenciaVisualProcessoModelImplCopyWithImpl<$Res>
    extends _$ConferenciaVisualProcessoModelCopyWithImpl<$Res,
        _$ConferenciaVisualProcessoModelImpl>
    implements _$$ConferenciaVisualProcessoModelImplCopyWith<$Res> {
  __$$ConferenciaVisualProcessoModelImplCopyWithImpl(
      _$ConferenciaVisualProcessoModelImpl _value,
      $Res Function(_$ConferenciaVisualProcessoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codKit = freezed,
  }) {
    return _then(_$ConferenciaVisualProcessoModelImpl(
      codKit: freezed == codKit
          ? _value.codKit
          : codKit // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConferenciaVisualProcessoModelImpl
    extends _ConferenciaVisualProcessoModel with DiagnosticableTreeMixin {
  _$ConferenciaVisualProcessoModelImpl({this.codKit}) : super._();

  factory _$ConferenciaVisualProcessoModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ConferenciaVisualProcessoModelImplFromJson(json);

  @override
  int? codKit;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ConferenciaVisualProcessoModel(codKit: $codKit)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ConferenciaVisualProcessoModel'))
      ..add(DiagnosticsProperty('codKit', codKit));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConferenciaVisualProcessoModelImplCopyWith<
          _$ConferenciaVisualProcessoModelImpl>
      get copyWith => __$$ConferenciaVisualProcessoModelImplCopyWithImpl<
          _$ConferenciaVisualProcessoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConferenciaVisualProcessoModelImplToJson(
      this,
    );
  }
}

abstract class _ConferenciaVisualProcessoModel
    extends ConferenciaVisualProcessoModel {
  factory _ConferenciaVisualProcessoModel({int? codKit}) =
      _$ConferenciaVisualProcessoModelImpl;
  _ConferenciaVisualProcessoModel._() : super._();

  factory _ConferenciaVisualProcessoModel.fromJson(Map<String, dynamic> json) =
      _$ConferenciaVisualProcessoModelImpl.fromJson;

  @override
  int? get codKit;
  set codKit(int? value);
  @override
  @JsonKey(ignore: true)
  _$$ConferenciaVisualProcessoModelImplCopyWith<
          _$ConferenciaVisualProcessoModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
