// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consulta_item_inventario_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConsultaItemInventarioFilter _$ConsultaItemInventarioFilterFromJson(
    Map<String, dynamic> json) {
  return _ConsultaItemInventarioFilter.fromJson(json);
}

/// @nodoc
mixin _$ConsultaItemInventarioFilter {
  int? get codItemDescritor => throw _privateConstructorUsedError;
  set codItemDescritor(int? value) => throw _privateConstructorUsedError;
  bool? get repositorio => throw _privateConstructorUsedError;
  set repositorio(bool? value) => throw _privateConstructorUsedError;
  bool? get descartado => throw _privateConstructorUsedError;
  set descartado(bool? value) => throw _privateConstructorUsedError;
  bool? get implantavel => throw _privateConstructorUsedError;
  set implantavel(bool? value) => throw _privateConstructorUsedError;
  bool? get complementar => throw _privateConstructorUsedError;
  set complementar(bool? value) => throw _privateConstructorUsedError;
  String? get situacao => throw _privateConstructorUsedError;
  set situacao(String? value) => throw _privateConstructorUsedError;
  int? get codGrupoItem => throw _privateConstructorUsedError;
  set codGrupoItem(int? value) => throw _privateConstructorUsedError;
  int? get codProprietario => throw _privateConstructorUsedError;
  set codProprietario(int? value) => throw _privateConstructorUsedError;
  double? get cmInicio => throw _privateConstructorUsedError;
  set cmInicio(double? value) => throw _privateConstructorUsedError;
  double? get cmFinal => throw _privateConstructorUsedError;
  set cmFinal(double? value) => throw _privateConstructorUsedError;
  ItemDescritorDropDownSearchResponseDTO? get itemDescritor =>
      throw _privateConstructorUsedError;
  set itemDescritor(ItemDescritorDropDownSearchResponseDTO? value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConsultaItemInventarioFilterCopyWith<ConsultaItemInventarioFilter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultaItemInventarioFilterCopyWith<$Res> {
  factory $ConsultaItemInventarioFilterCopyWith(
          ConsultaItemInventarioFilter value,
          $Res Function(ConsultaItemInventarioFilter) then) =
      _$ConsultaItemInventarioFilterCopyWithImpl<$Res,
          ConsultaItemInventarioFilter>;
  @useResult
  $Res call(
      {int? codItemDescritor,
      bool? repositorio,
      bool? descartado,
      bool? implantavel,
      bool? complementar,
      String? situacao,
      int? codGrupoItem,
      int? codProprietario,
      double? cmInicio,
      double? cmFinal,
      ItemDescritorDropDownSearchResponseDTO? itemDescritor});

  $ItemDescritorDropDownSearchResponseDTOCopyWith<$Res>? get itemDescritor;
}

/// @nodoc
class _$ConsultaItemInventarioFilterCopyWithImpl<$Res,
        $Val extends ConsultaItemInventarioFilter>
    implements $ConsultaItemInventarioFilterCopyWith<$Res> {
  _$ConsultaItemInventarioFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codItemDescritor = freezed,
    Object? repositorio = freezed,
    Object? descartado = freezed,
    Object? implantavel = freezed,
    Object? complementar = freezed,
    Object? situacao = freezed,
    Object? codGrupoItem = freezed,
    Object? codProprietario = freezed,
    Object? cmInicio = freezed,
    Object? cmFinal = freezed,
    Object? itemDescritor = freezed,
  }) {
    return _then(_value.copyWith(
      codItemDescritor: freezed == codItemDescritor
          ? _value.codItemDescritor
          : codItemDescritor // ignore: cast_nullable_to_non_nullable
              as int?,
      repositorio: freezed == repositorio
          ? _value.repositorio
          : repositorio // ignore: cast_nullable_to_non_nullable
              as bool?,
      descartado: freezed == descartado
          ? _value.descartado
          : descartado // ignore: cast_nullable_to_non_nullable
              as bool?,
      implantavel: freezed == implantavel
          ? _value.implantavel
          : implantavel // ignore: cast_nullable_to_non_nullable
              as bool?,
      complementar: freezed == complementar
          ? _value.complementar
          : complementar // ignore: cast_nullable_to_non_nullable
              as bool?,
      situacao: freezed == situacao
          ? _value.situacao
          : situacao // ignore: cast_nullable_to_non_nullable
              as String?,
      codGrupoItem: freezed == codGrupoItem
          ? _value.codGrupoItem
          : codGrupoItem // ignore: cast_nullable_to_non_nullable
              as int?,
      codProprietario: freezed == codProprietario
          ? _value.codProprietario
          : codProprietario // ignore: cast_nullable_to_non_nullable
              as int?,
      cmInicio: freezed == cmInicio
          ? _value.cmInicio
          : cmInicio // ignore: cast_nullable_to_non_nullable
              as double?,
      cmFinal: freezed == cmFinal
          ? _value.cmFinal
          : cmFinal // ignore: cast_nullable_to_non_nullable
              as double?,
      itemDescritor: freezed == itemDescritor
          ? _value.itemDescritor
          : itemDescritor // ignore: cast_nullable_to_non_nullable
              as ItemDescritorDropDownSearchResponseDTO?,
    ) as $Val);
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
abstract class _$$ConsultaItemInventarioFilterImplCopyWith<$Res>
    implements $ConsultaItemInventarioFilterCopyWith<$Res> {
  factory _$$ConsultaItemInventarioFilterImplCopyWith(
          _$ConsultaItemInventarioFilterImpl value,
          $Res Function(_$ConsultaItemInventarioFilterImpl) then) =
      __$$ConsultaItemInventarioFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? codItemDescritor,
      bool? repositorio,
      bool? descartado,
      bool? implantavel,
      bool? complementar,
      String? situacao,
      int? codGrupoItem,
      int? codProprietario,
      double? cmInicio,
      double? cmFinal,
      ItemDescritorDropDownSearchResponseDTO? itemDescritor});

  @override
  $ItemDescritorDropDownSearchResponseDTOCopyWith<$Res>? get itemDescritor;
}

