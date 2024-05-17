// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kit_descritor_drop_down_search_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KitDescritorDropDownSearchDTO _$KitDescritorDropDownSearchDTOFromJson(
    Map<String, dynamic> json) {
  return _KitDescritorDropDownSearchDTO.fromJson(json);
}

/// @nodoc
mixin _$KitDescritorDropDownSearchDTO {
  int get numeroRegistros => throw _privateConstructorUsedError;
  set numeroRegistros(int value) => throw _privateConstructorUsedError;
  String? get termoPesquisa => throw _privateConstructorUsedError;
  set termoPesquisa(String? value) => throw _privateConstructorUsedError;
  bool? get apenasAtivos => throw _privateConstructorUsedError;
  set apenasAtivos(bool? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KitDescritorDropDownSearchDTOCopyWith<KitDescritorDropDownSearchDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KitDescritorDropDownSearchDTOCopyWith<$Res> {
  factory $KitDescritorDropDownSearchDTOCopyWith(
          KitDescritorDropDownSearchDTO value,
          $Res Function(KitDescritorDropDownSearchDTO) then) =
      _$KitDescritorDropDownSearchDTOCopyWithImpl<$Res,
          KitDescritorDropDownSearchDTO>;
  @useResult
  $Res call({int numeroRegistros, String? termoPesquisa, bool? apenasAtivos});
}

/// @nodoc
class _$KitDescritorDropDownSearchDTOCopyWithImpl<$Res,
        $Val extends KitDescritorDropDownSearchDTO>
    implements $KitDescritorDropDownSearchDTOCopyWith<$Res> {
  _$KitDescritorDropDownSearchDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numeroRegistros = null,
    Object? termoPesquisa = freezed,
    Object? apenasAtivos = freezed,
  }) {
    return _then(_value.copyWith(
      numeroRegistros: null == numeroRegistros
          ? _value.numeroRegistros
          : numeroRegistros // ignore: cast_nullable_to_non_nullable
              as int,
      termoPesquisa: freezed == termoPesquisa
          ? _value.termoPesquisa
          : termoPesquisa // ignore: cast_nullable_to_non_nullable
              as String?,
      apenasAtivos: freezed == apenasAtivos
          ? _value.apenasAtivos
          : apenasAtivos // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KitDescritorDropDownSearchDTOImplCopyWith<$Res>
    implements $KitDescritorDropDownSearchDTOCopyWith<$Res> {
  factory _$$KitDescritorDropDownSearchDTOImplCopyWith(
          _$KitDescritorDropDownSearchDTOImpl value,
          $Res Function(_$KitDescritorDropDownSearchDTOImpl) then) =
      __$$KitDescritorDropDownSearchDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int numeroRegistros, String? termoPesquisa, bool? apenasAtivos});
}

/// @nodoc
class __$$KitDescritorDropDownSearchDTOImplCopyWithImpl<$Res>
    extends _$KitDescritorDropDownSearchDTOCopyWithImpl<$Res,
        _$KitDescritorDropDownSearchDTOImpl>
    implements _$$KitDescritorDropDownSearchDTOImplCopyWith<$Res> {
  __$$KitDescritorDropDownSearchDTOImplCopyWithImpl(
      _$KitDescritorDropDownSearchDTOImpl _value,
      $Res Function(_$KitDescritorDropDownSearchDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? numeroRegistros = null,
    Object? termoPesquisa = freezed,
    Object? apenasAtivos = freezed,
  }) {
    return _then(_$KitDescritorDropDownSearchDTOImpl(
      numeroRegistros: null == numeroRegistros
          ? _value.numeroRegistros
          : numeroRegistros // ignore: cast_nullable_to_non_nullable
              as int,
      termoPesquisa: freezed == termoPesquisa
          ? _value.termoPesquisa
          : termoPesquisa // ignore: cast_nullable_to_non_nullable
              as String?,
      apenasAtivos: freezed == apenasAtivos
          ? _value.apenasAtivos
          : apenasAtivos // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KitDescritorDropDownSearchDTOImpl
    implements _KitDescritorDropDownSearchDTO {
  _$KitDescritorDropDownSearchDTOImpl(
      {required this.numeroRegistros, this.termoPesquisa, this.apenasAtivos});

  factory _$KitDescritorDropDownSearchDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$KitDescritorDropDownSearchDTOImplFromJson(json);

  @override
  int numeroRegistros;
  @override
  String? termoPesquisa;
  @override
  bool? apenasAtivos;

  @override
  String toString() {
    return 'KitDescritorDropDownSearchDTO(numeroRegistros: $numeroRegistros, termoPesquisa: $termoPesquisa, apenasAtivos: $apenasAtivos)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KitDescritorDropDownSearchDTOImplCopyWith<
          _$KitDescritorDropDownSearchDTOImpl>
      get copyWith => __$$KitDescritorDropDownSearchDTOImplCopyWithImpl<
          _$KitDescritorDropDownSearchDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KitDescritorDropDownSearchDTOImplToJson(
      this,
    );
  }
}

abstract class _KitDescritorDropDownSearchDTO
    implements KitDescritorDropDownSearchDTO {
  factory _KitDescritorDropDownSearchDTO(
      {required int numeroRegistros,
      String? termoPesquisa,
      bool? apenasAtivos}) = _$KitDescritorDropDownSearchDTOImpl;

  factory _KitDescritorDropDownSearchDTO.fromJson(Map<String, dynamic> json) =
      _$KitDescritorDropDownSearchDTOImpl.fromJson;

  @override
  int get numeroRegistros;
  set numeroRegistros(int value);
  @override
  String? get termoPesquisa;
  set termoPesquisa(String? value);
  @override
  bool? get apenasAtivos;
  set apenasAtivos(bool? value);
  @override
  @JsonKey(ignore: true)
  _$$KitDescritorDropDownSearchDTOImplCopyWith<
          _$KitDescritorDropDownSearchDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
