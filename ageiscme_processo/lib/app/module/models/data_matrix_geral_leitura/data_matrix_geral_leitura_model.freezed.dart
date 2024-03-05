// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_matrix_geral_leitura_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DataMatrixGeralLeituraModel _$DataMatrixGeralLeituraModelFromJson(
    Map<String, dynamic> json) {
  return _DataMatrixGeralLeituraModel.fromJson(json);
}

/// @nodoc
mixin _$DataMatrixGeralLeituraModel {
  int? get codUsuarioLiberacao => throw _privateConstructorUsedError;
  set codUsuarioLiberacao(int? value) => throw _privateConstructorUsedError;
  int? get codKit => throw _privateConstructorUsedError;
  set codKit(int? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataMatrixGeralLeituraModelCopyWith<DataMatrixGeralLeituraModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataMatrixGeralLeituraModelCopyWith<$Res> {
  factory $DataMatrixGeralLeituraModelCopyWith(
          DataMatrixGeralLeituraModel value,
          $Res Function(DataMatrixGeralLeituraModel) then) =
      _$DataMatrixGeralLeituraModelCopyWithImpl<$Res,
          DataMatrixGeralLeituraModel>;
  @useResult
  $Res call({int? codUsuarioLiberacao, int? codKit});
}

/// @nodoc
class _$DataMatrixGeralLeituraModelCopyWithImpl<$Res,
        $Val extends DataMatrixGeralLeituraModel>
    implements $DataMatrixGeralLeituraModelCopyWith<$Res> {
  _$DataMatrixGeralLeituraModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codUsuarioLiberacao = freezed,
    Object? codKit = freezed,
  }) {
    return _then(_value.copyWith(
      codUsuarioLiberacao: freezed == codUsuarioLiberacao
          ? _value.codUsuarioLiberacao
          : codUsuarioLiberacao // ignore: cast_nullable_to_non_nullable
              as int?,
      codKit: freezed == codKit
          ? _value.codKit
          : codKit // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataMatrixGeralLeituraModelImplCopyWith<$Res>
    implements $DataMatrixGeralLeituraModelCopyWith<$Res> {
  factory _$$DataMatrixGeralLeituraModelImplCopyWith(
          _$DataMatrixGeralLeituraModelImpl value,
          $Res Function(_$DataMatrixGeralLeituraModelImpl) then) =
      __$$DataMatrixGeralLeituraModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? codUsuarioLiberacao, int? codKit});
}

/// @nodoc
class __$$DataMatrixGeralLeituraModelImplCopyWithImpl<$Res>
    extends _$DataMatrixGeralLeituraModelCopyWithImpl<$Res,
        _$DataMatrixGeralLeituraModelImpl>
    implements _$$DataMatrixGeralLeituraModelImplCopyWith<$Res> {
  __$$DataMatrixGeralLeituraModelImplCopyWithImpl(
      _$DataMatrixGeralLeituraModelImpl _value,
      $Res Function(_$DataMatrixGeralLeituraModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codUsuarioLiberacao = freezed,
    Object? codKit = freezed,
  }) {
    return _then(_$DataMatrixGeralLeituraModelImpl(
      codUsuarioLiberacao: freezed == codUsuarioLiberacao
          ? _value.codUsuarioLiberacao
          : codUsuarioLiberacao // ignore: cast_nullable_to_non_nullable
              as int?,
      codKit: freezed == codKit
          ? _value.codKit
          : codKit // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataMatrixGeralLeituraModelImpl extends _DataMatrixGeralLeituraModel
    with DiagnosticableTreeMixin {
  _$DataMatrixGeralLeituraModelImpl({this.codUsuarioLiberacao, this.codKit})
      : super._();

  factory _$DataMatrixGeralLeituraModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DataMatrixGeralLeituraModelImplFromJson(json);

  @override
  int? codUsuarioLiberacao;
  @override
  int? codKit;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DataMatrixGeralLeituraModel(codUsuarioLiberacao: $codUsuarioLiberacao, codKit: $codKit)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DataMatrixGeralLeituraModel'))
      ..add(DiagnosticsProperty('codUsuarioLiberacao', codUsuarioLiberacao))
      ..add(DiagnosticsProperty('codKit', codKit));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataMatrixGeralLeituraModelImplCopyWith<_$DataMatrixGeralLeituraModelImpl>
      get copyWith => __$$DataMatrixGeralLeituraModelImplCopyWithImpl<
          _$DataMatrixGeralLeituraModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataMatrixGeralLeituraModelImplToJson(
      this,
    );
  }
}

abstract class _DataMatrixGeralLeituraModel
    extends DataMatrixGeralLeituraModel {
  factory _DataMatrixGeralLeituraModel(
      {int? codUsuarioLiberacao,
      int? codKit}) = _$DataMatrixGeralLeituraModelImpl;
  _DataMatrixGeralLeituraModel._() : super._();

  factory _DataMatrixGeralLeituraModel.fromJson(Map<String, dynamic> json) =
      _$DataMatrixGeralLeituraModelImpl.fromJson;

  @override
  int? get codUsuarioLiberacao;
  set codUsuarioLiberacao(int? value);
  @override
  int? get codKit;
  set codKit(int? value);
  @override
  @JsonKey(ignore: true)
  _$$DataMatrixGeralLeituraModelImplCopyWith<_$DataMatrixGeralLeituraModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
