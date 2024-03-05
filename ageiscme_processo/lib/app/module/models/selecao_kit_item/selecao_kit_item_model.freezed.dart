// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selecao_kit_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SelecaoKitItemModel _$SelecaoKitItemModelFromJson(Map<String, dynamic> json) {
  return _SelecaoKitItemModel.fromJson(json);
}

/// @nodoc
mixin _$SelecaoKitItemModel {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  int get tipoSelecao => throw _privateConstructorUsedError;
  set tipoSelecao(int value) => throw _privateConstructorUsedError;
  int? get decisao => throw _privateConstructorUsedError;
  set decisao(int? value) => throw _privateConstructorUsedError;
  String? get mensagem => throw _privateConstructorUsedError;
  set mensagem(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SelecaoKitItemModelCopyWith<SelecaoKitItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelecaoKitItemModelCopyWith<$Res> {
  factory $SelecaoKitItemModelCopyWith(
          SelecaoKitItemModel value, $Res Function(SelecaoKitItemModel) then) =
      _$SelecaoKitItemModelCopyWithImpl<$Res, SelecaoKitItemModel>;
  @useResult
  $Res call({int cod, int tipoSelecao, int? decisao, String? mensagem});
}

/// @nodoc
class _$SelecaoKitItemModelCopyWithImpl<$Res, $Val extends SelecaoKitItemModel>
    implements $SelecaoKitItemModelCopyWith<$Res> {
  _$SelecaoKitItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? tipoSelecao = null,
    Object? decisao = freezed,
    Object? mensagem = freezed,
  }) {
    return _then(_value.copyWith(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      tipoSelecao: null == tipoSelecao
          ? _value.tipoSelecao
          : tipoSelecao // ignore: cast_nullable_to_non_nullable
              as int,
      decisao: freezed == decisao
          ? _value.decisao
          : decisao // ignore: cast_nullable_to_non_nullable
              as int?,
      mensagem: freezed == mensagem
          ? _value.mensagem
          : mensagem // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelecaoKitItemModelImplCopyWith<$Res>
    implements $SelecaoKitItemModelCopyWith<$Res> {
  factory _$$SelecaoKitItemModelImplCopyWith(_$SelecaoKitItemModelImpl value,
          $Res Function(_$SelecaoKitItemModelImpl) then) =
      __$$SelecaoKitItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, int tipoSelecao, int? decisao, String? mensagem});
}

/// @nodoc
class __$$SelecaoKitItemModelImplCopyWithImpl<$Res>
    extends _$SelecaoKitItemModelCopyWithImpl<$Res, _$SelecaoKitItemModelImpl>
    implements _$$SelecaoKitItemModelImplCopyWith<$Res> {
  __$$SelecaoKitItemModelImplCopyWithImpl(_$SelecaoKitItemModelImpl _value,
      $Res Function(_$SelecaoKitItemModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? tipoSelecao = null,
    Object? decisao = freezed,
    Object? mensagem = freezed,
  }) {
    return _then(_$SelecaoKitItemModelImpl(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      tipoSelecao: null == tipoSelecao
          ? _value.tipoSelecao
          : tipoSelecao // ignore: cast_nullable_to_non_nullable
              as int,
      decisao: freezed == decisao
          ? _value.decisao
          : decisao // ignore: cast_nullable_to_non_nullable
              as int?,
      mensagem: freezed == mensagem
          ? _value.mensagem
          : mensagem // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SelecaoKitItemModelImpl extends _SelecaoKitItemModel
    with DiagnosticableTreeMixin {
  _$SelecaoKitItemModelImpl(
      {required this.cod,
      required this.tipoSelecao,
      required this.decisao,
      required this.mensagem})
      : super._();

  factory _$SelecaoKitItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SelecaoKitItemModelImplFromJson(json);

  @override
  int cod;
  @override
  int tipoSelecao;
  @override
  int? decisao;
  @override
  String? mensagem;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SelecaoKitItemModel(cod: $cod, tipoSelecao: $tipoSelecao, decisao: $decisao, mensagem: $mensagem)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SelecaoKitItemModel'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('tipoSelecao', tipoSelecao))
      ..add(DiagnosticsProperty('decisao', decisao))
      ..add(DiagnosticsProperty('mensagem', mensagem));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelecaoKitItemModelImplCopyWith<_$SelecaoKitItemModelImpl> get copyWith =>
      __$$SelecaoKitItemModelImplCopyWithImpl<_$SelecaoKitItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SelecaoKitItemModelImplToJson(
      this,
    );
  }
}

abstract class _SelecaoKitItemModel extends SelecaoKitItemModel {
  factory _SelecaoKitItemModel(
      {required int cod,
      required int tipoSelecao,
      required int? decisao,
      required String? mensagem}) = _$SelecaoKitItemModelImpl;
  _SelecaoKitItemModel._() : super._();

  factory _SelecaoKitItemModel.fromJson(Map<String, dynamic> json) =
      _$SelecaoKitItemModelImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  int get tipoSelecao;
  set tipoSelecao(int value);
  @override
  int? get decisao;
  set decisao(int? value);
  @override
  String? get mensagem;
  set mensagem(String? value);
  @override
  @JsonKey(ignore: true)
  _$$SelecaoKitItemModelImplCopyWith<_$SelecaoKitItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
