// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kit_search_descritor_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KitSearchDescritorResponseDTO _$KitSearchDescritorResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _KitSearchDescritorResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$KitSearchDescritorResponseDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  String get descricao => throw _privateConstructorUsedError;
  set descricao(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KitSearchDescritorResponseDTOCopyWith<KitSearchDescritorResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KitSearchDescritorResponseDTOCopyWith<$Res> {
  factory $KitSearchDescritorResponseDTOCopyWith(
          KitSearchDescritorResponseDTO value,
          $Res Function(KitSearchDescritorResponseDTO) then) =
      _$KitSearchDescritorResponseDTOCopyWithImpl<$Res,
          KitSearchDescritorResponseDTO>;
  @useResult
  $Res call({int cod, String descricao});
}

/// @nodoc
class _$KitSearchDescritorResponseDTOCopyWithImpl<$Res,
        $Val extends KitSearchDescritorResponseDTO>
    implements $KitSearchDescritorResponseDTOCopyWith<$Res> {
  _$KitSearchDescritorResponseDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? descricao = null,
  }) {
    return _then(_value.copyWith(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      descricao: null == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KitSearchDescritorResponseDTOImplCopyWith<$Res>
    implements $KitSearchDescritorResponseDTOCopyWith<$Res> {
  factory _$$KitSearchDescritorResponseDTOImplCopyWith(
          _$KitSearchDescritorResponseDTOImpl value,
          $Res Function(_$KitSearchDescritorResponseDTOImpl) then) =
      __$$KitSearchDescritorResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, String descricao});
}

/// @nodoc
class __$$KitSearchDescritorResponseDTOImplCopyWithImpl<$Res>
    extends _$KitSearchDescritorResponseDTOCopyWithImpl<$Res,
        _$KitSearchDescritorResponseDTOImpl>
    implements _$$KitSearchDescritorResponseDTOImplCopyWith<$Res> {
  __$$KitSearchDescritorResponseDTOImplCopyWithImpl(
      _$KitSearchDescritorResponseDTOImpl _value,
      $Res Function(_$KitSearchDescritorResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? descricao = null,
  }) {
    return _then(_$KitSearchDescritorResponseDTOImpl(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
      descricao: null == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KitSearchDescritorResponseDTOImpl
    with DiagnosticableTreeMixin
    implements _KitSearchDescritorResponseDTO {
  _$KitSearchDescritorResponseDTOImpl(
      {required this.cod, required this.descricao});

  factory _$KitSearchDescritorResponseDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$KitSearchDescritorResponseDTOImplFromJson(json);

  @override
  int cod;
  @override
  String descricao;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'KitSearchDescritorResponseDTO(cod: $cod, descricao: $descricao)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'KitSearchDescritorResponseDTO'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('descricao', descricao));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KitSearchDescritorResponseDTOImplCopyWith<
          _$KitSearchDescritorResponseDTOImpl>
      get copyWith => __$$KitSearchDescritorResponseDTOImplCopyWithImpl<
          _$KitSearchDescritorResponseDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KitSearchDescritorResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _KitSearchDescritorResponseDTO
    implements KitSearchDescritorResponseDTO {
  factory _KitSearchDescritorResponseDTO(
      {required int cod,
      required String descricao}) = _$KitSearchDescritorResponseDTOImpl;

  factory _KitSearchDescritorResponseDTO.fromJson(Map<String, dynamic> json) =
      _$KitSearchDescritorResponseDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  String get descricao;
  set descricao(String value);
  @override
  @JsonKey(ignore: true)
  _$$KitSearchDescritorResponseDTOImplCopyWith<
          _$KitSearchDescritorResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
