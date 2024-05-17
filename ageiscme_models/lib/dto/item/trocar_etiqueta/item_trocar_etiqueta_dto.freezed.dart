// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_trocar_etiqueta_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ItemTrocarEtiquetaDTO _$ItemTrocarEtiquetaDTOFromJson(
    Map<String, dynamic> json) {
  return _ItemTrocarEtiquetaDTO.fromJson(json);
}

/// @nodoc
mixin _$ItemTrocarEtiquetaDTO {
  String get codBarraOriginal => throw _privateConstructorUsedError;
  set codBarraOriginal(String value) => throw _privateConstructorUsedError;
  String get codBarraNovo => throw _privateConstructorUsedError;
  set codBarraNovo(String value) => throw _privateConstructorUsedError;
  int get codUsuario => throw _privateConstructorUsedError;
  set codUsuario(int value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemTrocarEtiquetaDTOCopyWith<ItemTrocarEtiquetaDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemTrocarEtiquetaDTOCopyWith<$Res> {
  factory $ItemTrocarEtiquetaDTOCopyWith(ItemTrocarEtiquetaDTO value,
          $Res Function(ItemTrocarEtiquetaDTO) then) =
      _$ItemTrocarEtiquetaDTOCopyWithImpl<$Res, ItemTrocarEtiquetaDTO>;
  @useResult
  $Res call({String codBarraOriginal, String codBarraNovo, int codUsuario});
}

/// @nodoc
class _$ItemTrocarEtiquetaDTOCopyWithImpl<$Res,
        $Val extends ItemTrocarEtiquetaDTO>
    implements $ItemTrocarEtiquetaDTOCopyWith<$Res> {
  _$ItemTrocarEtiquetaDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codBarraOriginal = null,
    Object? codBarraNovo = null,
    Object? codUsuario = null,
  }) {
    return _then(_value.copyWith(
      codBarraOriginal: null == codBarraOriginal
          ? _value.codBarraOriginal
          : codBarraOriginal // ignore: cast_nullable_to_non_nullable
              as String,
      codBarraNovo: null == codBarraNovo
          ? _value.codBarraNovo
          : codBarraNovo // ignore: cast_nullable_to_non_nullable
              as String,
      codUsuario: null == codUsuario
          ? _value.codUsuario
          : codUsuario // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemTrocarEtiquetaDTOImplCopyWith<$Res>
    implements $ItemTrocarEtiquetaDTOCopyWith<$Res> {
  factory _$$ItemTrocarEtiquetaDTOImplCopyWith(
          _$ItemTrocarEtiquetaDTOImpl value,
          $Res Function(_$ItemTrocarEtiquetaDTOImpl) then) =
      __$$ItemTrocarEtiquetaDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String codBarraOriginal, String codBarraNovo, int codUsuario});
}

/// @nodoc
class __$$ItemTrocarEtiquetaDTOImplCopyWithImpl<$Res>
    extends _$ItemTrocarEtiquetaDTOCopyWithImpl<$Res,
        _$ItemTrocarEtiquetaDTOImpl>
    implements _$$ItemTrocarEtiquetaDTOImplCopyWith<$Res> {
  __$$ItemTrocarEtiquetaDTOImplCopyWithImpl(_$ItemTrocarEtiquetaDTOImpl _value,
      $Res Function(_$ItemTrocarEtiquetaDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codBarraOriginal = null,
    Object? codBarraNovo = null,
    Object? codUsuario = null,
  }) {
    return _then(_$ItemTrocarEtiquetaDTOImpl(
      codBarraOriginal: null == codBarraOriginal
          ? _value.codBarraOriginal
          : codBarraOriginal // ignore: cast_nullable_to_non_nullable
              as String,
      codBarraNovo: null == codBarraNovo
          ? _value.codBarraNovo
          : codBarraNovo // ignore: cast_nullable_to_non_nullable
              as String,
      codUsuario: null == codUsuario
          ? _value.codUsuario
          : codUsuario // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemTrocarEtiquetaDTOImpl implements _ItemTrocarEtiquetaDTO {
  _$ItemTrocarEtiquetaDTOImpl(
      {required this.codBarraOriginal,
      required this.codBarraNovo,
      required this.codUsuario});

  factory _$ItemTrocarEtiquetaDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemTrocarEtiquetaDTOImplFromJson(json);

  @override
  String codBarraOriginal;
  @override
  String codBarraNovo;
  @override
  int codUsuario;

  @override
  String toString() {
    return 'ItemTrocarEtiquetaDTO(codBarraOriginal: $codBarraOriginal, codBarraNovo: $codBarraNovo, codUsuario: $codUsuario)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemTrocarEtiquetaDTOImplCopyWith<_$ItemTrocarEtiquetaDTOImpl>
      get copyWith => __$$ItemTrocarEtiquetaDTOImplCopyWithImpl<
          _$ItemTrocarEtiquetaDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemTrocarEtiquetaDTOImplToJson(
      this,
    );
  }
}

abstract class _ItemTrocarEtiquetaDTO implements ItemTrocarEtiquetaDTO {
  factory _ItemTrocarEtiquetaDTO(
      {required String codBarraOriginal,
      required String codBarraNovo,
      required int codUsuario}) = _$ItemTrocarEtiquetaDTOImpl;

  factory _ItemTrocarEtiquetaDTO.fromJson(Map<String, dynamic> json) =
      _$ItemTrocarEtiquetaDTOImpl.fromJson;

  @override
  String get codBarraOriginal;
  set codBarraOriginal(String value);
  @override
  String get codBarraNovo;
  set codBarraNovo(String value);
  @override
  int get codUsuario;
  set codUsuario(int value);
  @override
  @JsonKey(ignore: true)
  _$$ItemTrocarEtiquetaDTOImplCopyWith<_$ItemTrocarEtiquetaDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
