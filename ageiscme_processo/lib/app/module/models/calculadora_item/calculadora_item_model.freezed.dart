// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calculadora_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CalculadoraItemModel _$CalculadoraItemModelFromJson(Map<String, dynamic> json) {
  return _CalculadoraItemModel.fromJson(json);
}

/// @nodoc
mixin _$CalculadoraItemModel {
  int? get codEstoque => throw _privateConstructorUsedError;
  set codEstoque(int? value) => throw _privateConstructorUsedError;
  String? get saldo => throw _privateConstructorUsedError;
  set saldo(String? value) => throw _privateConstructorUsedError;
  int? get valorInformado => throw _privateConstructorUsedError;
  set valorInformado(int? value) => throw _privateConstructorUsedError;
  bool? get calculadoraJaDefinida => throw _privateConstructorUsedError;
  set calculadoraJaDefinida(bool? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CalculadoraItemModelCopyWith<CalculadoraItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalculadoraItemModelCopyWith<$Res> {
  factory $CalculadoraItemModelCopyWith(CalculadoraItemModel value,
          $Res Function(CalculadoraItemModel) then) =
      _$CalculadoraItemModelCopyWithImpl<$Res, CalculadoraItemModel>;
  @useResult
  $Res call(
      {int? codEstoque,
      String? saldo,
      int? valorInformado,
      bool? calculadoraJaDefinida});
}

/// @nodoc
class _$CalculadoraItemModelCopyWithImpl<$Res,
        $Val extends CalculadoraItemModel>
    implements $CalculadoraItemModelCopyWith<$Res> {
  _$CalculadoraItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codEstoque = freezed,
    Object? saldo = freezed,
    Object? valorInformado = freezed,
    Object? calculadoraJaDefinida = freezed,
  }) {
    return _then(_value.copyWith(
      codEstoque: freezed == codEstoque
          ? _value.codEstoque
          : codEstoque // ignore: cast_nullable_to_non_nullable
              as int?,
      saldo: freezed == saldo
          ? _value.saldo
          : saldo // ignore: cast_nullable_to_non_nullable
              as String?,
      valorInformado: freezed == valorInformado
          ? _value.valorInformado
          : valorInformado // ignore: cast_nullable_to_non_nullable
              as int?,
      calculadoraJaDefinida: freezed == calculadoraJaDefinida
          ? _value.calculadoraJaDefinida
          : calculadoraJaDefinida // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CalculadoraItemModelImplCopyWith<$Res>
    implements $CalculadoraItemModelCopyWith<$Res> {
  factory _$$CalculadoraItemModelImplCopyWith(_$CalculadoraItemModelImpl value,
          $Res Function(_$CalculadoraItemModelImpl) then) =
      __$$CalculadoraItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? codEstoque,
      String? saldo,
      int? valorInformado,
      bool? calculadoraJaDefinida});
}

/// @nodoc
class __$$CalculadoraItemModelImplCopyWithImpl<$Res>
    extends _$CalculadoraItemModelCopyWithImpl<$Res, _$CalculadoraItemModelImpl>
    implements _$$CalculadoraItemModelImplCopyWith<$Res> {
  __$$CalculadoraItemModelImplCopyWithImpl(_$CalculadoraItemModelImpl _value,
      $Res Function(_$CalculadoraItemModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codEstoque = freezed,
    Object? saldo = freezed,
    Object? valorInformado = freezed,
    Object? calculadoraJaDefinida = freezed,
  }) {
    return _then(_$CalculadoraItemModelImpl(
      codEstoque: freezed == codEstoque
          ? _value.codEstoque
          : codEstoque // ignore: cast_nullable_to_non_nullable
              as int?,
      saldo: freezed == saldo
          ? _value.saldo
          : saldo // ignore: cast_nullable_to_non_nullable
              as String?,
      valorInformado: freezed == valorInformado
          ? _value.valorInformado
          : valorInformado // ignore: cast_nullable_to_non_nullable
              as int?,
      calculadoraJaDefinida: freezed == calculadoraJaDefinida
          ? _value.calculadoraJaDefinida
          : calculadoraJaDefinida // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CalculadoraItemModelImpl extends _CalculadoraItemModel
    with DiagnosticableTreeMixin {
  _$CalculadoraItemModelImpl(
      {required this.codEstoque,
      required this.saldo,
      required this.valorInformado,
      required this.calculadoraJaDefinida})
      : super._();

  factory _$CalculadoraItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CalculadoraItemModelImplFromJson(json);

  @override
  int? codEstoque;
  @override
  String? saldo;
  @override
  int? valorInformado;
  @override
  bool? calculadoraJaDefinida;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CalculadoraItemModel(codEstoque: $codEstoque, saldo: $saldo, valorInformado: $valorInformado, calculadoraJaDefinida: $calculadoraJaDefinida)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CalculadoraItemModel'))
      ..add(DiagnosticsProperty('codEstoque', codEstoque))
      ..add(DiagnosticsProperty('saldo', saldo))
      ..add(DiagnosticsProperty('valorInformado', valorInformado))
      ..add(
          DiagnosticsProperty('calculadoraJaDefinida', calculadoraJaDefinida));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CalculadoraItemModelImplCopyWith<_$CalculadoraItemModelImpl>
      get copyWith =>
          __$$CalculadoraItemModelImplCopyWithImpl<_$CalculadoraItemModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CalculadoraItemModelImplToJson(
      this,
    );
  }
}

abstract class _CalculadoraItemModel extends CalculadoraItemModel {
  factory _CalculadoraItemModel(
      {required int? codEstoque,
      required String? saldo,
      required int? valorInformado,
      required bool? calculadoraJaDefinida}) = _$CalculadoraItemModelImpl;
  _CalculadoraItemModel._() : super._();

  factory _CalculadoraItemModel.fromJson(Map<String, dynamic> json) =
      _$CalculadoraItemModelImpl.fromJson;

  @override
  int? get codEstoque;
  set codEstoque(int? value);
  @override
  String? get saldo;
  set saldo(String? value);
  @override
  int? get valorInformado;
  set valorInformado(int? value);
  @override
  bool? get calculadoraJaDefinida;
  set calculadoraJaDefinida(bool? value);
  @override
  @JsonKey(ignore: true)
  _$$CalculadoraItemModelImplCopyWith<_$CalculadoraItemModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
