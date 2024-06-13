// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anormalidade_tipo_query_one_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AnormalidadeTipoQueryOneDTO _$AnormalidadeTipoQueryOneDTOFromJson(
    Map<String, dynamic> json) {
  return _AnormalidadeTipoQueryOneDTO.fromJson(json);
}

/// @nodoc
mixin _$AnormalidadeTipoQueryOneDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnormalidadeTipoQueryOneDTOCopyWith<AnormalidadeTipoQueryOneDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnormalidadeTipoQueryOneDTOCopyWith<$Res> {
  factory $AnormalidadeTipoQueryOneDTOCopyWith(
          AnormalidadeTipoQueryOneDTO value,
          $Res Function(AnormalidadeTipoQueryOneDTO) then) =
      _$AnormalidadeTipoQueryOneDTOCopyWithImpl<$Res,
          AnormalidadeTipoQueryOneDTO>;
  @useResult
  $Res call({int cod});
}

/// @nodoc
class _$AnormalidadeTipoQueryOneDTOCopyWithImpl<$Res,
        $Val extends AnormalidadeTipoQueryOneDTO>
    implements $AnormalidadeTipoQueryOneDTOCopyWith<$Res> {
  _$AnormalidadeTipoQueryOneDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
  }) {
    return _then(_value.copyWith(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnormalidadeTipoQueryOneDTOImplCopyWith<$Res>
    implements $AnormalidadeTipoQueryOneDTOCopyWith<$Res> {
  factory _$$AnormalidadeTipoQueryOneDTOImplCopyWith(
          _$AnormalidadeTipoQueryOneDTOImpl value,
          $Res Function(_$AnormalidadeTipoQueryOneDTOImpl) then) =
      __$$AnormalidadeTipoQueryOneDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod});
}

/// @nodoc
class __$$AnormalidadeTipoQueryOneDTOImplCopyWithImpl<$Res>
    extends _$AnormalidadeTipoQueryOneDTOCopyWithImpl<$Res,
        _$AnormalidadeTipoQueryOneDTOImpl>
    implements _$$AnormalidadeTipoQueryOneDTOImplCopyWith<$Res> {
  __$$AnormalidadeTipoQueryOneDTOImplCopyWithImpl(
      _$AnormalidadeTipoQueryOneDTOImpl _value,
      $Res Function(_$AnormalidadeTipoQueryOneDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
  }) {
    return _then(_$AnormalidadeTipoQueryOneDTOImpl(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnormalidadeTipoQueryOneDTOImpl
    implements _AnormalidadeTipoQueryOneDTO {
  _$AnormalidadeTipoQueryOneDTOImpl({required this.cod});

  factory _$AnormalidadeTipoQueryOneDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AnormalidadeTipoQueryOneDTOImplFromJson(json);

  @override
  int cod;

  @override
  String toString() {
    return 'AnormalidadeTipoQueryOneDTO(cod: $cod)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnormalidadeTipoQueryOneDTOImplCopyWith<_$AnormalidadeTipoQueryOneDTOImpl>
      get copyWith => __$$AnormalidadeTipoQueryOneDTOImplCopyWithImpl<
          _$AnormalidadeTipoQueryOneDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnormalidadeTipoQueryOneDTOImplToJson(
      this,
    );
  }
}

abstract class _AnormalidadeTipoQueryOneDTO
    implements AnormalidadeTipoQueryOneDTO {
  factory _AnormalidadeTipoQueryOneDTO({required int cod}) =
      _$AnormalidadeTipoQueryOneDTOImpl;

  factory _AnormalidadeTipoQueryOneDTO.fromJson(Map<String, dynamic> json) =
      _$AnormalidadeTipoQueryOneDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  @JsonKey(ignore: true)
  _$$AnormalidadeTipoQueryOneDTOImplCopyWith<_$AnormalidadeTipoQueryOneDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
