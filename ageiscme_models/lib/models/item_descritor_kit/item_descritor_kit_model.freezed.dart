// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_descritor_kit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ItemDescritorKitModel _$ItemDescritorKitModelFromJson(
    Map<String, dynamic> json) {
  return _ItemDescritorKitModel.fromJson(json);
}

/// @nodoc
mixin _$ItemDescritorKitModel {
  int? get cod => throw _privateConstructorUsedError;
  set cod(int? value) => throw _privateConstructorUsedError;
  int? get codDescritorKit => throw _privateConstructorUsedError;
  set codDescritorKit(int? value) => throw _privateConstructorUsedError;
  int? get codDescritorItem => throw _privateConstructorUsedError;
  set codDescritorItem(int? value) => throw _privateConstructorUsedError;
  int? get quantidade => throw _privateConstructorUsedError;
  set quantidade(int? value) => throw _privateConstructorUsedError;
  int? get codInstituicao => throw _privateConstructorUsedError;
  set codInstituicao(int? value) => throw _privateConstructorUsedError;
  DateTime? get ultimaAlteracao => throw _privateConstructorUsedError;
  set ultimaAlteracao(DateTime? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  String? get tstamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'tStamp')
  set tstamp(String? value) => throw _privateConstructorUsedError;
  KitDescritorDropDownSearchResponseDTO? get kitDescritor =>
      throw _privateConstructorUsedError;
  set kitDescritor(KitDescritorDropDownSearchResponseDTO? value) =>
      throw _privateConstructorUsedError;
  ItemDescritorDropDownSearchResponseDTO? get itemDescritor =>
      throw _privateConstructorUsedError;
  set itemDescritor(ItemDescritorDropDownSearchResponseDTO? value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemDescritorKitModelCopyWith<ItemDescritorKitModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemDescritorKitModelCopyWith<$Res> {
  factory $ItemDescritorKitModelCopyWith(ItemDescritorKitModel value,
          $Res Function(ItemDescritorKitModel) then) =
      _$ItemDescritorKitModelCopyWithImpl<$Res, ItemDescritorKitModel>;
  @useResult
  $Res call(
      {int? cod,
      int? codDescritorKit,
      int? codDescritorItem,
      int? quantidade,
      int? codInstituicao,
      DateTime? ultimaAlteracao,
      @JsonKey(name: 'tStamp') String? tstamp,
      KitDescritorDropDownSearchResponseDTO? kitDescritor,
      ItemDescritorDropDownSearchResponseDTO? itemDescritor});

  $KitDescritorDropDownSearchResponseDTOCopyWith<$Res>? get kitDescritor;
  $ItemDescritorDropDownSearchResponseDTOCopyWith<$Res>? get itemDescritor;
}

/// @nodoc
class _$ItemDescritorKitModelCopyWithImpl<$Res,
        $Val extends ItemDescritorKitModel>
    implements $ItemDescritorKitModelCopyWith<$Res> {
  _$ItemDescritorKitModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? codDescritorKit = freezed,
    Object? codDescritorItem = freezed,
    Object? quantidade = freezed,
    Object? codInstituicao = freezed,
    Object? ultimaAlteracao = freezed,
    Object? tstamp = freezed,
    Object? kitDescritor = freezed,
    Object? itemDescritor = freezed,
  }) {
    return _then(_value.copyWith(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      codDescritorKit: freezed == codDescritorKit
          ? _value.codDescritorKit
          : codDescritorKit // ignore: cast_nullable_to_non_nullable
              as int?,
      codDescritorItem: freezed == codDescritorItem
          ? _value.codDescritorItem
          : codDescritorItem // ignore: cast_nullable_to_non_nullable
              as int?,
      quantidade: freezed == quantidade
          ? _value.quantidade
          : quantidade // ignore: cast_nullable_to_non_nullable
              as int?,
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
      kitDescritor: freezed == kitDescritor
          ? _value.kitDescritor
          : kitDescritor // ignore: cast_nullable_to_non_nullable
              as KitDescritorDropDownSearchResponseDTO?,
      itemDescritor: freezed == itemDescritor
          ? _value.itemDescritor
          : itemDescritor // ignore: cast_nullable_to_non_nullable
              as ItemDescritorDropDownSearchResponseDTO?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $KitDescritorDropDownSearchResponseDTOCopyWith<$Res>? get kitDescritor {
    if (_value.kitDescritor == null) {
      return null;
    }

    return $KitDescritorDropDownSearchResponseDTOCopyWith<$Res>(
        _value.kitDescritor!, (value) {
      return _then(_value.copyWith(kitDescritor: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ItemDescritorDropDownSearchResponseDTOCopyWith<$Res>? get itemDescritor {
    if (_value.itemDescritor == null) {
      return null;
    }

    return $ItemDescritorDropDownSearchResponseDTOCopyWith<$Res>(
        _value.itemDescritor!, (value) {
      return _then(_value.copyWith(itemDescritor: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ItemDescritorKitModelImplCopyWith<$Res>
    implements $ItemDescritorKitModelCopyWith<$Res> {
  factory _$$ItemDescritorKitModelImplCopyWith(
          _$ItemDescritorKitModelImpl value,
          $Res Function(_$ItemDescritorKitModelImpl) then) =
      __$$ItemDescritorKitModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? cod,
      int? codDescritorKit,
      int? codDescritorItem,
      int? quantidade,
      int? codInstituicao,
      DateTime? ultimaAlteracao,
      @JsonKey(name: 'tStamp') String? tstamp,
      KitDescritorDropDownSearchResponseDTO? kitDescritor,
      ItemDescritorDropDownSearchResponseDTO? itemDescritor});

  @override
  $KitDescritorDropDownSearchResponseDTOCopyWith<$Res>? get kitDescritor;
  @override
  $ItemDescritorDropDownSearchResponseDTOCopyWith<$Res>? get itemDescritor;
}

/// @nodoc
class __$$ItemDescritorKitModelImplCopyWithImpl<$Res>
    extends _$ItemDescritorKitModelCopyWithImpl<$Res,
        _$ItemDescritorKitModelImpl>
    implements _$$ItemDescritorKitModelImplCopyWith<$Res> {
  __$$ItemDescritorKitModelImplCopyWithImpl(_$ItemDescritorKitModelImpl _value,
      $Res Function(_$ItemDescritorKitModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? codDescritorKit = freezed,
    Object? codDescritorItem = freezed,
    Object? quantidade = freezed,
    Object? codInstituicao = freezed,
    Object? ultimaAlteracao = freezed,
    Object? tstamp = freezed,
    Object? kitDescritor = freezed,
    Object? itemDescritor = freezed,
  }) {
    return _then(_$ItemDescritorKitModelImpl(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      codDescritorKit: freezed == codDescritorKit
          ? _value.codDescritorKit
          : codDescritorKit // ignore: cast_nullable_to_non_nullable
              as int?,
      codDescritorItem: freezed == codDescritorItem
          ? _value.codDescritorItem
          : codDescritorItem // ignore: cast_nullable_to_non_nullable
              as int?,
      quantidade: freezed == quantidade
          ? _value.quantidade
          : quantidade // ignore: cast_nullable_to_non_nullable
              as int?,
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
      kitDescritor: freezed == kitDescritor
          ? _value.kitDescritor
          : kitDescritor // ignore: cast_nullable_to_non_nullable
              as KitDescritorDropDownSearchResponseDTO?,
      itemDescritor: freezed == itemDescritor
          ? _value.itemDescritor
          : itemDescritor // ignore: cast_nullable_to_non_nullable
              as ItemDescritorDropDownSearchResponseDTO?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemDescritorKitModelImpl implements _ItemDescritorKitModel {
  _$ItemDescritorKitModelImpl(
      {required this.cod,
      required this.codDescritorKit,
      required this.codDescritorItem,
      required this.quantidade,
      required this.codInstituicao,
      required this.ultimaAlteracao,
      @JsonKey(name: 'tStamp') required this.tstamp,
      this.kitDescritor,
      this.itemDescritor});

  factory _$ItemDescritorKitModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemDescritorKitModelImplFromJson(json);

  @override
  int? cod;
  @override
  int? codDescritorKit;
  @override
  int? codDescritorItem;
  @override
  int? quantidade;
  @override
  int? codInstituicao;
  @override
  DateTime? ultimaAlteracao;
  @override
  @JsonKey(name: 'tStamp')
  String? tstamp;
  @override
  KitDescritorDropDownSearchResponseDTO? kitDescritor;
  @override
  ItemDescritorDropDownSearchResponseDTO? itemDescritor;

  @override
  String toString() {
    return 'ItemDescritorKitModel(cod: $cod, codDescritorKit: $codDescritorKit, codDescritorItem: $codDescritorItem, quantidade: $quantidade, codInstituicao: $codInstituicao, ultimaAlteracao: $ultimaAlteracao, tstamp: $tstamp, kitDescritor: $kitDescritor, itemDescritor: $itemDescritor)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemDescritorKitModelImplCopyWith<_$ItemDescritorKitModelImpl>
      get copyWith => __$$ItemDescritorKitModelImplCopyWithImpl<
          _$ItemDescritorKitModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemDescritorKitModelImplToJson(
      this,
    );
  }
}

abstract class _ItemDescritorKitModel implements ItemDescritorKitModel {
  factory _ItemDescritorKitModel(
          {required int? cod,
          required int? codDescritorKit,
          required int? codDescritorItem,
          required int? quantidade,
          required int? codInstituicao,
          required DateTime? ultimaAlteracao,
          @JsonKey(name: 'tStamp') required String? tstamp,
          KitDescritorDropDownSearchResponseDTO? kitDescritor,
          ItemDescritorDropDownSearchResponseDTO? itemDescritor}) =
      _$ItemDescritorKitModelImpl;

  factory _ItemDescritorKitModel.fromJson(Map<String, dynamic> json) =
      _$ItemDescritorKitModelImpl.fromJson;

  @override
  int? get cod;
  set cod(int? value);
  @override
  int? get codDescritorKit;
  set codDescritorKit(int? value);
  @override
  int? get codDescritorItem;
  set codDescritorItem(int? value);
  @override
  int? get quantidade;
  set quantidade(int? value);
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
  KitDescritorDropDownSearchResponseDTO? get kitDescritor;
  set kitDescritor(KitDescritorDropDownSearchResponseDTO? value);
  @override
  ItemDescritorDropDownSearchResponseDTO? get itemDescritor;
  set itemDescritor(ItemDescritorDropDownSearchResponseDTO? value);
  @override
  @JsonKey(ignore: true)
  _$$ItemDescritorKitModelImplCopyWith<_$ItemDescritorKitModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
