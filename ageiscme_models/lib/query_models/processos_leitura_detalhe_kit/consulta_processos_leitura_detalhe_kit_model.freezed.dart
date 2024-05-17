// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consulta_processos_leitura_detalhe_kit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConsultaProcessosLeituraDetalheKitModel
    _$ConsultaProcessosLeituraDetalheKitModelFromJson(
        Map<String, dynamic> json) {
  return _ConsultaProcessosLeituraDetalheKitModel.fromJson(json);
}

/// @nodoc
mixin _$ConsultaProcessosLeituraDetalheKitModel {
  String? get legenda => throw _privateConstructorUsedError;
  set legenda(String? value) => throw _privateConstructorUsedError;
  String? get statusKit => throw _privateConstructorUsedError;
  set statusKit(String? value) => throw _privateConstructorUsedError;
  List<ConsultaProcessosLeituraDetalheKitItemModel> get itens =>
      throw _privateConstructorUsedError;
  set itens(List<ConsultaProcessosLeituraDetalheKitItemModel> value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConsultaProcessosLeituraDetalheKitModelCopyWith<
          ConsultaProcessosLeituraDetalheKitModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultaProcessosLeituraDetalheKitModelCopyWith<$Res> {
  factory $ConsultaProcessosLeituraDetalheKitModelCopyWith(
          ConsultaProcessosLeituraDetalheKitModel value,
          $Res Function(ConsultaProcessosLeituraDetalheKitModel) then) =
      _$ConsultaProcessosLeituraDetalheKitModelCopyWithImpl<$Res,
          ConsultaProcessosLeituraDetalheKitModel>;
  @useResult
  $Res call(
      {String? legenda,
      String? statusKit,
      List<ConsultaProcessosLeituraDetalheKitItemModel> itens});
}

/// @nodoc
class _$ConsultaProcessosLeituraDetalheKitModelCopyWithImpl<$Res,
        $Val extends ConsultaProcessosLeituraDetalheKitModel>
    implements $ConsultaProcessosLeituraDetalheKitModelCopyWith<$Res> {
  _$ConsultaProcessosLeituraDetalheKitModelCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? legenda = freezed,
    Object? statusKit = freezed,
    Object? itens = null,
  }) {
    return _then(_value.copyWith(
      legenda: freezed == legenda
          ? _value.legenda
          : legenda // ignore: cast_nullable_to_non_nullable
              as String?,
      statusKit: freezed == statusKit
          ? _value.statusKit
          : statusKit // ignore: cast_nullable_to_non_nullable
              as String?,
      itens: null == itens
          ? _value.itens
          : itens // ignore: cast_nullable_to_non_nullable
              as List<ConsultaProcessosLeituraDetalheKitItemModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConsultaProcessosLeituraDetalheKitModelImplCopyWith<$Res>
    implements $ConsultaProcessosLeituraDetalheKitModelCopyWith<$Res> {
  factory _$$ConsultaProcessosLeituraDetalheKitModelImplCopyWith(
          _$ConsultaProcessosLeituraDetalheKitModelImpl value,
          $Res Function(_$ConsultaProcessosLeituraDetalheKitModelImpl) then) =
      __$$ConsultaProcessosLeituraDetalheKitModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? legenda,
      String? statusKit,
      List<ConsultaProcessosLeituraDetalheKitItemModel> itens});
}

/// @nodoc
class __$$ConsultaProcessosLeituraDetalheKitModelImplCopyWithImpl<$Res>
    extends _$ConsultaProcessosLeituraDetalheKitModelCopyWithImpl<$Res,
        _$ConsultaProcessosLeituraDetalheKitModelImpl>
    implements _$$ConsultaProcessosLeituraDetalheKitModelImplCopyWith<$Res> {
  __$$ConsultaProcessosLeituraDetalheKitModelImplCopyWithImpl(
      _$ConsultaProcessosLeituraDetalheKitModelImpl _value,
      $Res Function(_$ConsultaProcessosLeituraDetalheKitModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? legenda = freezed,
    Object? statusKit = freezed,
    Object? itens = null,
  }) {
    return _then(_$ConsultaProcessosLeituraDetalheKitModelImpl(
      legenda: freezed == legenda
          ? _value.legenda
          : legenda // ignore: cast_nullable_to_non_nullable
              as String?,
      statusKit: freezed == statusKit
          ? _value.statusKit
          : statusKit // ignore: cast_nullable_to_non_nullable
              as String?,
      itens: null == itens
          ? _value.itens
          : itens // ignore: cast_nullable_to_non_nullable
              as List<ConsultaProcessosLeituraDetalheKitItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsultaProcessosLeituraDetalheKitModelImpl
    extends _ConsultaProcessosLeituraDetalheKitModel {
  _$ConsultaProcessosLeituraDetalheKitModelImpl(
      {this.legenda, this.statusKit, required this.itens})
      : super._();

  factory _$ConsultaProcessosLeituraDetalheKitModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ConsultaProcessosLeituraDetalheKitModelImplFromJson(json);

  @override
  String? legenda;
  @override
  String? statusKit;
  @override
  List<ConsultaProcessosLeituraDetalheKitItemModel> itens;

  @override
  String toString() {
    return 'ConsultaProcessosLeituraDetalheKitModel(legenda: $legenda, statusKit: $statusKit, itens: $itens)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsultaProcessosLeituraDetalheKitModelImplCopyWith<
          _$ConsultaProcessosLeituraDetalheKitModelImpl>
      get copyWith =>
          __$$ConsultaProcessosLeituraDetalheKitModelImplCopyWithImpl<
              _$ConsultaProcessosLeituraDetalheKitModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsultaProcessosLeituraDetalheKitModelImplToJson(
      this,
    );
  }
}

abstract class _ConsultaProcessosLeituraDetalheKitModel
    extends ConsultaProcessosLeituraDetalheKitModel {
  factory _ConsultaProcessosLeituraDetalheKitModel(
          {String? legenda,
          String? statusKit,
          required List<ConsultaProcessosLeituraDetalheKitItemModel> itens}) =
      _$ConsultaProcessosLeituraDetalheKitModelImpl;
  _ConsultaProcessosLeituraDetalheKitModel._() : super._();

  factory _ConsultaProcessosLeituraDetalheKitModel.fromJson(
          Map<String, dynamic> json) =
      _$ConsultaProcessosLeituraDetalheKitModelImpl.fromJson;

  @override
  String? get legenda;
  set legenda(String? value);
  @override
  String? get statusKit;
  set statusKit(String? value);
  @override
  List<ConsultaProcessosLeituraDetalheKitItemModel> get itens;
  set itens(List<ConsultaProcessosLeituraDetalheKitItemModel> value);
  @override
  @JsonKey(ignore: true)
  _$$ConsultaProcessosLeituraDetalheKitModelImplCopyWith<
          _$ConsultaProcessosLeituraDetalheKitModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
