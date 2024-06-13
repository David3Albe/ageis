// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anormalidade_remove_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AnormalidadeRemoveDTO _$AnormalidadeRemoveDTOFromJson(
    Map<String, dynamic> json) {
  return _AnormalidadeRemoveDTO.fromJson(json);
}

/// @nodoc
mixin _$AnormalidadeRemoveDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  String get tstamp => throw _privateConstructorUsedError;
  set tstamp(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnormalidadeRemoveDTOCopyWith<AnormalidadeRemoveDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnormalidadeRemoveDTOCopyWith<$Res> {
  factory $AnormalidadeRemoveDTOCopyWith(AnormalidadeRemoveDTO value,
          $Res Function(AnormalidadeRemoveDTO) then) =
      _$AnormalidadeRemoveDTOCopyWithImpl<$Res, AnormalidadeRemoveDTO>;
  @useResult
  $Res call({int cod, String tstamp});
}

/// @nodoc
class _$AnormalidadeRemoveDTOCopyWithImpl<$Res,
        $Val extends AnormalidadeRemoveDTO>
    implements $AnormalidadeRemoveDTOCopyWith<$Res> {
  _$AnormalidadeRemoveDTOCopyWithImpl(this._value, this._then);

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
abstract class _$$AnormalidadeRemoveDTOImplCopyWith<$Res>
    implements $AnormalidadeRemoveDTOCopyWith<$Res> {
  factory _$$AnormalidadeRemoveDTOImplCopyWith(
          _$AnormalidadeRemoveDTOImpl value,
          $Res Function(_$AnormalidadeRemoveDTOImpl) then) =
      __$$AnormalidadeRemoveDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, String tstamp});
}

/// @nodoc
class __$$AnormalidadeRemoveDTOImplCopyWithImpl<$Res>
    extends _$AnormalidadeRemoveDTOCopyWithImpl<$Res,
        _$AnormalidadeRemoveDTOImpl>
    implements _$$AnormalidadeRemoveDTOImplCopyWith<$Res> {
  __$$AnormalidadeRemoveDTOImplCopyWithImpl(_$AnormalidadeRemoveDTOImpl _value,
      $Res Function(_$AnormalidadeRemoveDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? tstamp = null,
  }) {
    return _then(_$AnormalidadeRemoveDTOImpl(
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
class _$AnormalidadeRemoveDTOImpl implements _AnormalidadeRemoveDTO {
  _$AnormalidadeRemoveDTOImpl({required this.cod, required this.tstamp});

  factory _$AnormalidadeRemoveDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnormalidadeRemoveDTOImplFromJson(json);

  @override
  int cod;
  @override
  String tstamp;

  @override
  String toString() {
    return 'AnormalidadeRemoveDTO(cod: $cod, tstamp: $tstamp)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnormalidadeRemoveDTOImplCopyWith<_$AnormalidadeRemoveDTOImpl>
      get copyWith => __$$AnormalidadeRemoveDTOImplCopyWithImpl<
          _$AnormalidadeRemoveDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnormalidadeRemoveDTOImplToJson(
      this,
    );
  }
}

abstract class _AnormalidadeRemoveDTO implements AnormalidadeRemoveDTO {
  factory _AnormalidadeRemoveDTO({required int cod, required String tstamp}) =
      _$AnormalidadeRemoveDTOImpl;

  factory _AnormalidadeRemoveDTO.fromJson(Map<String, dynamic> json) =
      _$AnormalidadeRemoveDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  String get tstamp;
  set tstamp(String value);
  @override
  @JsonKey(ignore: true)
  _$$AnormalidadeRemoveDTOImplCopyWith<_$AnormalidadeRemoveDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
