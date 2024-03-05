// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'indicador_processo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IndicadorProcessoModel _$IndicadorProcessoModelFromJson(
    Map<String, dynamic> json) {
  return _IndicadorProcessoModel.fromJson(json);
}

/// @nodoc
mixin _$IndicadorProcessoModel {
  String? get codBarra => throw _privateConstructorUsedError;
  set codBarra(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IndicadorProcessoModelCopyWith<IndicadorProcessoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IndicadorProcessoModelCopyWith<$Res> {
  factory $IndicadorProcessoModelCopyWith(IndicadorProcessoModel value,
          $Res Function(IndicadorProcessoModel) then) =
      _$IndicadorProcessoModelCopyWithImpl<$Res, IndicadorProcessoModel>;
  @useResult
  $Res call({String? codBarra});
}

/// @nodoc
class _$IndicadorProcessoModelCopyWithImpl<$Res,
        $Val extends IndicadorProcessoModel>
    implements $IndicadorProcessoModelCopyWith<$Res> {
  _$IndicadorProcessoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codBarra = freezed,
  }) {
    return _then(_value.copyWith(
      codBarra: freezed == codBarra
          ? _value.codBarra
          : codBarra // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IndicadorProcessoModelImplCopyWith<$Res>
    implements $IndicadorProcessoModelCopyWith<$Res> {
  factory _$$IndicadorProcessoModelImplCopyWith(
          _$IndicadorProcessoModelImpl value,
          $Res Function(_$IndicadorProcessoModelImpl) then) =
      __$$IndicadorProcessoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? codBarra});
}

/// @nodoc
class __$$IndicadorProcessoModelImplCopyWithImpl<$Res>
    extends _$IndicadorProcessoModelCopyWithImpl<$Res,
        _$IndicadorProcessoModelImpl>
    implements _$$IndicadorProcessoModelImplCopyWith<$Res> {
  __$$IndicadorProcessoModelImplCopyWithImpl(
      _$IndicadorProcessoModelImpl _value,
      $Res Function(_$IndicadorProcessoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codBarra = freezed,
  }) {
    return _then(_$IndicadorProcessoModelImpl(
      codBarra: freezed == codBarra
          ? _value.codBarra
          : codBarra // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IndicadorProcessoModelImpl extends _IndicadorProcessoModel
    with DiagnosticableTreeMixin {
  _$IndicadorProcessoModelImpl({this.codBarra}) : super._();

  factory _$IndicadorProcessoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$IndicadorProcessoModelImplFromJson(json);

  @override
  String? codBarra;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IndicadorProcessoModel(codBarra: $codBarra)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'IndicadorProcessoModel'))
      ..add(DiagnosticsProperty('codBarra', codBarra));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IndicadorProcessoModelImplCopyWith<_$IndicadorProcessoModelImpl>
      get copyWith => __$$IndicadorProcessoModelImplCopyWithImpl<
          _$IndicadorProcessoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IndicadorProcessoModelImplToJson(
      this,
    );
  }
}

abstract class _IndicadorProcessoModel extends IndicadorProcessoModel {
  factory _IndicadorProcessoModel({String? codBarra}) =
      _$IndicadorProcessoModelImpl;
  _IndicadorProcessoModel._() : super._();

  factory _IndicadorProcessoModel.fromJson(Map<String, dynamic> json) =
      _$IndicadorProcessoModelImpl.fromJson;

  @override
  String? get codBarra;
  set codBarra(String? value);
  @override
  @JsonKey(ignore: true)
  _$$IndicadorProcessoModelImplCopyWith<_$IndicadorProcessoModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
