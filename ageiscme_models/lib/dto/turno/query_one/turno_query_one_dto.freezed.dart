// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'turno_query_one_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TurnoQueryOneDTO _$TurnoQueryOneDTOFromJson(Map<String, dynamic> json) {
  return _TurnoQueryOneDTO.fromJson(json);
}

/// @nodoc
mixin _$TurnoQueryOneDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TurnoQueryOneDTOCopyWith<TurnoQueryOneDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TurnoQueryOneDTOCopyWith<$Res> {
  factory $TurnoQueryOneDTOCopyWith(
          TurnoQueryOneDTO value, $Res Function(TurnoQueryOneDTO) then) =
      _$TurnoQueryOneDTOCopyWithImpl<$Res, TurnoQueryOneDTO>;
  @useResult
  $Res call({int cod});
}

/// @nodoc
class _$TurnoQueryOneDTOCopyWithImpl<$Res, $Val extends TurnoQueryOneDTO>
    implements $TurnoQueryOneDTOCopyWith<$Res> {
  _$TurnoQueryOneDTOCopyWithImpl(this._value, this._then);

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
abstract class _$$TurnoQueryOneDTOImplCopyWith<$Res>
    implements $TurnoQueryOneDTOCopyWith<$Res> {
  factory _$$TurnoQueryOneDTOImplCopyWith(_$TurnoQueryOneDTOImpl value,
          $Res Function(_$TurnoQueryOneDTOImpl) then) =
      __$$TurnoQueryOneDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod});
}

/// @nodoc
class __$$TurnoQueryOneDTOImplCopyWithImpl<$Res>
    extends _$TurnoQueryOneDTOCopyWithImpl<$Res, _$TurnoQueryOneDTOImpl>
    implements _$$TurnoQueryOneDTOImplCopyWith<$Res> {
  __$$TurnoQueryOneDTOImplCopyWithImpl(_$TurnoQueryOneDTOImpl _value,
      $Res Function(_$TurnoQueryOneDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
  }) {
    return _then(_$TurnoQueryOneDTOImpl(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TurnoQueryOneDTOImpl implements _TurnoQueryOneDTO {
  _$TurnoQueryOneDTOImpl({required this.cod});

  factory _$TurnoQueryOneDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$TurnoQueryOneDTOImplFromJson(json);

  @override
  int cod;

  @override
  String toString() {
    return 'TurnoQueryOneDTO(cod: $cod)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TurnoQueryOneDTOImplCopyWith<_$TurnoQueryOneDTOImpl> get copyWith =>
      __$$TurnoQueryOneDTOImplCopyWithImpl<_$TurnoQueryOneDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TurnoQueryOneDTOImplToJson(
      this,
    );
  }
}

abstract class _TurnoQueryOneDTO implements TurnoQueryOneDTO {
  factory _TurnoQueryOneDTO({required int cod}) = _$TurnoQueryOneDTOImpl;

  factory _TurnoQueryOneDTO.fromJson(Map<String, dynamic> json) =
      _$TurnoQueryOneDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  @JsonKey(ignore: true)
  _$$TurnoQueryOneDTOImplCopyWith<_$TurnoQueryOneDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
