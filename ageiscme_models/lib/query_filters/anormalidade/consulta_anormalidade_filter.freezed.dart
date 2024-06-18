// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consulta_anormalidade_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConsultaAnormalidadeFilter _$ConsultaAnormalidadeFilterFromJson(
    Map<String, dynamic> json) {
  return _ConsultaAnormalidadeFilter.fromJson(json);
}

/// @nodoc
mixin _$ConsultaAnormalidadeFilter {
  int? get codAnormalidadeTipo => throw _privateConstructorUsedError;
  set codAnormalidadeTipo(int? value) => throw _privateConstructorUsedError;
  AnormalidadeTipoShortResponseDTO? get anormalidadeTipo =>
      throw _privateConstructorUsedError;
  set anormalidadeTipo(AnormalidadeTipoShortResponseDTO? value) =>
      throw _privateConstructorUsedError;
  DateTime? get startDate => throw _privateConstructorUsedError;
  set startDate(DateTime? value) => throw _privateConstructorUsedError;
  DateTime? get startTime => throw _privateConstructorUsedError;
  set startTime(DateTime? value) => throw _privateConstructorUsedError;
  DateTime? get finalDate => throw _privateConstructorUsedError;
  set finalDate(DateTime? value) => throw _privateConstructorUsedError;
  DateTime? get finalTime => throw _privateConstructorUsedError;
  set finalTime(DateTime? value) => throw _privateConstructorUsedError;
  String? get idEtiquetaContem => throw _privateConstructorUsedError;
  set idEtiquetaContem(String? value) => throw _privateConstructorUsedError;
  int? get codEtapaProcesso => throw _privateConstructorUsedError;
  set codEtapaProcesso(int? value) => throw _privateConstructorUsedError;
  ProcessoEtapaModel? get etapa => throw _privateConstructorUsedError;
  set etapa(ProcessoEtapaModel? value) => throw _privateConstructorUsedError;
  PlutoGridApiModel? get gridModel => throw _privateConstructorUsedError;
  set gridModel(PlutoGridApiModel? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConsultaAnormalidadeFilterCopyWith<ConsultaAnormalidadeFilter>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultaAnormalidadeFilterCopyWith<$Res> {
  factory $ConsultaAnormalidadeFilterCopyWith(ConsultaAnormalidadeFilter value,
          $Res Function(ConsultaAnormalidadeFilter) then) =
      _$ConsultaAnormalidadeFilterCopyWithImpl<$Res,
          ConsultaAnormalidadeFilter>;
  @useResult
  $Res call(
      {int? codAnormalidadeTipo,
      AnormalidadeTipoShortResponseDTO? anormalidadeTipo,
      DateTime? startDate,
      DateTime? startTime,
      DateTime? finalDate,
      DateTime? finalTime,
      String? idEtiquetaContem,
      int? codEtapaProcesso,
      ProcessoEtapaModel? etapa,
      PlutoGridApiModel? gridModel});

  $AnormalidadeTipoShortResponseDTOCopyWith<$Res>? get anormalidadeTipo;
  $ProcessoEtapaModelCopyWith<$Res>? get etapa;
  $PlutoGridApiModelCopyWith<$Res>? get gridModel;
}

/// @nodoc
class _$ConsultaAnormalidadeFilterCopyWithImpl<$Res,
        $Val extends ConsultaAnormalidadeFilter>
    implements $ConsultaAnormalidadeFilterCopyWith<$Res> {
  _$ConsultaAnormalidadeFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codAnormalidadeTipo = freezed,
    Object? anormalidadeTipo = freezed,
    Object? startDate = freezed,
    Object? startTime = freezed,
    Object? finalDate = freezed,
    Object? finalTime = freezed,
    Object? idEtiquetaContem = freezed,
    Object? codEtapaProcesso = freezed,
    Object? etapa = freezed,
    Object? gridModel = freezed,
  }) {
    return _then(_value.copyWith(
      codAnormalidadeTipo: freezed == codAnormalidadeTipo
          ? _value.codAnormalidadeTipo
          : codAnormalidadeTipo // ignore: cast_nullable_to_non_nullable
              as int?,
      anormalidadeTipo: freezed == anormalidadeTipo
          ? _value.anormalidadeTipo
          : anormalidadeTipo // ignore: cast_nullable_to_non_nullable
              as AnormalidadeTipoShortResponseDTO?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      finalDate: freezed == finalDate
          ? _value.finalDate
          : finalDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      finalTime: freezed == finalTime
          ? _value.finalTime
          : finalTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      idEtiquetaContem: freezed == idEtiquetaContem
          ? _value.idEtiquetaContem
          : idEtiquetaContem // ignore: cast_nullable_to_non_nullable
              as String?,
      codEtapaProcesso: freezed == codEtapaProcesso
          ? _value.codEtapaProcesso
          : codEtapaProcesso // ignore: cast_nullable_to_non_nullable
              as int?,
      etapa: freezed == etapa
          ? _value.etapa
          : etapa // ignore: cast_nullable_to_non_nullable
              as ProcessoEtapaModel?,
      gridModel: freezed == gridModel
          ? _value.gridModel
          : gridModel // ignore: cast_nullable_to_non_nullable
              as PlutoGridApiModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AnormalidadeTipoShortResponseDTOCopyWith<$Res>? get anormalidadeTipo {
    if (_value.anormalidadeTipo == null) {
      return null;
    }

    return $AnormalidadeTipoShortResponseDTOCopyWith<$Res>(
        _value.anormalidadeTipo!, (value) {
      return _then(_value.copyWith(anormalidadeTipo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProcessoEtapaModelCopyWith<$Res>? get etapa {
    if (_value.etapa == null) {
      return null;
    }

    return $ProcessoEtapaModelCopyWith<$Res>(_value.etapa!, (value) {
      return _then(_value.copyWith(etapa: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PlutoGridApiModelCopyWith<$Res>? get gridModel {
    if (_value.gridModel == null) {
      return null;
    }

    return $PlutoGridApiModelCopyWith<$Res>(_value.gridModel!, (value) {
      return _then(_value.copyWith(gridModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ConsultaAnormalidadeFilterImplCopyWith<$Res>
    implements $ConsultaAnormalidadeFilterCopyWith<$Res> {
  factory _$$ConsultaAnormalidadeFilterImplCopyWith(
          _$ConsultaAnormalidadeFilterImpl value,
          $Res Function(_$ConsultaAnormalidadeFilterImpl) then) =
      __$$ConsultaAnormalidadeFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? codAnormalidadeTipo,
      AnormalidadeTipoShortResponseDTO? anormalidadeTipo,
      DateTime? startDate,
      DateTime? startTime,
      DateTime? finalDate,
      DateTime? finalTime,
      String? idEtiquetaContem,
      int? codEtapaProcesso,
      ProcessoEtapaModel? etapa,
      PlutoGridApiModel? gridModel});

  @override
  $AnormalidadeTipoShortResponseDTOCopyWith<$Res>? get anormalidadeTipo;
  @override
  $ProcessoEtapaModelCopyWith<$Res>? get etapa;
  @override
  $PlutoGridApiModelCopyWith<$Res>? get gridModel;
}

/// @nodoc
class __$$ConsultaAnormalidadeFilterImplCopyWithImpl<$Res>
    extends _$ConsultaAnormalidadeFilterCopyWithImpl<$Res,
        _$ConsultaAnormalidadeFilterImpl>
    implements _$$ConsultaAnormalidadeFilterImplCopyWith<$Res> {
  __$$ConsultaAnormalidadeFilterImplCopyWithImpl(
      _$ConsultaAnormalidadeFilterImpl _value,
      $Res Function(_$ConsultaAnormalidadeFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codAnormalidadeTipo = freezed,
    Object? anormalidadeTipo = freezed,
    Object? startDate = freezed,
    Object? startTime = freezed,
    Object? finalDate = freezed,
    Object? finalTime = freezed,
    Object? idEtiquetaContem = freezed,
    Object? codEtapaProcesso = freezed,
    Object? etapa = freezed,
    Object? gridModel = freezed,
  }) {
    return _then(_$ConsultaAnormalidadeFilterImpl(
      codAnormalidadeTipo: freezed == codAnormalidadeTipo
          ? _value.codAnormalidadeTipo
          : codAnormalidadeTipo // ignore: cast_nullable_to_non_nullable
              as int?,
      anormalidadeTipo: freezed == anormalidadeTipo
          ? _value.anormalidadeTipo
          : anormalidadeTipo // ignore: cast_nullable_to_non_nullable
              as AnormalidadeTipoShortResponseDTO?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      finalDate: freezed == finalDate
          ? _value.finalDate
          : finalDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      finalTime: freezed == finalTime
          ? _value.finalTime
          : finalTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      idEtiquetaContem: freezed == idEtiquetaContem
          ? _value.idEtiquetaContem
          : idEtiquetaContem // ignore: cast_nullable_to_non_nullable
              as String?,
      codEtapaProcesso: freezed == codEtapaProcesso
          ? _value.codEtapaProcesso
          : codEtapaProcesso // ignore: cast_nullable_to_non_nullable
              as int?,
      etapa: freezed == etapa
          ? _value.etapa
          : etapa // ignore: cast_nullable_to_non_nullable
              as ProcessoEtapaModel?,
      gridModel: freezed == gridModel
          ? _value.gridModel
          : gridModel // ignore: cast_nullable_to_non_nullable
              as PlutoGridApiModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsultaAnormalidadeFilterImpl extends _ConsultaAnormalidadeFilter {
  _$ConsultaAnormalidadeFilterImpl(
      {this.codAnormalidadeTipo,
      this.anormalidadeTipo,
      this.startDate,
      this.startTime,
      this.finalDate,
      this.finalTime,
      this.idEtiquetaContem,
      this.codEtapaProcesso,
      this.etapa,
      this.gridModel})
      : super._();

  factory _$ConsultaAnormalidadeFilterImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ConsultaAnormalidadeFilterImplFromJson(json);

  @override
  int? codAnormalidadeTipo;
  @override
  AnormalidadeTipoShortResponseDTO? anormalidadeTipo;
  @override
  DateTime? startDate;
  @override
  DateTime? startTime;
  @override
  DateTime? finalDate;
  @override
  DateTime? finalTime;
  @override
  String? idEtiquetaContem;
  @override
  int? codEtapaProcesso;
  @override
  ProcessoEtapaModel? etapa;
  @override
  PlutoGridApiModel? gridModel;

  @override
  String toString() {
    return 'ConsultaAnormalidadeFilter(codAnormalidadeTipo: $codAnormalidadeTipo, anormalidadeTipo: $anormalidadeTipo, startDate: $startDate, startTime: $startTime, finalDate: $finalDate, finalTime: $finalTime, idEtiquetaContem: $idEtiquetaContem, codEtapaProcesso: $codEtapaProcesso, etapa: $etapa, gridModel: $gridModel)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsultaAnormalidadeFilterImplCopyWith<_$ConsultaAnormalidadeFilterImpl>
      get copyWith => __$$ConsultaAnormalidadeFilterImplCopyWithImpl<
          _$ConsultaAnormalidadeFilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsultaAnormalidadeFilterImplToJson(
      this,
    );
  }
}

abstract class _ConsultaAnormalidadeFilter extends ConsultaAnormalidadeFilter {
  factory _ConsultaAnormalidadeFilter(
      {int? codAnormalidadeTipo,
      AnormalidadeTipoShortResponseDTO? anormalidadeTipo,
      DateTime? startDate,
      DateTime? startTime,
      DateTime? finalDate,
      DateTime? finalTime,
      String? idEtiquetaContem,
      int? codEtapaProcesso,
      ProcessoEtapaModel? etapa,
      PlutoGridApiModel? gridModel}) = _$ConsultaAnormalidadeFilterImpl;
  _ConsultaAnormalidadeFilter._() : super._();

  factory _ConsultaAnormalidadeFilter.fromJson(Map<String, dynamic> json) =
      _$ConsultaAnormalidadeFilterImpl.fromJson;

  @override
  int? get codAnormalidadeTipo;
  set codAnormalidadeTipo(int? value);
  @override
  AnormalidadeTipoShortResponseDTO? get anormalidadeTipo;
  set anormalidadeTipo(AnormalidadeTipoShortResponseDTO? value);
  @override
  DateTime? get startDate;
  set startDate(DateTime? value);
  @override
  DateTime? get startTime;
  set startTime(DateTime? value);
  @override
  DateTime? get finalDate;
  set finalDate(DateTime? value);
  @override
  DateTime? get finalTime;
  set finalTime(DateTime? value);
  @override
  String? get idEtiquetaContem;
  set idEtiquetaContem(String? value);
  @override
  int? get codEtapaProcesso;
  set codEtapaProcesso(int? value);
  @override
  ProcessoEtapaModel? get etapa;
  set etapa(ProcessoEtapaModel? value);
  @override
  PlutoGridApiModel? get gridModel;
  set gridModel(PlutoGridApiModel? value);
  @override
  @JsonKey(ignore: true)
  _$$ConsultaAnormalidadeFilterImplCopyWith<_$ConsultaAnormalidadeFilterImpl>
      get copyWith => throw _privateConstructorUsedError;
}
