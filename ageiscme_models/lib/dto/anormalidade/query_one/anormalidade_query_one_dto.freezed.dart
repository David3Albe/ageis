// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anormalidade_query_one_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AnormalidadeQueryOneDTO _$AnormalidadeQueryOneDTOFromJson(
    Map<String, dynamic> json) {
  return _AnormalidadeQueryOneDTO.fromJson(json);
}

/// @nodoc
mixin _$AnormalidadeQueryOneDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnormalidadeQueryOneDTOCopyWith<AnormalidadeQueryOneDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnormalidadeQueryOneDTOCopyWith<$Res> {
  factory $AnormalidadeQueryOneDTOCopyWith(AnormalidadeQueryOneDTO value,
          $Res Function(AnormalidadeQueryOneDTO) then) =
      _$AnormalidadeQueryOneDTOCopyWithImpl<$Res, AnormalidadeQueryOneDTO>;
  @useResult
  $Res call({int cod});
}

/// @nodoc
class _$AnormalidadeQueryOneDTOCopyWithImpl<$Res,
        $Val extends AnormalidadeQueryOneDTO>
    implements $AnormalidadeQueryOneDTOCopyWith<$Res> {
  _$AnormalidadeQueryOneDTOCopyWithImpl(this._value, this._then);

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
abstract class _$$AnormalidadeQueryOneDTOImplCopyWith<$Res>
    implements $AnormalidadeQueryOneDTOCopyWith<$Res> {
  factory _$$AnormalidadeQueryOneDTOImplCopyWith(
          _$AnormalidadeQueryOneDTOImpl value,
          $Res Function(_$AnormalidadeQueryOneDTOImpl) then) =
      __$$AnormalidadeQueryOneDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod});
}

/// @nodoc
class __$$AnormalidadeQueryOneDTOImplCopyWithImpl<$Res>
    extends _$AnormalidadeQueryOneDTOCopyWithImpl<$Res,
        _$AnormalidadeQueryOneDTOImpl>
    implements _$$AnormalidadeQueryOneDTOImplCopyWith<$Res> {
  __$$AnormalidadeQueryOneDTOImplCopyWithImpl(
      _$AnormalidadeQueryOneDTOImpl _value,
      $Res Function(_$AnormalidadeQueryOneDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
  }) {
    return _then(_$AnormalidadeQueryOneDTOImpl(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnormalidadeQueryOneDTOImpl implements _AnormalidadeQueryOneDTO {
  _$AnormalidadeQueryOneDTOImpl({required this.cod});

  factory _$AnormalidadeQueryOneDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnormalidadeQueryOneDTOImplFromJson(json);

  @override
  int cod;

  @override
  String toString() {
    return 'AnormalidadeQueryOneDTO(cod: $cod)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnormalidadeQueryOneDTOImplCopyWith<_$AnormalidadeQueryOneDTOImpl>
      get copyWith => __$$AnormalidadeQueryOneDTOImplCopyWithImpl<
          _$AnormalidadeQueryOneDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnormalidadeQueryOneDTOImplToJson(
      this,
    );
  }
}

abstract class _AnormalidadeQueryOneDTO implements AnormalidadeQueryOneDTO {
  factory _AnormalidadeQueryOneDTO({required int cod}) =
      _$AnormalidadeQueryOneDTOImpl;

  factory _AnormalidadeQueryOneDTO.fromJson(Map<String, dynamic> json) =
      _$AnormalidadeQueryOneDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  @JsonKey(ignore: true)
  _$$AnormalidadeQueryOneDTOImplCopyWith<_$AnormalidadeQueryOneDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
