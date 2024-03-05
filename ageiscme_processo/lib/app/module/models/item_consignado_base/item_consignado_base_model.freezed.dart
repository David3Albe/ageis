// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_consignado_base_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ItemConsignadoBaseModel _$ItemConsignadoBaseModelFromJson(
    Map<String, dynamic> json) {
  return _ItemConsignadoBaseModel.fromJson(json);
}

/// @nodoc
mixin _$ItemConsignadoBaseModel {
  int get tipoAcesso => throw _privateConstructorUsedError;
  set tipoAcesso(int value) => throw _privateConstructorUsedError;
  bool get preparo => throw _privateConstructorUsedError;
  set preparo(bool value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemConsignadoBaseModelCopyWith<ItemConsignadoBaseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemConsignadoBaseModelCopyWith<$Res> {
  factory $ItemConsignadoBaseModelCopyWith(ItemConsignadoBaseModel value,
          $Res Function(ItemConsignadoBaseModel) then) =
      _$ItemConsignadoBaseModelCopyWithImpl<$Res, ItemConsignadoBaseModel>;
  @useResult
  $Res call({int tipoAcesso, bool preparo});
}

/// @nodoc
class _$ItemConsignadoBaseModelCopyWithImpl<$Res,
        $Val extends ItemConsignadoBaseModel>
    implements $ItemConsignadoBaseModelCopyWith<$Res> {
  _$ItemConsignadoBaseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tipoAcesso = null,
    Object? preparo = null,
  }) {
    return _then(_value.copyWith(
      tipoAcesso: null == tipoAcesso
          ? _value.tipoAcesso
          : tipoAcesso // ignore: cast_nullable_to_non_nullable
              as int,
      preparo: null == preparo
          ? _value.preparo
          : preparo // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemConsignadoBaseModelImplCopyWith<$Res>
    implements $ItemConsignadoBaseModelCopyWith<$Res> {
  factory _$$ItemConsignadoBaseModelImplCopyWith(
          _$ItemConsignadoBaseModelImpl value,
          $Res Function(_$ItemConsignadoBaseModelImpl) then) =
      __$$ItemConsignadoBaseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int tipoAcesso, bool preparo});
}

/// @nodoc
class __$$ItemConsignadoBaseModelImplCopyWithImpl<$Res>
    extends _$ItemConsignadoBaseModelCopyWithImpl<$Res,
        _$ItemConsignadoBaseModelImpl>
    implements _$$ItemConsignadoBaseModelImplCopyWith<$Res> {
  __$$ItemConsignadoBaseModelImplCopyWithImpl(
      _$ItemConsignadoBaseModelImpl _value,
      $Res Function(_$ItemConsignadoBaseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tipoAcesso = null,
    Object? preparo = null,
  }) {
    return _then(_$ItemConsignadoBaseModelImpl(
      tipoAcesso: null == tipoAcesso
          ? _value.tipoAcesso
          : tipoAcesso // ignore: cast_nullable_to_non_nullable
              as int,
      preparo: null == preparo
          ? _value.preparo
          : preparo // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemConsignadoBaseModelImpl extends _ItemConsignadoBaseModel
    with DiagnosticableTreeMixin {
  _$ItemConsignadoBaseModelImpl(
      {required this.tipoAcesso, this.preparo = false})
      : super._();

  factory _$ItemConsignadoBaseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemConsignadoBaseModelImplFromJson(json);

  @override
  int tipoAcesso;
  @override
  @JsonKey()
  bool preparo;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ItemConsignadoBaseModel(tipoAcesso: $tipoAcesso, preparo: $preparo)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ItemConsignadoBaseModel'))
      ..add(DiagnosticsProperty('tipoAcesso', tipoAcesso))
      ..add(DiagnosticsProperty('preparo', preparo));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemConsignadoBaseModelImplCopyWith<_$ItemConsignadoBaseModelImpl>
      get copyWith => __$$ItemConsignadoBaseModelImplCopyWithImpl<
          _$ItemConsignadoBaseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemConsignadoBaseModelImplToJson(
      this,
    );
  }
}

abstract class _ItemConsignadoBaseModel extends ItemConsignadoBaseModel {
  factory _ItemConsignadoBaseModel({required int tipoAcesso, bool preparo}) =
      _$ItemConsignadoBaseModelImpl;
  _ItemConsignadoBaseModel._() : super._();

  factory _ItemConsignadoBaseModel.fromJson(Map<String, dynamic> json) =
      _$ItemConsignadoBaseModelImpl.fromJson;

  @override
  int get tipoAcesso;
  set tipoAcesso(int value);
  @override
  bool get preparo;
  set preparo(bool value);
  @override
  @JsonKey(ignore: true)
  _$$ItemConsignadoBaseModelImplCopyWith<_$ItemConsignadoBaseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
