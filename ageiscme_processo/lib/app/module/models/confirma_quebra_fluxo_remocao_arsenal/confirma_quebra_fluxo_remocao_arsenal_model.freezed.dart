// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'confirma_quebra_fluxo_remocao_arsenal_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConfirmaQuebraFluxoRemocaoArsenalModel
    _$ConfirmaQuebraFluxoRemocaoArsenalModelFromJson(
        Map<String, dynamic> json) {
  return _ConfirmaQuebraFluxoRemocaoArsenalModel.fromJson(json);
}

/// @nodoc
mixin _$ConfirmaQuebraFluxoRemocaoArsenalModel {
  bool? get solicitouConfirmacao => throw _privateConstructorUsedError;
  set solicitouConfirmacao(bool? value) => throw _privateConstructorUsedError;
  bool? get prosseguirQuebraFluxo => throw _privateConstructorUsedError;
  set prosseguirQuebraFluxo(bool? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConfirmaQuebraFluxoRemocaoArsenalModelCopyWith<
          ConfirmaQuebraFluxoRemocaoArsenalModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfirmaQuebraFluxoRemocaoArsenalModelCopyWith<$Res> {
  factory $ConfirmaQuebraFluxoRemocaoArsenalModelCopyWith(
          ConfirmaQuebraFluxoRemocaoArsenalModel value,
          $Res Function(ConfirmaQuebraFluxoRemocaoArsenalModel) then) =
      _$ConfirmaQuebraFluxoRemocaoArsenalModelCopyWithImpl<$Res,
          ConfirmaQuebraFluxoRemocaoArsenalModel>;
  @useResult
  $Res call({bool? solicitouConfirmacao, bool? prosseguirQuebraFluxo});
}

/// @nodoc
class _$ConfirmaQuebraFluxoRemocaoArsenalModelCopyWithImpl<$Res,
        $Val extends ConfirmaQuebraFluxoRemocaoArsenalModel>
    implements $ConfirmaQuebraFluxoRemocaoArsenalModelCopyWith<$Res> {
  _$ConfirmaQuebraFluxoRemocaoArsenalModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? solicitouConfirmacao = freezed,
    Object? prosseguirQuebraFluxo = freezed,
  }) {
    return _then(_value.copyWith(
      solicitouConfirmacao: freezed == solicitouConfirmacao
          ? _value.solicitouConfirmacao
          : solicitouConfirmacao // ignore: cast_nullable_to_non_nullable
              as bool?,
      prosseguirQuebraFluxo: freezed == prosseguirQuebraFluxo
          ? _value.prosseguirQuebraFluxo
          : prosseguirQuebraFluxo // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConfirmaQuebraFluxoRemocaoArsenalModelImplCopyWith<$Res>
    implements $ConfirmaQuebraFluxoRemocaoArsenalModelCopyWith<$Res> {
  factory _$$ConfirmaQuebraFluxoRemocaoArsenalModelImplCopyWith(
          _$ConfirmaQuebraFluxoRemocaoArsenalModelImpl value,
          $Res Function(_$ConfirmaQuebraFluxoRemocaoArsenalModelImpl) then) =
      __$$ConfirmaQuebraFluxoRemocaoArsenalModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? solicitouConfirmacao, bool? prosseguirQuebraFluxo});
}

/// @nodoc
class __$$ConfirmaQuebraFluxoRemocaoArsenalModelImplCopyWithImpl<$Res>
    extends _$ConfirmaQuebraFluxoRemocaoArsenalModelCopyWithImpl<$Res,
        _$ConfirmaQuebraFluxoRemocaoArsenalModelImpl>
    implements _$$ConfirmaQuebraFluxoRemocaoArsenalModelImplCopyWith<$Res> {
  __$$ConfirmaQuebraFluxoRemocaoArsenalModelImplCopyWithImpl(
      _$ConfirmaQuebraFluxoRemocaoArsenalModelImpl _value,
      $Res Function(_$ConfirmaQuebraFluxoRemocaoArsenalModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? solicitouConfirmacao = freezed,
    Object? prosseguirQuebraFluxo = freezed,
  }) {
    return _then(_$ConfirmaQuebraFluxoRemocaoArsenalModelImpl(
      solicitouConfirmacao: freezed == solicitouConfirmacao
          ? _value.solicitouConfirmacao
          : solicitouConfirmacao // ignore: cast_nullable_to_non_nullable
              as bool?,
      prosseguirQuebraFluxo: freezed == prosseguirQuebraFluxo
          ? _value.prosseguirQuebraFluxo
          : prosseguirQuebraFluxo // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConfirmaQuebraFluxoRemocaoArsenalModelImpl
    extends _ConfirmaQuebraFluxoRemocaoArsenalModel
    with DiagnosticableTreeMixin {
  _$ConfirmaQuebraFluxoRemocaoArsenalModelImpl(
      {this.solicitouConfirmacao, this.prosseguirQuebraFluxo})
      : super._();

  factory _$ConfirmaQuebraFluxoRemocaoArsenalModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ConfirmaQuebraFluxoRemocaoArsenalModelImplFromJson(json);

  @override
  bool? solicitouConfirmacao;
  @override
  bool? prosseguirQuebraFluxo;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ConfirmaQuebraFluxoRemocaoArsenalModel(solicitouConfirmacao: $solicitouConfirmacao, prosseguirQuebraFluxo: $prosseguirQuebraFluxo)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty('type', 'ConfirmaQuebraFluxoRemocaoArsenalModel'))
      ..add(DiagnosticsProperty('solicitouConfirmacao', solicitouConfirmacao))
      ..add(
          DiagnosticsProperty('prosseguirQuebraFluxo', prosseguirQuebraFluxo));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfirmaQuebraFluxoRemocaoArsenalModelImplCopyWith<
          _$ConfirmaQuebraFluxoRemocaoArsenalModelImpl>
      get copyWith =>
          __$$ConfirmaQuebraFluxoRemocaoArsenalModelImplCopyWithImpl<
              _$ConfirmaQuebraFluxoRemocaoArsenalModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConfirmaQuebraFluxoRemocaoArsenalModelImplToJson(
      this,
    );
  }
}

abstract class _ConfirmaQuebraFluxoRemocaoArsenalModel
    extends ConfirmaQuebraFluxoRemocaoArsenalModel {
  factory _ConfirmaQuebraFluxoRemocaoArsenalModel(
          {bool? solicitouConfirmacao, bool? prosseguirQuebraFluxo}) =
      _$ConfirmaQuebraFluxoRemocaoArsenalModelImpl;
  _ConfirmaQuebraFluxoRemocaoArsenalModel._() : super._();

  factory _ConfirmaQuebraFluxoRemocaoArsenalModel.fromJson(
          Map<String, dynamic> json) =
      _$ConfirmaQuebraFluxoRemocaoArsenalModelImpl.fromJson;

  @override
  bool? get solicitouConfirmacao;
  set solicitouConfirmacao(bool? value);
  @override
  bool? get prosseguirQuebraFluxo;
  set prosseguirQuebraFluxo(bool? value);
  @override
  @JsonKey(ignore: true)
  _$$ConfirmaQuebraFluxoRemocaoArsenalModelImplCopyWith<
          _$ConfirmaQuebraFluxoRemocaoArsenalModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
