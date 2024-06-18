// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consulta_remover_repor_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConsultaRemoverReporItemModel _$ConsultaRemoverReporItemModelFromJson(
    Map<String, dynamic> json) {
  return _ConsultaRemoverReporItemModel.fromJson(json);
}

/// @nodoc
mixin _$ConsultaRemoverReporItemModel {
  DateTime? get dataHora => throw _privateConstructorUsedError;
  set dataHora(DateTime? value) => throw _privateConstructorUsedError;
  KitModel? get kit => throw _privateConstructorUsedError;
  set kit(KitModel? value) => throw _privateConstructorUsedError;
  ItemModel? get item => throw _privateConstructorUsedError;
  set item(ItemModel? value) => throw _privateConstructorUsedError;
  UsuarioModel? get usuario => throw _privateConstructorUsedError;
  set usuario(UsuarioModel? value) => throw _privateConstructorUsedError;
  UsuarioModel? get autorizadoPor => throw _privateConstructorUsedError;
  set autorizadoPor(UsuarioModel? value) => throw _privateConstructorUsedError;
  MotivoRemoverReporItemModel get motivoReporRemoverItem =>
      throw _privateConstructorUsedError;
  set motivoReporRemoverItem(MotivoRemoverReporItemModel value) =>
      throw _privateConstructorUsedError;
  String? get tipo => throw _privateConstructorUsedError;
  set tipo(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConsultaRemoverReporItemModelCopyWith<ConsultaRemoverReporItemModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultaRemoverReporItemModelCopyWith<$Res> {
  factory $ConsultaRemoverReporItemModelCopyWith(
          ConsultaRemoverReporItemModel value,
          $Res Function(ConsultaRemoverReporItemModel) then) =
      _$ConsultaRemoverReporItemModelCopyWithImpl<$Res,
          ConsultaRemoverReporItemModel>;
  @useResult
  $Res call(
      {DateTime? dataHora,
      KitModel? kit,
      ItemModel? item,
      UsuarioModel? usuario,
      UsuarioModel? autorizadoPor,
      MotivoRemoverReporItemModel motivoReporRemoverItem,
      String? tipo});

  $KitModelCopyWith<$Res>? get kit;
  $ItemModelCopyWith<$Res>? get item;
  $UsuarioModelCopyWith<$Res>? get usuario;
  $UsuarioModelCopyWith<$Res>? get autorizadoPor;
  $MotivoRemoverReporItemModelCopyWith<$Res> get motivoReporRemoverItem;
}

/// @nodoc
class _$ConsultaRemoverReporItemModelCopyWithImpl<$Res,
        $Val extends ConsultaRemoverReporItemModel>
    implements $ConsultaRemoverReporItemModelCopyWith<$Res> {
  _$ConsultaRemoverReporItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dataHora = freezed,
    Object? kit = freezed,
    Object? item = freezed,
    Object? usuario = freezed,
    Object? autorizadoPor = freezed,
    Object? motivoReporRemoverItem = null,
    Object? tipo = freezed,
  }) {
    return _then(_value.copyWith(
      dataHora: freezed == dataHora
          ? _value.dataHora
          : dataHora // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      kit: freezed == kit
          ? _value.kit
          : kit // ignore: cast_nullable_to_non_nullable
              as KitModel?,
      item: freezed == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as ItemModel?,
      usuario: freezed == usuario
          ? _value.usuario
          : usuario // ignore: cast_nullable_to_non_nullable
              as UsuarioModel?,
      autorizadoPor: freezed == autorizadoPor
          ? _value.autorizadoPor
          : autorizadoPor // ignore: cast_nullable_to_non_nullable
              as UsuarioModel?,
      motivoReporRemoverItem: null == motivoReporRemoverItem
          ? _value.motivoReporRemoverItem
          : motivoReporRemoverItem // ignore: cast_nullable_to_non_nullable
              as MotivoRemoverReporItemModel,
      tipo: freezed == tipo
          ? _value.tipo
          : tipo // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
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
  $UsuarioModelCopyWith<$Res>? get usuario {
    if (_value.usuario == null) {
      return null;
    }

    return $UsuarioModelCopyWith<$Res>(_value.usuario!, (value) {
      return _then(_value.copyWith(usuario: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UsuarioModelCopyWith<$Res>? get autorizadoPor {
    if (_value.autorizadoPor == null) {
      return null;
    }

    return $UsuarioModelCopyWith<$Res>(_value.autorizadoPor!, (value) {
      return _then(_value.copyWith(autorizadoPor: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MotivoRemoverReporItemModelCopyWith<$Res> get motivoReporRemoverItem {
    return $MotivoRemoverReporItemModelCopyWith<$Res>(
        _value.motivoReporRemoverItem, (value) {
      return _then(_value.copyWith(motivoReporRemoverItem: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ConsultaRemoverReporItemModelImplCopyWith<$Res>
    implements $ConsultaRemoverReporItemModelCopyWith<$Res> {
  factory _$$ConsultaRemoverReporItemModelImplCopyWith(
          _$ConsultaRemoverReporItemModelImpl value,
          $Res Function(_$ConsultaRemoverReporItemModelImpl) then) =
      __$$ConsultaRemoverReporItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? dataHora,
      KitModel? kit,
      ItemModel? item,
      UsuarioModel? usuario,
      UsuarioModel? autorizadoPor,
      MotivoRemoverReporItemModel motivoReporRemoverItem,
      String? tipo});

  @override
  $KitModelCopyWith<$Res>? get kit;
  @override
  $ItemModelCopyWith<$Res>? get item;
  @override
  $UsuarioModelCopyWith<$Res>? get usuario;
  @override
  $UsuarioModelCopyWith<$Res>? get autorizadoPor;
  @override
  $MotivoRemoverReporItemModelCopyWith<$Res> get motivoReporRemoverItem;
}

/// @nodoc
class __$$ConsultaRemoverReporItemModelImplCopyWithImpl<$Res>
    extends _$ConsultaRemoverReporItemModelCopyWithImpl<$Res,
        _$ConsultaRemoverReporItemModelImpl>
    implements _$$ConsultaRemoverReporItemModelImplCopyWith<$Res> {
  __$$ConsultaRemoverReporItemModelImplCopyWithImpl(
      _$ConsultaRemoverReporItemModelImpl _value,
      $Res Function(_$ConsultaRemoverReporItemModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dataHora = freezed,
    Object? kit = freezed,
    Object? item = freezed,
    Object? usuario = freezed,
    Object? autorizadoPor = freezed,
    Object? motivoReporRemoverItem = null,
    Object? tipo = freezed,
  }) {
    return _then(_$ConsultaRemoverReporItemModelImpl(
      dataHora: freezed == dataHora
          ? _value.dataHora
          : dataHora // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      kit: freezed == kit
          ? _value.kit
          : kit // ignore: cast_nullable_to_non_nullable
              as KitModel?,
      item: freezed == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as ItemModel?,
      usuario: freezed == usuario
          ? _value.usuario
          : usuario // ignore: cast_nullable_to_non_nullable
              as UsuarioModel?,
      autorizadoPor: freezed == autorizadoPor
          ? _value.autorizadoPor
          : autorizadoPor // ignore: cast_nullable_to_non_nullable
              as UsuarioModel?,
      motivoReporRemoverItem: null == motivoReporRemoverItem
          ? _value.motivoReporRemoverItem
          : motivoReporRemoverItem // ignore: cast_nullable_to_non_nullable
              as MotivoRemoverReporItemModel,
      tipo: freezed == tipo
          ? _value.tipo
          : tipo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsultaRemoverReporItemModelImpl extends _ConsultaRemoverReporItemModel
    with DiagnosticableTreeMixin {
  _$ConsultaRemoverReporItemModelImpl(
      {required this.dataHora,
      required this.kit,
      required this.item,
      required this.usuario,
      required this.autorizadoPor,
      required this.motivoReporRemoverItem,
      required this.tipo})
      : super._();

  factory _$ConsultaRemoverReporItemModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ConsultaRemoverReporItemModelImplFromJson(json);

  @override
  DateTime? dataHora;
  @override
  KitModel? kit;
  @override
  ItemModel? item;
  @override
  UsuarioModel? usuario;
  @override
  UsuarioModel? autorizadoPor;
  @override
  MotivoRemoverReporItemModel motivoReporRemoverItem;
  @override
  String? tipo;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ConsultaRemoverReporItemModel(dataHora: $dataHora, kit: $kit, item: $item, usuario: $usuario, autorizadoPor: $autorizadoPor, motivoReporRemoverItem: $motivoReporRemoverItem, tipo: $tipo)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ConsultaRemoverReporItemModel'))
      ..add(DiagnosticsProperty('dataHora', dataHora))
      ..add(DiagnosticsProperty('kit', kit))
      ..add(DiagnosticsProperty('item', item))
      ..add(DiagnosticsProperty('usuario', usuario))
      ..add(DiagnosticsProperty('autorizadoPor', autorizadoPor))
      ..add(
          DiagnosticsProperty('motivoReporRemoverItem', motivoReporRemoverItem))
      ..add(DiagnosticsProperty('tipo', tipo));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsultaRemoverReporItemModelImplCopyWith<
          _$ConsultaRemoverReporItemModelImpl>
      get copyWith => __$$ConsultaRemoverReporItemModelImplCopyWithImpl<
          _$ConsultaRemoverReporItemModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsultaRemoverReporItemModelImplToJson(
      this,
    );
  }
}

abstract class _ConsultaRemoverReporItemModel
    extends ConsultaRemoverReporItemModel {
  factory _ConsultaRemoverReporItemModel(
      {required DateTime? dataHora,
      required KitModel? kit,
      required ItemModel? item,
      required UsuarioModel? usuario,
      required UsuarioModel? autorizadoPor,
      required MotivoRemoverReporItemModel motivoReporRemoverItem,
      required String? tipo}) = _$ConsultaRemoverReporItemModelImpl;
  _ConsultaRemoverReporItemModel._() : super._();

  factory _ConsultaRemoverReporItemModel.fromJson(Map<String, dynamic> json) =
      _$ConsultaRemoverReporItemModelImpl.fromJson;

  @override
  DateTime? get dataHora;
  set dataHora(DateTime? value);
  @override
  KitModel? get kit;
  set kit(KitModel? value);
  @override
  ItemModel? get item;
  set item(ItemModel? value);
  @override
  UsuarioModel? get usuario;
  set usuario(UsuarioModel? value);
  @override
  UsuarioModel? get autorizadoPor;
  set autorizadoPor(UsuarioModel? value);
  @override
  MotivoRemoverReporItemModel get motivoReporRemoverItem;
  set motivoReporRemoverItem(MotivoRemoverReporItemModel value);
  @override
  String? get tipo;
  set tipo(String? value);
  @override
  @JsonKey(ignore: true)
  _$$ConsultaRemoverReporItemModelImplCopyWith<
          _$ConsultaRemoverReporItemModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
