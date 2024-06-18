// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'equipamento_drop_down_search_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EquipamentoDropDownSearchDTO _$EquipamentoDropDownSearchDTOFromJson(
    Map<String, dynamic> json) {
  return _EquipamentoDropDownSearchDTO.fromJson(json);
}

/// @nodoc
mixin _$EquipamentoDropDownSearchDTO {
  int get numeroRegistros => throw _privateConstructorUsedError;
  set numeroRegistros(int value) => throw _privateConstructorUsedError;
  String? get search => throw _privateConstructorUsedError;
  set search(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EquipamentoDropDownSearchDTOCopyWith<EquipamentoDropDownSearchDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EquipamentoDropDownSearchDTOCopyWith<$Res> {
  factory $EquipamentoDropDownSearchDTOCopyWith(
          EquipamentoDropDownSearchDTO value,
          $Res Function(EquipamentoDropDownSearchDTO) then) =
      _$EquipamentoDropDownSearchDTOCopyWithImpl<$Res,
          EquipamentoDropDownSearchDTO>;
  @useResult
  $Res call({int numeroRegistros, String? search});
}

/// @nodoc
class _$EquipamentoDropDownSearchDTOCopyWithImpl<$Res,
        $Val extends EquipamentoDropDownSearchDTO>
    implements $EquipamentoDropDownSearchDTOCopyWith<$Res> {
  _$EquipamentoDropDownSearchDTOCopyWithImpl(this._value, this._then);

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
abstract class _$$EquipamentoDropDownSearchDTOImplCopyWith<$Res>
    implements $EquipamentoDropDownSearchDTOCopyWith<$Res> {
  factory _$$EquipamentoDropDownSearchDTOImplCopyWith(
          _$EquipamentoDropDownSearchDTOImpl value,
          $Res Function(_$EquipamentoDropDownSearchDTOImpl) then) =
      __$$EquipamentoDropDownSearchDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int numeroRegistros, String? search});
}

/// @nodoc
class __$$EquipamentoDropDownSearchDTOImplCopyWithImpl<$Res>
    extends _$EquipamentoDropDownSearchDTOCopyWithImpl<$Res,
        _$EquipamentoDropDownSearchDTOImpl>
    implements _$$EquipamentoDropDownSearchDTOImplCopyWith<$Res> {
  __$$EquipamentoDropDownSearchDTOImplCopyWithImpl(
      _$EquipamentoDropDownSearchDTOImpl _value,
      $Res Function(_$EquipamentoDropDownSearchDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numeroRegistros = null,
    Object? search = freezed,
  }) {
    return _then(_$EquipamentoDropDownSearchDTOImpl(
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
class _$EquipamentoDropDownSearchDTOImpl
    implements _EquipamentoDropDownSearchDTO {
  _$EquipamentoDropDownSearchDTOImpl(
      {required this.numeroRegistros, this.search});

  factory _$EquipamentoDropDownSearchDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$EquipamentoDropDownSearchDTOImplFromJson(json);

  @override
  int numeroRegistros;
  @override
  String? search;

  @override
  String toString() {
    return 'EquipamentoDropDownSearchDTO(numeroRegistros: $numeroRegistros, search: $search)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EquipamentoDropDownSearchDTOImplCopyWith<
          _$EquipamentoDropDownSearchDTOImpl>
      get copyWith => __$$EquipamentoDropDownSearchDTOImplCopyWithImpl<
          _$EquipamentoDropDownSearchDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EquipamentoDropDownSearchDTOImplToJson(
      this,
    );
  }
}

abstract class _EquipamentoDropDownSearchDTO
    implements EquipamentoDropDownSearchDTO {
  factory _EquipamentoDropDownSearchDTO(
      {required int numeroRegistros,
      String? search}) = _$EquipamentoDropDownSearchDTOImpl;

  factory _EquipamentoDropDownSearchDTO.fromJson(Map<String, dynamic> json) =
      _$EquipamentoDropDownSearchDTOImpl.fromJson;

  @override
  int get numeroRegistros;
  set numeroRegistros(int value);
  @override
  String? get search;
  set search(String? value);
  @override
  @JsonKey(ignore: true)
  _$$EquipamentoDropDownSearchDTOImplCopyWith<
          _$EquipamentoDropDownSearchDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
