// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'processo_etapa_search_materials_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProcessoEtapaSearchMaterialsDTO _$ProcessoEtapaSearchMaterialsDTOFromJson(
    Map<String, dynamic> json) {
  return _ProcessoEtapaSearchMaterialsDTO.fromJson(json);
}

/// @nodoc
mixin _$ProcessoEtapaSearchMaterialsDTO {
  int get codEtapaProcesso => throw _privateConstructorUsedError;
  set codEtapaProcesso(int value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProcessoEtapaSearchMaterialsDTOCopyWith<ProcessoEtapaSearchMaterialsDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcessoEtapaSearchMaterialsDTOCopyWith<$Res> {
  factory $ProcessoEtapaSearchMaterialsDTOCopyWith(
          ProcessoEtapaSearchMaterialsDTO value,
          $Res Function(ProcessoEtapaSearchMaterialsDTO) then) =
      _$ProcessoEtapaSearchMaterialsDTOCopyWithImpl<$Res,
          ProcessoEtapaSearchMaterialsDTO>;
  @useResult
  $Res call({int codEtapaProcesso});
}

/// @nodoc
class _$ProcessoEtapaSearchMaterialsDTOCopyWithImpl<$Res,
        $Val extends ProcessoEtapaSearchMaterialsDTO>
    implements $ProcessoEtapaSearchMaterialsDTOCopyWith<$Res> {
  _$ProcessoEtapaSearchMaterialsDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codEtapaProcesso = null,
  }) {
    return _then(_value.copyWith(
      codEtapaProcesso: null == codEtapaProcesso
          ? _value.codEtapaProcesso
          : codEtapaProcesso // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProcessoEtapaSearchMaterialsDTOImplCopyWith<$Res>
    implements $ProcessoEtapaSearchMaterialsDTOCopyWith<$Res> {
  factory _$$ProcessoEtapaSearchMaterialsDTOImplCopyWith(
          _$ProcessoEtapaSearchMaterialsDTOImpl value,
          $Res Function(_$ProcessoEtapaSearchMaterialsDTOImpl) then) =
      __$$ProcessoEtapaSearchMaterialsDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int codEtapaProcesso});
}

/// @nodoc
class __$$ProcessoEtapaSearchMaterialsDTOImplCopyWithImpl<$Res>
    extends _$ProcessoEtapaSearchMaterialsDTOCopyWithImpl<$Res,
        _$ProcessoEtapaSearchMaterialsDTOImpl>
    implements _$$ProcessoEtapaSearchMaterialsDTOImplCopyWith<$Res> {
  __$$ProcessoEtapaSearchMaterialsDTOImplCopyWithImpl(
      _$ProcessoEtapaSearchMaterialsDTOImpl _value,
      $Res Function(_$ProcessoEtapaSearchMaterialsDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codEtapaProcesso = null,
  }) {
    return _then(_$ProcessoEtapaSearchMaterialsDTOImpl(
      codEtapaProcesso: null == codEtapaProcesso
          ? _value.codEtapaProcesso
          : codEtapaProcesso // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProcessoEtapaSearchMaterialsDTOImpl
    implements _ProcessoEtapaSearchMaterialsDTO {
  _$ProcessoEtapaSearchMaterialsDTOImpl({required this.codEtapaProcesso});

  factory _$ProcessoEtapaSearchMaterialsDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ProcessoEtapaSearchMaterialsDTOImplFromJson(json);

  @override
  int codEtapaProcesso;

  @override
  String toString() {
    return 'ProcessoEtapaSearchMaterialsDTO(codEtapaProcesso: $codEtapaProcesso)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcessoEtapaSearchMaterialsDTOImplCopyWith<
          _$ProcessoEtapaSearchMaterialsDTOImpl>
      get copyWith => __$$ProcessoEtapaSearchMaterialsDTOImplCopyWithImpl<
          _$ProcessoEtapaSearchMaterialsDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProcessoEtapaSearchMaterialsDTOImplToJson(
      this,
    );
  }
}

abstract class _ProcessoEtapaSearchMaterialsDTO
    implements ProcessoEtapaSearchMaterialsDTO {
  factory _ProcessoEtapaSearchMaterialsDTO({required int codEtapaProcesso}) =
      _$ProcessoEtapaSearchMaterialsDTOImpl;

  factory _ProcessoEtapaSearchMaterialsDTO.fromJson(Map<String, dynamic> json) =
      _$ProcessoEtapaSearchMaterialsDTOImpl.fromJson;

  @override
  int get codEtapaProcesso;
  set codEtapaProcesso(int value);
  @override
  @JsonKey(ignore: true)
  _$$ProcessoEtapaSearchMaterialsDTOImplCopyWith<
          _$ProcessoEtapaSearchMaterialsDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
