// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kit_drop_down_search_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KitDropDownSearchResponseDTO _$KitDropDownSearchResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _KitDropDownSearchResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$KitDropDownSearchResponseDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  String get codBarra => throw _privateConstructorUsedError;
  set codBarra(String value) => throw _privateConstructorUsedError;
  String? get nomeDescritor => throw _privateConstructorUsedError;
  set nomeDescritor(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KitDropDownSearchResponseDTOCopyWith<KitDropDownSearchResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KitDropDownSearchResponseDTOCopyWith<$Res> {
  factory $KitDropDownSearchResponseDTOCopyWith(
          KitDropDownSearchResponseDTO value,
          $Res Function(KitDropDownSearchResponseDTO) then) =
      _$KitDropDownSearchResponseDTOCopyWithImpl<$Res,
          KitDropDownSearchResponseDTO>;
  @useResult
  $Res call({int cod, String codBarra, String? nomeDescritor});
}

/// @nodoc
class _$KitDropDownSearchResponseDTOCopyWithImpl<$Res,
        $Val extends KitDropDownSearchResponseDTO>
    implements $KitDropDownSearchResponseDTOCopyWith<$Res> {
  _$KitDropDownSearchResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? codBarra = null,
    Object? nomeDescritor = freezed,
  }) {
    return _then(_value.copyWith(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      codBarra: null == codBarra
          ? _value.codBarra
          : codBarra // ignore: cast_nullable_to_non_nullable
              as String,
      nomeDescritor: freezed == nomeDescritor
          ? _value.nomeDescritor
          : nomeDescritor // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KitDropDownSearchResponseDTOImplCopyWith<$Res>
    implements $KitDropDownSearchResponseDTOCopyWith<$Res> {
  factory _$$KitDropDownSearchResponseDTOImplCopyWith(
          _$KitDropDownSearchResponseDTOImpl value,
          $Res Function(_$KitDropDownSearchResponseDTOImpl) then) =
      __$$KitDropDownSearchResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, String codBarra, String? nomeDescritor});
}

/// @nodoc
class __$$KitDropDownSearchResponseDTOImplCopyWithImpl<$Res>
    extends _$KitDropDownSearchResponseDTOCopyWithImpl<$Res,
        _$KitDropDownSearchResponseDTOImpl>
    implements _$$KitDropDownSearchResponseDTOImplCopyWith<$Res> {
  __$$KitDropDownSearchResponseDTOImplCopyWithImpl(
      _$KitDropDownSearchResponseDTOImpl _value,
      $Res Function(_$KitDropDownSearchResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? codBarra = null,
    Object? nomeDescritor = freezed,
  }) {
    return _then(_$KitDropDownSearchResponseDTOImpl(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      codBarra: null == codBarra
          ? _value.codBarra
          : codBarra // ignore: cast_nullable_to_non_nullable
              as String,
      nomeDescritor: freezed == nomeDescritor
          ? _value.nomeDescritor
          : nomeDescritor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KitDropDownSearchResponseDTOImpl extends _KitDropDownSearchResponseDTO
    with DiagnosticableTreeMixin {
  _$KitDropDownSearchResponseDTOImpl(
      {required this.cod, required this.codBarra, this.nomeDescritor})
      : super._();

  factory _$KitDropDownSearchResponseDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$KitDropDownSearchResponseDTOImplFromJson(json);

  @override
  int cod;
  @override
  String codBarra;
  @override
  String? nomeDescritor;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'KitDropDownSearchResponseDTO(cod: $cod, codBarra: $codBarra, nomeDescritor: $nomeDescritor)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'KitDropDownSearchResponseDTO'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('codBarra', codBarra))
      ..add(DiagnosticsProperty('nomeDescritor', nomeDescritor));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KitDropDownSearchResponseDTOImplCopyWith<
          _$KitDropDownSearchResponseDTOImpl>
      get copyWith => __$$KitDropDownSearchResponseDTOImplCopyWithImpl<
          _$KitDropDownSearchResponseDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KitDropDownSearchResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _KitDropDownSearchResponseDTO
    extends KitDropDownSearchResponseDTO {
  factory _KitDropDownSearchResponseDTO(
      {required int cod,
      required String codBarra,
      String? nomeDescritor}) = _$KitDropDownSearchResponseDTOImpl;
  _KitDropDownSearchResponseDTO._() : super._();

  factory _KitDropDownSearchResponseDTO.fromJson(Map<String, dynamic> json) =
      _$KitDropDownSearchResponseDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  String get codBarra;
  set codBarra(String value);
  @override
  String? get nomeDescritor;
  set nomeDescritor(String? value);
  @override
  @JsonKey(ignore: true)
  _$$KitDropDownSearchResponseDTOImplCopyWith<
          _$KitDropDownSearchResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
