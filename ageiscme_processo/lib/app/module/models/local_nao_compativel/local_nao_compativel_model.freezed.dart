// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_nao_compativel_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LocalNaoCompativelModel _$LocalNaoCompativelModelFromJson(
    Map<String, dynamic> json) {
  return _LocalNaoCompativelModel.fromJson(json);
}

/// @nodoc
mixin _$LocalNaoCompativelModel {
  int? get codUsuarioResponsavel => throw _privateConstructorUsedError;
  set codUsuarioResponsavel(int? value) => throw _privateConstructorUsedError;
  bool? get confirmou => throw _privateConstructorUsedError;
  set confirmou(bool? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocalNaoCompativelModelCopyWith<LocalNaoCompativelModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalNaoCompativelModelCopyWith<$Res> {
  factory $LocalNaoCompativelModelCopyWith(LocalNaoCompativelModel value,
          $Res Function(LocalNaoCompativelModel) then) =
      _$LocalNaoCompativelModelCopyWithImpl<$Res, LocalNaoCompativelModel>;
  @useResult
  $Res call({int? codUsuarioResponsavel, bool? confirmou});
}

/// @nodoc
class _$LocalNaoCompativelModelCopyWithImpl<$Res,
        $Val extends LocalNaoCompativelModel>
    implements $LocalNaoCompativelModelCopyWith<$Res> {
  _$LocalNaoCompativelModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codUsuarioResponsavel = freezed,
    Object? confirmou = freezed,
  }) {
    return _then(_value.copyWith(
      codUsuarioResponsavel: freezed == codUsuarioResponsavel
          ? _value.codUsuarioResponsavel
          : codUsuarioResponsavel // ignore: cast_nullable_to_non_nullable
              as int?,
      confirmou: freezed == confirmou
          ? _value.confirmou
          : confirmou // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocalNaoCompativelModelImplCopyWith<$Res>
    implements $LocalNaoCompativelModelCopyWith<$Res> {
  factory _$$LocalNaoCompativelModelImplCopyWith(
          _$LocalNaoCompativelModelImpl value,
          $Res Function(_$LocalNaoCompativelModelImpl) then) =
      __$$LocalNaoCompativelModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? codUsuarioResponsavel, bool? confirmou});
}

/// @nodoc
class __$$LocalNaoCompativelModelImplCopyWithImpl<$Res>
    extends _$LocalNaoCompativelModelCopyWithImpl<$Res,
        _$LocalNaoCompativelModelImpl>
    implements _$$LocalNaoCompativelModelImplCopyWith<$Res> {
  __$$LocalNaoCompativelModelImplCopyWithImpl(
      _$LocalNaoCompativelModelImpl _value,
      $Res Function(_$LocalNaoCompativelModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codUsuarioResponsavel = freezed,
    Object? confirmou = freezed,
  }) {
    return _then(_$LocalNaoCompativelModelImpl(
      codUsuarioResponsavel: freezed == codUsuarioResponsavel
          ? _value.codUsuarioResponsavel
          : codUsuarioResponsavel // ignore: cast_nullable_to_non_nullable
              as int?,
      confirmou: freezed == confirmou
          ? _value.confirmou
          : confirmou // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocalNaoCompativelModelImpl extends _LocalNaoCompativelModel
    with DiagnosticableTreeMixin {
  _$LocalNaoCompativelModelImpl({this.codUsuarioResponsavel, this.confirmou})
      : super._();

  factory _$LocalNaoCompativelModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocalNaoCompativelModelImplFromJson(json);

  @override
  int? codUsuarioResponsavel;
  @override
  bool? confirmou;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocalNaoCompativelModel(codUsuarioResponsavel: $codUsuarioResponsavel, confirmou: $confirmou)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LocalNaoCompativelModel'))
      ..add(DiagnosticsProperty('codUsuarioResponsavel', codUsuarioResponsavel))
      ..add(DiagnosticsProperty('confirmou', confirmou));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalNaoCompativelModelImplCopyWith<_$LocalNaoCompativelModelImpl>
      get copyWith => __$$LocalNaoCompativelModelImplCopyWithImpl<
          _$LocalNaoCompativelModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocalNaoCompativelModelImplToJson(
      this,
    );
  }
}

abstract class _LocalNaoCompativelModel extends LocalNaoCompativelModel {
  factory _LocalNaoCompativelModel(
      {int? codUsuarioResponsavel,
      bool? confirmou}) = _$LocalNaoCompativelModelImpl;
  _LocalNaoCompativelModel._() : super._();

  factory _LocalNaoCompativelModel.fromJson(Map<String, dynamic> json) =
      _$LocalNaoCompativelModelImpl.fromJson;

  @override
  int? get codUsuarioResponsavel;
  set codUsuarioResponsavel(int? value);
  @override
  bool? get confirmou;
  set confirmou(bool? value);
  @override
  @JsonKey(ignore: true)
  _$$LocalNaoCompativelModelImplCopyWith<_$LocalNaoCompativelModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
