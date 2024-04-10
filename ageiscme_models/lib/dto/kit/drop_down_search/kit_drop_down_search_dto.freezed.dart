// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kit_drop_down_search_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KitDropDownSearchDTO _$KitDropDownSearchDTOFromJson(Map<String, dynamic> json) {
  return _KitDropDownSearchDTO.fromJson(json);
}

/// @nodoc
mixin _$KitDropDownSearchDTO {
  int get numeroRegistros => throw _privateConstructorUsedError;
  set numeroRegistros(int value) => throw _privateConstructorUsedError;
  String? get search => throw _privateConstructorUsedError;
  set search(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KitDropDownSearchDTOCopyWith<KitDropDownSearchDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KitDropDownSearchDTOCopyWith<$Res> {
  factory $KitDropDownSearchDTOCopyWith(KitDropDownSearchDTO value,
          $Res Function(KitDropDownSearchDTO) then) =
      _$KitDropDownSearchDTOCopyWithImpl<$Res, KitDropDownSearchDTO>;
  @useResult
  $Res call({int numeroRegistros, String? search});
}

/// @nodoc
class _$KitDropDownSearchDTOCopyWithImpl<$Res,
        $Val extends KitDropDownSearchDTO>
    implements $KitDropDownSearchDTOCopyWith<$Res> {
  _$KitDropDownSearchDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numeroRegistros = null,
    Object? search = freezed,
  }) {
    return _then(_value.copyWith(
      numeroRegistros: null == numeroRegistros
          ? _value.numeroRegistros
          : numeroRegistros // ignore: cast_nullable_to_non_nullable
              as int,
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KitDropDownSearchDTOImplCopyWith<$Res>
    implements $KitDropDownSearchDTOCopyWith<$Res> {
  factory _$$KitDropDownSearchDTOImplCopyWith(_$KitDropDownSearchDTOImpl value,
          $Res Function(_$KitDropDownSearchDTOImpl) then) =
      __$$KitDropDownSearchDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int numeroRegistros, String? search});
}

/// @nodoc
class __$$KitDropDownSearchDTOImplCopyWithImpl<$Res>
    extends _$KitDropDownSearchDTOCopyWithImpl<$Res, _$KitDropDownSearchDTOImpl>
    implements _$$KitDropDownSearchDTOImplCopyWith<$Res> {
  __$$KitDropDownSearchDTOImplCopyWithImpl(_$KitDropDownSearchDTOImpl _value,
      $Res Function(_$KitDropDownSearchDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numeroRegistros = null,
    Object? search = freezed,
  }) {
    return _then(_$KitDropDownSearchDTOImpl(
      numeroRegistros: null == numeroRegistros
          ? _value.numeroRegistros
          : numeroRegistros // ignore: cast_nullable_to_non_nullable
              as int,
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KitDropDownSearchDTOImpl implements _KitDropDownSearchDTO {
  _$KitDropDownSearchDTOImpl({required this.numeroRegistros, this.search});

  factory _$KitDropDownSearchDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$KitDropDownSearchDTOImplFromJson(json);

  @override
  int numeroRegistros;
  @override
  String? search;

  @override
  String toString() {
    return 'KitDropDownSearchDTO(numeroRegistros: $numeroRegistros, search: $search)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KitDropDownSearchDTOImplCopyWith<_$KitDropDownSearchDTOImpl>
      get copyWith =>
          __$$KitDropDownSearchDTOImplCopyWithImpl<_$KitDropDownSearchDTOImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KitDropDownSearchDTOImplToJson(
      this,
    );
  }
}

abstract class _KitDropDownSearchDTO implements KitDropDownSearchDTO {
  factory _KitDropDownSearchDTO(
      {required int numeroRegistros,
      String? search}) = _$KitDropDownSearchDTOImpl;

  factory _KitDropDownSearchDTO.fromJson(Map<String, dynamic> json) =
      _$KitDropDownSearchDTOImpl.fromJson;

  @override
  int get numeroRegistros;
  set numeroRegistros(int value);
  @override
  String? get search;
  set search(String? value);
  @override
  @JsonKey(ignore: true)
  _$$KitDropDownSearchDTOImplCopyWith<_$KitDropDownSearchDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
