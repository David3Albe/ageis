// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'estoque_disponivel_rotulado_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EstoqueDisponivelRotuladoModel _$EstoqueDisponivelRotuladoModelFromJson(
    Map<String, dynamic> json) {
  return _EstoqueDisponivelRotuladoModel.fromJson(json);
}

/// @nodoc
mixin _$EstoqueDisponivelRotuladoModel {
  int? get cod => throw _privateConstructorUsedError;
  set cod(int? value) => throw _privateConstructorUsedError;
  int? get codEstoque => throw _privateConstructorUsedError;
  set codEstoque(int? value) => throw _privateConstructorUsedError;
  int? get codItem => throw _privateConstructorUsedError;
  set codItem(int? value) => throw _privateConstructorUsedError;
  int get quantidade => throw _privateConstructorUsedError;
  set quantidade(int value) => throw _privateConstructorUsedError;
  int? get codInstituicao => throw _privateConstructorUsedError;
  set codInstituicao(int? value) => throw _privateConstructorUsedError;
  DateTime? get ultimaAlteracao => throw _privateConstructorUsedError;
  set ultimaAlteracao(DateTime? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  String? get tstamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  set tstamp(String? value) => throw _privateConstructorUsedError;
  ArsenalEstoqueModel? get arsenalEstoque => throw _privateConstructorUsedError;
  set arsenalEstoque(ArsenalEstoqueModel? value) =>
      throw _privateConstructorUsedError;
  ItemModel? get item => throw _privateConstructorUsedError;
  set item(ItemModel? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EstoqueDisponivelRotuladoModelCopyWith<EstoqueDisponivelRotuladoModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EstoqueDisponivelRotuladoModelCopyWith<$Res> {
  factory $EstoqueDisponivelRotuladoModelCopyWith(
          EstoqueDisponivelRotuladoModel value,
          $Res Function(EstoqueDisponivelRotuladoModel) then) =
      _$EstoqueDisponivelRotuladoModelCopyWithImpl<$Res,
          EstoqueDisponivelRotuladoModel>;
  @useResult
  $Res call(
      {int? cod,
      int? codEstoque,
      int? codItem,
      int quantidade,
      int? codInstituicao,
      DateTime? ultimaAlteracao,
      @JsonKey(name: 'tStamp') String? tstamp,
      ArsenalEstoqueModel? arsenalEstoque,
      ItemModel? item});

  $ArsenalEstoqueModelCopyWith<$Res>? get arsenalEstoque;
  $ItemModelCopyWith<$Res>? get item;
}

/// @nodoc
class _$EstoqueDisponivelRotuladoModelCopyWithImpl<$Res,
        $Val extends EstoqueDisponivelRotuladoModel>
    implements $EstoqueDisponivelRotuladoModelCopyWith<$Res> {
  _$EstoqueDisponivelRotuladoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? codEstoque = freezed,
    Object? codItem = freezed,
    Object? quantidade = null,
    Object? codInstituicao = freezed,
    Object? ultimaAlteracao = freezed,
    Object? tstamp = freezed,
    Object? arsenalEstoque = freezed,
    Object? item = freezed,
  }) {
    return _then(_value.copyWith(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      codEstoque: freezed == codEstoque
          ? _value.codEstoque
          : codEstoque // ignore: cast_nullable_to_non_nullable
              as int?,
      codItem: freezed == codItem
          ? _value.codItem
          : codItem // ignore: cast_nullable_to_non_nullable
              as int?,
      quantidade: null == quantidade
          ? _value.quantidade
          : quantidade // ignore: cast_nullable_to_non_nullable
              as int,
      codInstituicao: freezed == codInstituicao
          ? _value.codInstituicao
          : codInstituicao // ignore: cast_nullable_to_non_nullable
              as int?,
      ultimaAlteracao: freezed == ultimaAlteracao
          ? _value.ultimaAlteracao
          : ultimaAlteracao // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tstamp: freezed == tstamp
          ? _value.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as String?,
      arsenalEstoque: freezed == arsenalEstoque
          ? _value.arsenalEstoque
          : arsenalEstoque // ignore: cast_nullable_to_non_nullable
              as ArsenalEstoqueModel?,
      item: freezed == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as ItemModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ArsenalEstoqueModelCopyWith<$Res>? get arsenalEstoque {
    if (_value.arsenalEstoque == null) {
      return null;
    }

    return $ArsenalEstoqueModelCopyWith<$Res>(_value.arsenalEstoque!, (value) {
      return _then(_value.copyWith(arsenalEstoque: value) as $Val);
    });
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
abstract class _$$EstoqueDisponivelRotuladoModelImplCopyWith<$Res>
    implements $EstoqueDisponivelRotuladoModelCopyWith<$Res> {
  factory _$$EstoqueDisponivelRotuladoModelImplCopyWith(
          _$EstoqueDisponivelRotuladoModelImpl value,
          $Res Function(_$EstoqueDisponivelRotuladoModelImpl) then) =
      __$$EstoqueDisponivelRotuladoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? cod,
      int? codEstoque,
      int? codItem,
      int quantidade,
      int? codInstituicao,
      DateTime? ultimaAlteracao,
      @JsonKey(name: 'tStamp') String? tstamp,
      ArsenalEstoqueModel? arsenalEstoque,
      ItemModel? item});

  @override
  $ArsenalEstoqueModelCopyWith<$Res>? get arsenalEstoque;
  @override
  $ItemModelCopyWith<$Res>? get item;
}

/// @nodoc
class __$$EstoqueDisponivelRotuladoModelImplCopyWithImpl<$Res>
    extends _$EstoqueDisponivelRotuladoModelCopyWithImpl<$Res,
        _$EstoqueDisponivelRotuladoModelImpl>
    implements _$$EstoqueDisponivelRotuladoModelImplCopyWith<$Res> {
  __$$EstoqueDisponivelRotuladoModelImplCopyWithImpl(
      _$EstoqueDisponivelRotuladoModelImpl _value,
      $Res Function(_$EstoqueDisponivelRotuladoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? codEstoque = freezed,
    Object? codItem = freezed,
    Object? quantidade = null,
    Object? codInstituicao = freezed,
    Object? ultimaAlteracao = freezed,
    Object? tstamp = freezed,
    Object? arsenalEstoque = freezed,
    Object? item = freezed,
  }) {
    return _then(_$EstoqueDisponivelRotuladoModelImpl(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      codEstoque: freezed == codEstoque
          ? _value.codEstoque
          : codEstoque // ignore: cast_nullable_to_non_nullable
              as int?,
      codItem: freezed == codItem
          ? _value.codItem
          : codItem // ignore: cast_nullable_to_non_nullable
              as int?,
      quantidade: null == quantidade
          ? _value.quantidade
          : quantidade // ignore: cast_nullable_to_non_nullable
              as int,
      codInstituicao: freezed == codInstituicao
          ? _value.codInstituicao
          : codInstituicao // ignore: cast_nullable_to_non_nullable
              as int?,
      ultimaAlteracao: freezed == ultimaAlteracao
          ? _value.ultimaAlteracao
          : ultimaAlteracao // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      tstamp: freezed == tstamp
          ? _value.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as String?,
      arsenalEstoque: freezed == arsenalEstoque
          ? _value.arsenalEstoque
          : arsenalEstoque // ignore: cast_nullable_to_non_nullable
              as ArsenalEstoqueModel?,
      item: freezed == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as ItemModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EstoqueDisponivelRotuladoModelImpl
    extends _EstoqueDisponivelRotuladoModel {
  _$EstoqueDisponivelRotuladoModelImpl(
      {required this.cod,
      required this.codEstoque,
      required this.codItem,
      required this.quantidade,
      required this.codInstituicao,
      required this.ultimaAlteracao,
      @JsonKey(name: 'tStamp') required this.tstamp,
      required this.arsenalEstoque,
      required this.item})
      : super._();

  factory _$EstoqueDisponivelRotuladoModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$EstoqueDisponivelRotuladoModelImplFromJson(json);

  @override
  int? cod;
  @override
  int? codEstoque;
  @override
  int? codItem;
  @override
  int quantidade;
  @override
  int? codInstituicao;
  @override
  DateTime? ultimaAlteracao;
  @override
  @JsonKey(name: 'tStamp')
  String? tstamp;
  @override
  ArsenalEstoqueModel? arsenalEstoque;
  @override
  ItemModel? item;

  @override
  String toString() {
    return 'EstoqueDisponivelRotuladoModel(cod: $cod, codEstoque: $codEstoque, codItem: $codItem, quantidade: $quantidade, codInstituicao: $codInstituicao, ultimaAlteracao: $ultimaAlteracao, tstamp: $tstamp, arsenalEstoque: $arsenalEstoque, item: $item)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EstoqueDisponivelRotuladoModelImplCopyWith<
          _$EstoqueDisponivelRotuladoModelImpl>
      get copyWith => __$$EstoqueDisponivelRotuladoModelImplCopyWithImpl<
          _$EstoqueDisponivelRotuladoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EstoqueDisponivelRotuladoModelImplToJson(
      this,
    );
  }
}

abstract class _EstoqueDisponivelRotuladoModel
    extends EstoqueDisponivelRotuladoModel {
  factory _EstoqueDisponivelRotuladoModel(
      {required int? cod,
      required int? codEstoque,
      required int? codItem,
      required int quantidade,
      required int? codInstituicao,
      required DateTime? ultimaAlteracao,
      @JsonKey(name: 'tStamp') required String? tstamp,
      required ArsenalEstoqueModel? arsenalEstoque,
      required ItemModel? item}) = _$EstoqueDisponivelRotuladoModelImpl;
  _EstoqueDisponivelRotuladoModel._() : super._();

  factory _EstoqueDisponivelRotuladoModel.fromJson(Map<String, dynamic> json) =
      _$EstoqueDisponivelRotuladoModelImpl.fromJson;

  @override
  int? get cod;
  set cod(int? value);
  @override
  int? get codEstoque;
  set codEstoque(int? value);
  @override
  int? get codItem;
  set codItem(int? value);
  @override
  int get quantidade;
  set quantidade(int value);
  @override
  int? get codInstituicao;
  set codInstituicao(int? value);
  @override
  DateTime? get ultimaAlteracao;
  set ultimaAlteracao(DateTime? value);
  @override
  @JsonKey(name: 'tStamp')
  String? get tstamp;
  @JsonKey(name: 'tStamp')
  set tstamp(String? value);
  @override
  ArsenalEstoqueModel? get arsenalEstoque;
  set arsenalEstoque(ArsenalEstoqueModel? value);
  @override
  ItemModel? get item;
  set item(ItemModel? value);
  @override
  @JsonKey(ignore: true)
  _$$EstoqueDisponivelRotuladoModelImplCopyWith<
          _$EstoqueDisponivelRotuladoModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