/// @nodoc
class __$$ConsultaItemInventarioFilterImplCopyWithImpl<$Res>
    extends _$ConsultaItemInventarioFilterCopyWithImpl<$Res,
        _$ConsultaItemInventarioFilterImpl>
    implements _$$ConsultaItemInventarioFilterImplCopyWith<$Res> {
  __$$ConsultaItemInventarioFilterImplCopyWithImpl(
      _$ConsultaItemInventarioFilterImpl _value,
      $Res Function(_$ConsultaItemInventarioFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codItemDescritor = freezed,
    Object? repositorio = freezed,
    Object? descartado = freezed,
    Object? implantavel = freezed,
    Object? complementar = freezed,
    Object? situacao = freezed,
    Object? codGrupoItem = freezed,
    Object? codProprietario = freezed,
    Object? cmInicio = freezed,
    Object? cmFinal = freezed,
    Object? itemDescritor = freezed,
  }) {
    return _then(_$ConsultaItemInventarioFilterImpl(
      codItemDescritor: freezed == codItemDescritor
          ? _value.codItemDescritor
          : codItemDescritor // ignore: cast_nullable_to_non_nullable
              as int?,
      repositorio: freezed == repositorio
          ? _value.repositorio
          : repositorio // ignore: cast_nullable_to_non_nullable
              as bool?,
      descartado: freezed == descartado
          ? _value.descartado
          : descartado // ignore: cast_nullable_to_non_nullable
              as bool?,
      implantavel: freezed == implantavel
          ? _value.implantavel
          : implantavel // ignore: cast_nullable_to_non_nullable
              as bool?,
      complementar: freezed == complementar
          ? _value.complementar
          : complementar // ignore: cast_nullable_to_non_nullable
              as bool?,
      situacao: freezed == situacao
          ? _value.situacao
          : situacao // ignore: cast_nullable_to_non_nullable
              as String?,
      codGrupoItem: freezed == codGrupoItem
          ? _value.codGrupoItem
          : codGrupoItem // ignore: cast_nullable_to_non_nullable
              as int?,
      codProprietario: freezed == codProprietario
          ? _value.codProprietario
          : codProprietario // ignore: cast_nullable_to_non_nullable
              as int?,
      cmInicio: freezed == cmInicio
          ? _value.cmInicio
          : cmInicio // ignore: cast_nullable_to_non_nullable
              as double?,
      cmFinal: freezed == cmFinal
          ? _value.cmFinal
          : cmFinal // ignore: cast_nullable_to_non_nullable
              as double?,
      itemDescritor: freezed == itemDescritor
          ? _value.itemDescritor
          : itemDescritor // ignore: cast_nullable_to_non_nullable
              as ItemDescritorDropDownSearchResponseDTO?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsultaItemInventarioFilterImpl extends _ConsultaItemInventarioFilter {
  _$ConsultaItemInventarioFilterImpl(
      {required this.codItemDescritor,
      required this.repositorio,
      required this.descartado,
      required this.implantavel,
      required this.complementar,
      required this.situacao,
      required this.codGrupoItem,
      required this.codProprietario,
      required this.cmInicio,
      required this.cmFinal,
      this.itemDescritor})
      : super._();

  factory _$ConsultaItemInventarioFilterImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ConsultaItemInventarioFilterImplFromJson(json);

  @override
  int? codItemDescritor;
  @override
  bool? repositorio;
  @override
  bool? descartado;
  @override
  bool? implantavel;
  @override
  bool? complementar;
  @override
  String? situacao;
  @override
  int? codGrupoItem;
  @override
  int? codProprietario;
  @override
  double? cmInicio;
  @override
  double? cmFinal;
  @override
  ItemDescritorDropDownSearchResponseDTO? itemDescritor;

  @override
  String toString() {
    return 'ConsultaItemInventarioFilter(codItemDescritor: $codItemDescritor, repositorio: $repositorio, descartado: $descartado, implantavel: $implantavel, complementar: $complementar, situacao: $situacao, codGrupoItem: $codGrupoItem, codProprietario: $codProprietario, cmInicio: $cmInicio, cmFinal: $cmFinal, itemDescritor: $itemDescritor)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsultaItemInventarioFilterImplCopyWith<
          _$ConsultaItemInventarioFilterImpl>
      get copyWith => __$$ConsultaItemInventarioFilterImplCopyWithImpl<
          _$ConsultaItemInventarioFilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsultaItemInventarioFilterImplToJson(
      this,
    );
  }
}

abstract class _ConsultaItemInventarioFilter
    extends ConsultaItemInventarioFilter {
  factory _ConsultaItemInventarioFilter(
          {required int? codItemDescritor,
          required bool? repositorio,
          required bool? descartado,
          required bool? implantavel,
          required bool? complementar,
          required String? situacao,
          required int? codGrupoItem,
          required int? codProprietario,
          required double? cmInicio,
          required double? cmFinal,
          ItemDescritorDropDownSearchResponseDTO? itemDescritor}) =
      _$ConsultaItemInventarioFilterImpl;
  _ConsultaItemInventarioFilter._() : super._();

  factory _ConsultaItemInventarioFilter.fromJson(Map<String, dynamic> json) =
      _$ConsultaItemInventarioFilterImpl.fromJson;

  @override
  int? get codItemDescritor;
  set codItemDescritor(int? value);
  @override
  bool? get repositorio;
  set repositorio(bool? value);
  @override
  bool? get descartado;
  set descartado(bool? value);
  @override
  bool? get implantavel;
  set implantavel(bool? value);
  @override
  bool? get complementar;
  set complementar(bool? value);
  @override
  String? get situacao;
  set situacao(String? value);
  @override
  int? get codGrupoItem;
  set codGrupoItem(int? value);
  @override
  int? get codProprietario;
  set codProprietario(int? value);
  @override
  double? get cmInicio;
  set cmInicio(double? value);
  @override
  double? get cmFinal;
  set cmFinal(double? value);
  @override
  ItemDescritorDropDownSearchResponseDTO? get itemDescritor;
  set itemDescritor(ItemDescritorDropDownSearchResponseDTO? value);
  @override
  @JsonKey(ignore: true)
  _$$ConsultaItemInventarioFilterImplCopyWith<
          _$ConsultaItemInventarioFilterImpl>
      get copyWith => throw _privateConstructorUsedError;
}
