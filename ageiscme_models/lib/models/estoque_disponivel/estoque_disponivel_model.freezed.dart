// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'estoque_disponivel_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EstoqueDisponivelModel _$EstoqueDisponivelModelFromJson(
    Map<String, dynamic> json) {
  return _EstoqueDisponivelModel.fromJson(json);
}

/// @nodoc
mixin _$EstoqueDisponivelModel {
  int? get cod => throw _privateConstructorUsedError;
  set cod(int? value) => throw _privateConstructorUsedError;
  int? get codEstoque => throw _privateConstructorUsedError;
  set codEstoque(int? value) => throw _privateConstructorUsedError;
  int? get codLocalEstoque => throw _privateConstructorUsedError;
  set codLocalEstoque(int? value) => throw _privateConstructorUsedError;
  int? get codKit => throw _privateConstructorUsedError;
  set codKit(int? value) => throw _privateConstructorUsedError;
  int? get codItem => throw _privateConstructorUsedError;
  set codItem(int? value) => throw _privateConstructorUsedError;
  bool? get removido => throw _privateConstructorUsedError;
  set removido(bool? value) => throw _privateConstructorUsedError;
  DateTime? get dataEntrada => throw _privateConstructorUsedError;
  set dataEntrada(DateTime? value) => throw _privateConstructorUsedError;
  DateTime? get dataValidade => throw _privateConstructorUsedError;
  set dataValidade(DateTime? value) => throw _privateConstructorUsedError;
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
  KitModel? get kit => throw _privateConstructorUsedError;
  set kit(KitModel? value) => throw _privateConstructorUsedError;
  LocalizacaoArsenalModel? get localizacaoArsenal =>
      throw _privateConstructorUsedError;
  set localizacaoArsenal(LocalizacaoArsenalModel? value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EstoqueDisponivelModelCopyWith<EstoqueDisponivelModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EstoqueDisponivelModelCopyWith<$Res> {
  factory $EstoqueDisponivelModelCopyWith(EstoqueDisponivelModel value,
          $Res Function(EstoqueDisponivelModel) then) =
      _$EstoqueDisponivelModelCopyWithImpl<$Res, EstoqueDisponivelModel>;
  @useResult
  $Res call(
      {int? cod,
      int? codEstoque,
      int? codLocalEstoque,
      int? codKit,
      int? codItem,
      bool? removido,
      DateTime? dataEntrada,
      DateTime? dataValidade,
      int? codInstituicao,
      DateTime? ultimaAlteracao,
      @JsonKey(name: 'tStamp') String? tstamp,
      ArsenalEstoqueModel? arsenalEstoque,
      ItemModel? item,
      KitModel? kit,
      LocalizacaoArsenalModel? localizacaoArsenal});

  $ArsenalEstoqueModelCopyWith<$Res>? get arsenalEstoque;
  $ItemModelCopyWith<$Res>? get item;
  $KitModelCopyWith<$Res>? get kit;
  $LocalizacaoArsenalModelCopyWith<$Res>? get localizacaoArsenal;
}

/// @nodoc
class _$EstoqueDisponivelModelCopyWithImpl<$Res,
        $Val extends EstoqueDisponivelModel>
    implements $EstoqueDisponivelModelCopyWith<$Res> {
  _$EstoqueDisponivelModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? codEstoque = freezed,
    Object? codLocalEstoque = freezed,
    Object? codKit = freezed,
    Object? codItem = freezed,
    Object? removido = freezed,
    Object? dataEntrada = freezed,
    Object? dataValidade = freezed,
    Object? codInstituicao = freezed,
    Object? ultimaAlteracao = freezed,
    Object? tstamp = freezed,
    Object? arsenalEstoque = freezed,
    Object? item = freezed,
    Object? kit = freezed,
    Object? localizacaoArsenal = freezed,
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
      codLocalEstoque: freezed == codLocalEstoque
          ? _value.codLocalEstoque
          : codLocalEstoque // ignore: cast_nullable_to_non_nullable
              as int?,
      codKit: freezed == codKit
          ? _value.codKit
          : codKit // ignore: cast_nullable_to_non_nullable
              as int?,
      codItem: freezed == codItem
          ? _value.codItem
          : codItem // ignore: cast_nullable_to_non_nullable
              as int?,
      removido: freezed == removido
          ? _value.removido
          : removido // ignore: cast_nullable_to_non_nullable
              as bool?,
      dataEntrada: freezed == dataEntrada
          ? _value.dataEntrada
          : dataEntrada // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dataValidade: freezed == dataValidade
          ? _value.dataValidade
          : dataValidade // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
      kit: freezed == kit
          ? _value.kit
          : kit // ignore: cast_nullable_to_non_nullable
              as KitModel?,
      localizacaoArsenal: freezed == localizacaoArsenal
          ? _value.localizacaoArsenal
          : localizacaoArsenal // ignore: cast_nullable_to_non_nullable
              as LocalizacaoArsenalModel?,
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

  @override
  @pragma('vm:prefer-inline')
  $KitModelCopyWith<$Res>? get kit {
    if (_value.kit == null) {
      return null;
    }

    return $KitModelCopyWith<$Res>(_value.kit!, (value) {
      return _then(_value.copyWith(kit: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LocalizacaoArsenalModelCopyWith<$Res>? get localizacaoArsenal {
    if (_value.localizacaoArsenal == null) {
      return null;
    }

    return $LocalizacaoArsenalModelCopyWith<$Res>(_value.localizacaoArsenal!,
        (value) {
      return _then(_value.copyWith(localizacaoArsenal: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EstoqueDisponivelModelImplCopyWith<$Res>
    implements $EstoqueDisponivelModelCopyWith<$Res> {
  factory _$$EstoqueDisponivelModelImplCopyWith(
          _$EstoqueDisponivelModelImpl value,
          $Res Function(_$EstoqueDisponivelModelImpl) then) =
      __$$EstoqueDisponivelModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? cod,
      int? codEstoque,
      int? codLocalEstoque,
      int? codKit,
      int? codItem,
      bool? removido,
      DateTime? dataEntrada,
      DateTime? dataValidade,
      int? codInstituicao,
      DateTime? ultimaAlteracao,
      @JsonKey(name: 'tStamp') String? tstamp,
      ArsenalEstoqueModel? arsenalEstoque,
      ItemModel? item,
      KitModel? kit,
      LocalizacaoArsenalModel? localizacaoArsenal});

  @override
  $ArsenalEstoqueModelCopyWith<$Res>? get arsenalEstoque;
  @override
  $ItemModelCopyWith<$Res>? get item;
  @override
  $KitModelCopyWith<$Res>? get kit;
  @override
  $LocalizacaoArsenalModelCopyWith<$Res>? get localizacaoArsenal;
}

/// @nodoc
class __$$EstoqueDisponivelModelImplCopyWithImpl<$Res>
    extends _$EstoqueDisponivelModelCopyWithImpl<$Res,
        _$EstoqueDisponivelModelImpl>
    implements _$$EstoqueDisponivelModelImplCopyWith<$Res> {
  __$$EstoqueDisponivelModelImplCopyWithImpl(
      _$EstoqueDisponivelModelImpl _value,
      $Res Function(_$EstoqueDisponivelModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? codEstoque = freezed,
    Object? codLocalEstoque = freezed,
    Object? codKit = freezed,
    Object? codItem = freezed,
    Object? removido = freezed,
    Object? dataEntrada = freezed,
    Object? dataValidade = freezed,
    Object? codInstituicao = freezed,
    Object? ultimaAlteracao = freezed,
    Object? tstamp = freezed,
    Object? arsenalEstoque = freezed,
    Object? item = freezed,
    Object? kit = freezed,
    Object? localizacaoArsenal = freezed,
  }) {
    return _then(_$EstoqueDisponivelModelImpl(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      codEstoque: freezed == codEstoque
          ? _value.codEstoque
          : codEstoque // ignore: cast_nullable_to_non_nullable
              as int?,
      codLocalEstoque: freezed == codLocalEstoque
          ? _value.codLocalEstoque
          : codLocalEstoque // ignore: cast_nullable_to_non_nullable
              as int?,
      codKit: freezed == codKit
          ? _value.codKit
          : codKit // ignore: cast_nullable_to_non_nullable
              as int?,
      codItem: freezed == codItem
          ? _value.codItem
          : codItem // ignore: cast_nullable_to_non_nullable
              as int?,
      removido: freezed == removido
          ? _value.removido
          : removido // ignore: cast_nullable_to_non_nullable
              as bool?,
      dataEntrada: freezed == dataEntrada
          ? _value.dataEntrada
          : dataEntrada // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dataValidade: freezed == dataValidade
          ? _value.dataValidade
          : dataValidade // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
      kit: freezed == kit
          ? _value.kit
          : kit // ignore: cast_nullable_to_non_nullable
              as KitModel?,
      localizacaoArsenal: freezed == localizacaoArsenal
          ? _value.localizacaoArsenal
          : localizacaoArsenal // ignore: cast_nullable_to_non_nullable
              as LocalizacaoArsenalModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EstoqueDisponivelModelImpl extends _EstoqueDisponivelModel {
  _$EstoqueDisponivelModelImpl(
      {required this.cod,
      required this.codEstoque,
      required this.codLocalEstoque,
      required this.codKit,
      required this.codItem,
      required this.removido,
      required this.dataEntrada,
      required this.dataValidade,
      required this.codInstituicao,
      required this.ultimaAlteracao,
      @JsonKey(name: 'tStamp') required this.tstamp,
      required this.arsenalEstoque,
      required this.item,
      required this.kit,
      required this.localizacaoArsenal})
      : super._();

  factory _$EstoqueDisponivelModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EstoqueDisponivelModelImplFromJson(json);

  @override
  int? cod;
  @override
  int? codEstoque;
  @override
  int? codLocalEstoque;
  @override
  int? codKit;
  @override
  int? codItem;
  @override
  bool? removido;
  @override
  DateTime? dataEntrada;
  @override
  DateTime? dataValidade;
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
  KitModel? kit;
  @override
  LocalizacaoArsenalModel? localizacaoArsenal;

  @override
  String toString() {
    return 'EstoqueDisponivelModel(cod: $cod, codEstoque: $codEstoque, codLocalEstoque: $codLocalEstoque, codKit: $codKit, codItem: $codItem, removido: $removido, dataEntrada: $dataEntrada, dataValidade: $dataValidade, codInstituicao: $codInstituicao, ultimaAlteracao: $ultimaAlteracao, tstamp: $tstamp, arsenalEstoque: $arsenalEstoque, item: $item, kit: $kit, localizacaoArsenal: $localizacaoArsenal)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EstoqueDisponivelModelImplCopyWith<_$EstoqueDisponivelModelImpl>
      get copyWith => __$$EstoqueDisponivelModelImplCopyWithImpl<
          _$EstoqueDisponivelModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EstoqueDisponivelModelImplToJson(
      this,
    );
  }
}

abstract class _EstoqueDisponivelModel extends EstoqueDisponivelModel {
  factory _EstoqueDisponivelModel(
          {required int? cod,
          required int? codEstoque,
          required int? codLocalEstoque,
          required int? codKit,
          required int? codItem,
          required bool? removido,
          required DateTime? dataEntrada,
          required DateTime? dataValidade,
          required int? codInstituicao,
          required DateTime? ultimaAlteracao,
          @JsonKey(name: 'tStamp') required String? tstamp,
          required ArsenalEstoqueModel? arsenalEstoque,
          required ItemModel? item,
          required KitModel? kit,
          required LocalizacaoArsenalModel? localizacaoArsenal}) =
      _$EstoqueDisponivelModelImpl;
  _EstoqueDisponivelModel._() : super._();

  factory _EstoqueDisponivelModel.fromJson(Map<String, dynamic> json) =
      _$EstoqueDisponivelModelImpl.fromJson;

  @override
  int? get cod;
  set cod(int? value);
  @override
  int? get codEstoque;
  set codEstoque(int? value);
  @override
  int? get codLocalEstoque;
  set codLocalEstoque(int? value);
  @override
  int? get codKit;
  set codKit(int? value);
  @override
  int? get codItem;
  set codItem(int? value);
  @override
  bool? get removido;
  set removido(bool? value);
  @override
  DateTime? get dataEntrada;
  set dataEntrada(DateTime? value);
  @override
  DateTime? get dataValidade;
  set dataValidade(DateTime? value);
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
  KitModel? get kit;
  set kit(KitModel? value);
  @override
  LocalizacaoArsenalModel? get localizacaoArsenal;
  set localizacaoArsenal(LocalizacaoArsenalModel? value);
  @override
  @JsonKey(ignore: true)
  _$$EstoqueDisponivelModelImplCopyWith<_$EstoqueDisponivelModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
