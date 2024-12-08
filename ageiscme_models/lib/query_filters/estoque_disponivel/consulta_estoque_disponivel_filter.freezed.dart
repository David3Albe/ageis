// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consulta_estoque_disponivel_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConsultaEstoqueDisponivelFilter _$ConsultaEstoqueDisponivelFilterFromJson(
    Map<String, dynamic> json) {
  return _ConsultaEstoqueDisponivelFilter.fromJson(json);
}

/// @nodoc
mixin _$ConsultaEstoqueDisponivelFilter {
  int? get codEstoque => throw _privateConstructorUsedError;
  set codEstoque(int? value) => throw _privateConstructorUsedError;
  int? get codEstoqueLocal => throw _privateConstructorUsedError;
  set codEstoqueLocal(int? value) => throw _privateConstructorUsedError;
  int? get codKit => throw _privateConstructorUsedError;
  set codKit(int? value) => throw _privateConstructorUsedError;
  String? get codBarraKitContem => throw _privateConstructorUsedError;
  set codBarraKitContem(String? value) => throw _privateConstructorUsedError;
  int? get codItem => throw _privateConstructorUsedError;
  set codItem(int? value) => throw _privateConstructorUsedError;
  String? get idEtiquetaContem => throw _privateConstructorUsedError;
  set idEtiquetaContem(String? value) => throw _privateConstructorUsedError;
  int? get codProprietario => throw _privateConstructorUsedError;
  set codProprietario(int? value) => throw _privateConstructorUsedError;
  String? get tipoEstoque => throw _privateConstructorUsedError;
  set tipoEstoque(String? value) => throw _privateConstructorUsedError;
  bool? get ignorarRemovidos => throw _privateConstructorUsedError;
  set ignorarRemovidos(bool? value) => throw _privateConstructorUsedError;
  ItemModel? get item => throw _privateConstructorUsedError;
  set item(ItemModel? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConsultaEstoqueDisponivelFilterCopyWith<ConsultaEstoqueDisponivelFilter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultaEstoqueDisponivelFilterCopyWith<$Res> {
  factory $ConsultaEstoqueDisponivelFilterCopyWith(
          ConsultaEstoqueDisponivelFilter value,
          $Res Function(ConsultaEstoqueDisponivelFilter) then) =
      _$ConsultaEstoqueDisponivelFilterCopyWithImpl<$Res,
          ConsultaEstoqueDisponivelFilter>;
  @useResult
  $Res call(
      {int? codEstoque,
      int? codEstoqueLocal,
      int? codKit,
      String? codBarraKitContem,
      int? codItem,
      String? idEtiquetaContem,
      int? codProprietario,
      String? tipoEstoque,
      bool? ignorarRemovidos,
      ItemModel? item});

  $ItemModelCopyWith<$Res>? get item;
}

/// @nodoc
class _$ConsultaEstoqueDisponivelFilterCopyWithImpl<$Res,
        $Val extends ConsultaEstoqueDisponivelFilter>
    implements $ConsultaEstoqueDisponivelFilterCopyWith<$Res> {
  _$ConsultaEstoqueDisponivelFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codEstoque = freezed,
    Object? codEstoqueLocal = freezed,
    Object? codKit = freezed,
    Object? codBarraKitContem = freezed,
    Object? codItem = freezed,
    Object? idEtiquetaContem = freezed,
    Object? codProprietario = freezed,
    Object? tipoEstoque = freezed,
    Object? ignorarRemovidos = freezed,
    Object? item = freezed,
  }) {
    return _then(_value.copyWith(
      codEstoque: freezed == codEstoque
          ? _value.codEstoque
          : codEstoque // ignore: cast_nullable_to_non_nullable
              as int?,
      codEstoqueLocal: freezed == codEstoqueLocal
          ? _value.codEstoqueLocal
          : codEstoqueLocal // ignore: cast_nullable_to_non_nullable
              as int?,
      codKit: freezed == codKit
          ? _value.codKit
          : codKit // ignore: cast_nullable_to_non_nullable
              as int?,
      codBarraKitContem: freezed == codBarraKitContem
          ? _value.codBarraKitContem
          : codBarraKitContem // ignore: cast_nullable_to_non_nullable
              as String?,
      codItem: freezed == codItem
          ? _value.codItem
          : codItem // ignore: cast_nullable_to_non_nullable
              as int?,
      idEtiquetaContem: freezed == idEtiquetaContem
          ? _value.idEtiquetaContem
          : idEtiquetaContem // ignore: cast_nullable_to_non_nullable
              as String?,
      codProprietario: freezed == codProprietario
          ? _value.codProprietario
          : codProprietario // ignore: cast_nullable_to_non_nullable
              as int?,
      tipoEstoque: freezed == tipoEstoque
          ? _value.tipoEstoque
          : tipoEstoque // ignore: cast_nullable_to_non_nullable
              as String?,
      ignorarRemovidos: freezed == ignorarRemovidos
          ? _value.ignorarRemovidos
          : ignorarRemovidos // ignore: cast_nullable_to_non_nullable
              as bool?,
      item: freezed == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as ItemModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ItemModelCopyWith<$Res>? get item {
    if (_value.item == null) {
      return null;
    }

    return $ItemModelCopyWith<$Res>(_value.item!, (value) {
      return _then(_value.copyWith(item: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ConsultaEstoqueDisponivelFilterImplCopyWith<$Res>
    implements $ConsultaEstoqueDisponivelFilterCopyWith<$Res> {
  factory _$$ConsultaEstoqueDisponivelFilterImplCopyWith(
          _$ConsultaEstoqueDisponivelFilterImpl value,
          $Res Function(_$ConsultaEstoqueDisponivelFilterImpl) then) =
      __$$ConsultaEstoqueDisponivelFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? codEstoque,
      int? codEstoqueLocal,
      int? codKit,
      String? codBarraKitContem,
      int? codItem,
      String? idEtiquetaContem,
      int? codProprietario,
      String? tipoEstoque,
      bool? ignorarRemovidos,
      ItemModel? item});

  @override
  $ItemModelCopyWith<$Res>? get item;
}

/// @nodoc
class __$$ConsultaEstoqueDisponivelFilterImplCopyWithImpl<$Res>
    extends _$ConsultaEstoqueDisponivelFilterCopyWithImpl<$Res,
        _$ConsultaEstoqueDisponivelFilterImpl>
    implements _$$ConsultaEstoqueDisponivelFilterImplCopyWith<$Res> {
  __$$ConsultaEstoqueDisponivelFilterImplCopyWithImpl(
      _$ConsultaEstoqueDisponivelFilterImpl _value,
      $Res Function(_$ConsultaEstoqueDisponivelFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codEstoque = freezed,
    Object? codEstoqueLocal = freezed,
    Object? codKit = freezed,
    Object? codBarraKitContem = freezed,
    Object? codItem = freezed,
    Object? idEtiquetaContem = freezed,
    Object? codProprietario = freezed,
    Object? tipoEstoque = freezed,
    Object? ignorarRemovidos = freezed,
    Object? item = freezed,
  }) {
    return _then(_$ConsultaEstoqueDisponivelFilterImpl(
      codEstoque: freezed == codEstoque
          ? _value.codEstoque
          : codEstoque // ignore: cast_nullable_to_non_nullable
              as int?,
      codEstoqueLocal: freezed == codEstoqueLocal
          ? _value.codEstoqueLocal
          : codEstoqueLocal // ignore: cast_nullable_to_non_nullable
              as int?,
      codKit: freezed == codKit
          ? _value.codKit
          : codKit // ignore: cast_nullable_to_non_nullable
              as int?,
      codBarraKitContem: freezed == codBarraKitContem
          ? _value.codBarraKitContem
          : codBarraKitContem // ignore: cast_nullable_to_non_nullable
              as String?,
      codItem: freezed == codItem
          ? _value.codItem
          : codItem // ignore: cast_nullable_to_non_nullable
              as int?,
      idEtiquetaContem: freezed == idEtiquetaContem
          ? _value.idEtiquetaContem
          : idEtiquetaContem // ignore: cast_nullable_to_non_nullable
              as String?,
      codProprietario: freezed == codProprietario
          ? _value.codProprietario
          : codProprietario // ignore: cast_nullable_to_non_nullable
              as int?,
      tipoEstoque: freezed == tipoEstoque
          ? _value.tipoEstoque
          : tipoEstoque // ignore: cast_nullable_to_non_nullable
              as String?,
      ignorarRemovidos: freezed == ignorarRemovidos
          ? _value.ignorarRemovidos
          : ignorarRemovidos // ignore: cast_nullable_to_non_nullable
              as bool?,
      item: freezed == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as ItemModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsultaEstoqueDisponivelFilterImpl
    extends _ConsultaEstoqueDisponivelFilter {
  _$ConsultaEstoqueDisponivelFilterImpl(
      {required this.codEstoque,
      required this.codEstoqueLocal,
      required this.codKit,
      required this.codBarraKitContem,
      required this.codItem,
      required this.idEtiquetaContem,
      required this.codProprietario,
      this.tipoEstoque,
      this.ignorarRemovidos,
      this.item})
      : super._();

  factory _$ConsultaEstoqueDisponivelFilterImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ConsultaEstoqueDisponivelFilterImplFromJson(json);

  @override
  int? codEstoque;
  @override
  int? codEstoqueLocal;
  @override
  int? codKit;
  @override
  String? codBarraKitContem;
  @override
  int? codItem;
  @override
  String? idEtiquetaContem;
  @override
  int? codProprietario;
  @override
  String? tipoEstoque;
  @override
  bool? ignorarRemovidos;
  @override
  ItemModel? item;

  @override
  String toString() {
    return 'ConsultaEstoqueDisponivelFilter(codEstoque: $codEstoque, codEstoqueLocal: $codEstoqueLocal, codKit: $codKit, codBarraKitContem: $codBarraKitContem, codItem: $codItem, idEtiquetaContem: $idEtiquetaContem, codProprietario: $codProprietario, tipoEstoque: $tipoEstoque, ignorarRemovidos: $ignorarRemovidos, item: $item)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsultaEstoqueDisponivelFilterImplCopyWith<
          _$ConsultaEstoqueDisponivelFilterImpl>
      get copyWith => __$$ConsultaEstoqueDisponivelFilterImplCopyWithImpl<
          _$ConsultaEstoqueDisponivelFilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsultaEstoqueDisponivelFilterImplToJson(
      this,
    );
  }
}

abstract class _ConsultaEstoqueDisponivelFilter
    extends ConsultaEstoqueDisponivelFilter {
  factory _ConsultaEstoqueDisponivelFilter(
      {required int? codEstoque,
      required int? codEstoqueLocal,
      required int? codKit,
      required String? codBarraKitContem,
      required int? codItem,
      required String? idEtiquetaContem,
      required int? codProprietario,
      String? tipoEstoque,
      bool? ignorarRemovidos,
      ItemModel? item}) = _$ConsultaEstoqueDisponivelFilterImpl;
  _ConsultaEstoqueDisponivelFilter._() : super._();

  factory _ConsultaEstoqueDisponivelFilter.fromJson(Map<String, dynamic> json) =
      _$ConsultaEstoqueDisponivelFilterImpl.fromJson;

  @override
  int? get codEstoque;
  set codEstoque(int? value);
  @override
  int? get codEstoqueLocal;
  set codEstoqueLocal(int? value);
  @override
  int? get codKit;
  set codKit(int? value);
  @override
  String? get codBarraKitContem;
  set codBarraKitContem(String? value);
  @override
  int? get codItem;
  set codItem(int? value);
  @override
  String? get idEtiquetaContem;
  set idEtiquetaContem(String? value);
  @override
  int? get codProprietario;
  set codProprietario(int? value);
  @override
  String? get tipoEstoque;
  set tipoEstoque(String? value);
  @override
  bool? get ignorarRemovidos;
  set ignorarRemovidos(bool? value);
  @override
  ItemModel? get item;
  set item(ItemModel? value);
  @override
  @JsonKey(ignore: true)
  _$$ConsultaEstoqueDisponivelFilterImplCopyWith<
          _$ConsultaEstoqueDisponivelFilterImpl>
      get copyWith => throw _privateConstructorUsedError;
}
