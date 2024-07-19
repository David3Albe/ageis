// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'epi_perfil_find_by_epi_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EpiPerfilFindByEpiDTO _$EpiPerfilFindByEpiDTOFromJson(
    Map<String, dynamic> json) {
  return _EpiPerfilFindByEpiDTO.fromJson(json);
}

/// @nodoc
mixin _$EpiPerfilFindByEpiDTO {
  int get codEpiDescritor => throw _privateConstructorUsedError;
  set codEpiDescritor(int value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EpiPerfilFindByEpiDTOCopyWith<EpiPerfilFindByEpiDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpiPerfilFindByEpiDTOCopyWith<$Res> {
  factory $EpiPerfilFindByEpiDTOCopyWith(EpiPerfilFindByEpiDTO value,
          $Res Function(EpiPerfilFindByEpiDTO) then) =
      _$EpiPerfilFindByEpiDTOCopyWithImpl<$Res, EpiPerfilFindByEpiDTO>;
  @useResult
  $Res call({int codEpiDescritor});
}

/// @nodoc
class _$EpiPerfilFindByEpiDTOCopyWithImpl<$Res,
        $Val extends EpiPerfilFindByEpiDTO>
    implements $EpiPerfilFindByEpiDTOCopyWith<$Res> {
  _$EpiPerfilFindByEpiDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codEpiDescritor = null,
  }) {
    return _then(_value.copyWith(
      codEpiDescritor: null == codEpiDescritor
          ? _value.codEpiDescritor
          : codEpiDescritor // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EpiPerfilFindByEpiDTOImplCopyWith<$Res>
    implements $EpiPerfilFindByEpiDTOCopyWith<$Res> {
  factory _$$EpiPerfilFindByEpiDTOImplCopyWith(
          _$EpiPerfilFindByEpiDTOImpl value,
          $Res Function(_$EpiPerfilFindByEpiDTOImpl) then) =
      __$$EpiPerfilFindByEpiDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int codEpiDescritor});
}

/// @nodoc
class __$$EpiPerfilFindByEpiDTOImplCopyWithImpl<$Res>
    extends _$EpiPerfilFindByEpiDTOCopyWithImpl<$Res,
        _$EpiPerfilFindByEpiDTOImpl>
    implements _$$EpiPerfilFindByEpiDTOImplCopyWith<$Res> {
  __$$EpiPerfilFindByEpiDTOImplCopyWithImpl(_$EpiPerfilFindByEpiDTOImpl _value,
      $Res Function(_$EpiPerfilFindByEpiDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codEpiDescritor = null,
  }) {
    return _then(_$EpiPerfilFindByEpiDTOImpl(
      codEpiDescritor: null == codEpiDescritor
          ? _value.codEpiDescritor
          : codEpiDescritor // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EpiPerfilFindByEpiDTOImpl implements _EpiPerfilFindByEpiDTO {
  _$EpiPerfilFindByEpiDTOImpl({required this.codEpiDescritor});

  factory _$EpiPerfilFindByEpiDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$EpiPerfilFindByEpiDTOImplFromJson(json);

  @override
  int codEpiDescritor;

  @override
  String toString() {
    return 'EpiPerfilFindByEpiDTO(codEpiDescritor: $codEpiDescritor)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EpiPerfilFindByEpiDTOImplCopyWith<_$EpiPerfilFindByEpiDTOImpl>
      get copyWith => __$$EpiPerfilFindByEpiDTOImplCopyWithImpl<
          _$EpiPerfilFindByEpiDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EpiPerfilFindByEpiDTOImplToJson(
      this,
    );
  }
}

abstract class _EpiPerfilFindByEpiDTO implements EpiPerfilFindByEpiDTO {
  factory _EpiPerfilFindByEpiDTO({required int codEpiDescritor}) =
      _$EpiPerfilFindByEpiDTOImpl;

  factory _EpiPerfilFindByEpiDTO.fromJson(Map<String, dynamic> json) =
      _$EpiPerfilFindByEpiDTOImpl.fromJson;

  @override
  int get codEpiDescritor;
  set codEpiDescritor(int value);
  @override
  @JsonKey(ignore: true)
  _$$EpiPerfilFindByEpiDTOImplCopyWith<_$EpiPerfilFindByEpiDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
