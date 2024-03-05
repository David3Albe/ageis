// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'indicador_biologico_processo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IndicadorBiologicoProcessoModel _$IndicadorBiologicoProcessoModelFromJson(
    Map<String, dynamic> json) {
  return _IndicadorBiologicoProcessoModel.fromJson(json);
}

/// @nodoc
mixin _$IndicadorBiologicoProcessoModel {
  String? get codBarra => throw _privateConstructorUsedError;
  set codBarra(String? value) => throw _privateConstructorUsedError;
  int? get codServicoTipo => throw _privateConstructorUsedError;
  set codServicoTipo(int? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IndicadorBiologicoProcessoModelCopyWith<IndicadorBiologicoProcessoModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IndicadorBiologicoProcessoModelCopyWith<$Res> {
  factory $IndicadorBiologicoProcessoModelCopyWith(
          IndicadorBiologicoProcessoModel value,
          $Res Function(IndicadorBiologicoProcessoModel) then) =
      _$IndicadorBiologicoProcessoModelCopyWithImpl<$Res,
          IndicadorBiologicoProcessoModel>;
  @useResult
  $Res call({String? codBarra, int? codServicoTipo});
}

/// @nodoc
class _$IndicadorBiologicoProcessoModelCopyWithImpl<$Res,
        $Val extends IndicadorBiologicoProcessoModel>
    implements $IndicadorBiologicoProcessoModelCopyWith<$Res> {
  _$IndicadorBiologicoProcessoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codBarra = freezed,
    Object? codServicoTipo = freezed,
  }) {
    return _then(_value.copyWith(
      codBarra: freezed == codBarra
          ? _value.codBarra
          : codBarra // ignore: cast_nullable_to_non_nullable
              as String?,
      codServicoTipo: freezed == codServicoTipo
          ? _value.codServicoTipo
          : codServicoTipo // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IndicadorBiologicoProcessoModelImplCopyWith<$Res>
    implements $IndicadorBiologicoProcessoModelCopyWith<$Res> {
  factory _$$IndicadorBiologicoProcessoModelImplCopyWith(
          _$IndicadorBiologicoProcessoModelImpl value,
          $Res Function(_$IndicadorBiologicoProcessoModelImpl) then) =
      __$$IndicadorBiologicoProcessoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? codBarra, int? codServicoTipo});
}

/// @nodoc
class __$$IndicadorBiologicoProcessoModelImplCopyWithImpl<$Res>
    extends _$IndicadorBiologicoProcessoModelCopyWithImpl<$Res,
        _$IndicadorBiologicoProcessoModelImpl>
    implements _$$IndicadorBiologicoProcessoModelImplCopyWith<$Res> {
  __$$IndicadorBiologicoProcessoModelImplCopyWithImpl(
      _$IndicadorBiologicoProcessoModelImpl _value,
      $Res Function(_$IndicadorBiologicoProcessoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codBarra = freezed,
    Object? codServicoTipo = freezed,
  }) {
    return _then(_$IndicadorBiologicoProcessoModelImpl(
      codBarra: freezed == codBarra
          ? _value.codBarra
          : codBarra // ignore: cast_nullable_to_non_nullable
              as String?,
      codServicoTipo: freezed == codServicoTipo
          ? _value.codServicoTipo
          : codServicoTipo // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IndicadorBiologicoProcessoModelImpl
    extends _IndicadorBiologicoProcessoModel with DiagnosticableTreeMixin {
  _$IndicadorBiologicoProcessoModelImpl({this.codBarra, this.codServicoTipo})
      : super._();

  factory _$IndicadorBiologicoProcessoModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$IndicadorBiologicoProcessoModelImplFromJson(json);

  @override
  String? codBarra;
  @override
  int? codServicoTipo;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IndicadorBiologicoProcessoModel(codBarra: $codBarra, codServicoTipo: $codServicoTipo)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'IndicadorBiologicoProcessoModel'))
      ..add(DiagnosticsProperty('codBarra', codBarra))
      ..add(DiagnosticsProperty('codServicoTipo', codServicoTipo));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IndicadorBiologicoProcessoModelImplCopyWith<
          _$IndicadorBiologicoProcessoModelImpl>
      get copyWith => __$$IndicadorBiologicoProcessoModelImplCopyWithImpl<
          _$IndicadorBiologicoProcessoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IndicadorBiologicoProcessoModelImplToJson(
      this,
    );
  }
}

abstract class _IndicadorBiologicoProcessoModel
    extends IndicadorBiologicoProcessoModel {
  factory _IndicadorBiologicoProcessoModel(
      {String? codBarra,
      int? codServicoTipo}) = _$IndicadorBiologicoProcessoModelImpl;
  _IndicadorBiologicoProcessoModel._() : super._();

  factory _IndicadorBiologicoProcessoModel.fromJson(Map<String, dynamic> json) =
      _$IndicadorBiologicoProcessoModelImpl.fromJson;

  @override
  String? get codBarra;
  set codBarra(String? value);
  @override
  int? get codServicoTipo;
  set codServicoTipo(int? value);
  @override
  @JsonKey(ignore: true)
  _$$IndicadorBiologicoProcessoModelImplCopyWith<
          _$IndicadorBiologicoProcessoModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
