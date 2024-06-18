// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'turno_remove_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TurnoRemoveDTO _$TurnoRemoveDTOFromJson(Map<String, dynamic> json) {
  return _TurnoRemoveDTO.fromJson(json);
}

/// @nodoc
mixin _$TurnoRemoveDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  String get tstamp => throw _privateConstructorUsedError;
  set tstamp(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TurnoRemoveDTOCopyWith<TurnoRemoveDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TurnoRemoveDTOCopyWith<$Res> {
  factory $TurnoRemoveDTOCopyWith(
          TurnoRemoveDTO value, $Res Function(TurnoRemoveDTO) then) =
      _$TurnoRemoveDTOCopyWithImpl<$Res, TurnoRemoveDTO>;
  @useResult
  $Res call({int cod, String tstamp});
}

/// @nodoc
class _$TurnoRemoveDTOCopyWithImpl<$Res, $Val extends TurnoRemoveDTO>
    implements $TurnoRemoveDTOCopyWith<$Res> {
  _$TurnoRemoveDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? tstamp = null,
  }) {
    return _then(_value.copyWith(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      tstamp: null == tstamp
          ? _value.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TurnoRemoveDTOImplCopyWith<$Res>
    implements $TurnoRemoveDTOCopyWith<$Res> {
  factory _$$TurnoRemoveDTOImplCopyWith(_$TurnoRemoveDTOImpl value,
          $Res Function(_$TurnoRemoveDTOImpl) then) =
      __$$TurnoRemoveDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, String tstamp});
}

/// @nodoc
class __$$TurnoRemoveDTOImplCopyWithImpl<$Res>
    extends _$TurnoRemoveDTOCopyWithImpl<$Res, _$TurnoRemoveDTOImpl>
    implements _$$TurnoRemoveDTOImplCopyWith<$Res> {
  __$$TurnoRemoveDTOImplCopyWithImpl(
      _$TurnoRemoveDTOImpl _value, $Res Function(_$TurnoRemoveDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? tstamp = null,
  }) {
    return _then(_$TurnoRemoveDTOImpl(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      tstamp: null == tstamp
          ? _value.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TurnoRemoveDTOImpl implements _TurnoRemoveDTO {
  _$TurnoRemoveDTOImpl({required this.cod, required this.tstamp});

  factory _$TurnoRemoveDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$TurnoRemoveDTOImplFromJson(json);

  @override
  int cod;
  @override
  String tstamp;

  @override
  String toString() {
    return 'TurnoRemoveDTO(cod: $cod, tstamp: $tstamp)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TurnoRemoveDTOImplCopyWith<_$TurnoRemoveDTOImpl> get copyWith =>
      __$$TurnoRemoveDTOImplCopyWithImpl<_$TurnoRemoveDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TurnoRemoveDTOImplToJson(
      this,
    );
  }
}

abstract class _TurnoRemoveDTO implements TurnoRemoveDTO {
  factory _TurnoRemoveDTO({required int cod, required String tstamp}) =
      _$TurnoRemoveDTOImpl;

  factory _TurnoRemoveDTO.fromJson(Map<String, dynamic> json) =
      _$TurnoRemoveDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  String get tstamp;
  set tstamp(String value);
  @override
  @JsonKey(ignore: true)
  _$$TurnoRemoveDTOImplCopyWith<_$TurnoRemoveDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
