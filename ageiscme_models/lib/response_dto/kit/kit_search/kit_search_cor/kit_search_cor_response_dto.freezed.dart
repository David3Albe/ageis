// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kit_search_cor_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

KitSearchCorResponseDTO _$KitSearchCorResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _KitSearchCorResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$KitSearchCorResponseDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;
  String get descricao => throw _privateConstructorUsedError;
  set descricao(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KitSearchCorResponseDTOCopyWith<KitSearchCorResponseDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KitSearchCorResponseDTOCopyWith<$Res> {
  factory $KitSearchCorResponseDTOCopyWith(KitSearchCorResponseDTO value,
          $Res Function(KitSearchCorResponseDTO) then) =
      _$KitSearchCorResponseDTOCopyWithImpl<$Res, KitSearchCorResponseDTO>;
  @useResult
  $Res call({int cod, String descricao});
}

/// @nodoc
class _$KitSearchCorResponseDTOCopyWithImpl<$Res,
        $Val extends KitSearchCorResponseDTO>
    implements $KitSearchCorResponseDTOCopyWith<$Res> {
  _$KitSearchCorResponseDTOCopyWithImpl(this._value, this._then);

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
abstract class _$$KitSearchCorResponseDTOImplCopyWith<$Res>
    implements $KitSearchCorResponseDTOCopyWith<$Res> {
  factory _$$KitSearchCorResponseDTOImplCopyWith(
          _$KitSearchCorResponseDTOImpl value,
          $Res Function(_$KitSearchCorResponseDTOImpl) then) =
      __$$KitSearchCorResponseDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod, String descricao});
}

/// @nodoc
class __$$KitSearchCorResponseDTOImplCopyWithImpl<$Res>
    extends _$KitSearchCorResponseDTOCopyWithImpl<$Res,
        _$KitSearchCorResponseDTOImpl>
    implements _$$KitSearchCorResponseDTOImplCopyWith<$Res> {
  __$$KitSearchCorResponseDTOImplCopyWithImpl(
      _$KitSearchCorResponseDTOImpl _value,
      $Res Function(_$KitSearchCorResponseDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
    Object? descricao = null,
  }) {
    return _then(_$KitSearchCorResponseDTOImpl(
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
class _$KitSearchCorResponseDTOImpl
    with DiagnosticableTreeMixin
    implements _KitSearchCorResponseDTO {
  _$KitSearchCorResponseDTOImpl({required this.cod, required this.descricao});

  factory _$KitSearchCorResponseDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$KitSearchCorResponseDTOImplFromJson(json);

  @override
  int cod;
  @override
  String descricao;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'KitSearchCorResponseDTO(cod: $cod, descricao: $descricao)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'KitSearchCorResponseDTO'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('descricao', descricao));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KitSearchCorResponseDTOImplCopyWith<_$KitSearchCorResponseDTOImpl>
      get copyWith => __$$KitSearchCorResponseDTOImplCopyWithImpl<
          _$KitSearchCorResponseDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KitSearchCorResponseDTOImplToJson(
      this,
    );
  }
}

abstract class _KitSearchCorResponseDTO implements KitSearchCorResponseDTO {
  factory _KitSearchCorResponseDTO(
      {required int cod,
      required String descricao}) = _$KitSearchCorResponseDTOImpl;

  factory _KitSearchCorResponseDTO.fromJson(Map<String, dynamic> json) =
      _$KitSearchCorResponseDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  String get descricao;
  set descricao(String value);
  @override
  @JsonKey(ignore: true)
  _$$KitSearchCorResponseDTOImplCopyWith<_$KitSearchCorResponseDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
