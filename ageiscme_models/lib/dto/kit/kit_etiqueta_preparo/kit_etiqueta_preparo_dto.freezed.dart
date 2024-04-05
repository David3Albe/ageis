// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kit_etiqueta_preparo_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KitEtiquetaPreparoDTO _$KitEtiquetaPreparoDTOFromJson(
    Map<String, dynamic> json) {
  return _KitEtiquetaPreparoDTO.fromJson(json);
}

/// @nodoc
mixin _$KitEtiquetaPreparoDTO {
  int get codKit => throw _privateConstructorUsedError;
  set codKit(int value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KitEtiquetaPreparoDTOCopyWith<KitEtiquetaPreparoDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KitEtiquetaPreparoDTOCopyWith<$Res> {
  factory $KitEtiquetaPreparoDTOCopyWith(KitEtiquetaPreparoDTO value,
          $Res Function(KitEtiquetaPreparoDTO) then) =
      _$KitEtiquetaPreparoDTOCopyWithImpl<$Res, KitEtiquetaPreparoDTO>;
  @useResult
  $Res call({int codKit});
}

/// @nodoc
class _$KitEtiquetaPreparoDTOCopyWithImpl<$Res,
        $Val extends KitEtiquetaPreparoDTO>
    implements $KitEtiquetaPreparoDTOCopyWith<$Res> {
  _$KitEtiquetaPreparoDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codKit = null,
  }) {
    return _then(_value.copyWith(
      codKit: null == codKit
          ? _value.codKit
          : codKit // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KitEtiquetaPreparoDTOImplCopyWith<$Res>
    implements $KitEtiquetaPreparoDTOCopyWith<$Res> {
  factory _$$KitEtiquetaPreparoDTOImplCopyWith(
          _$KitEtiquetaPreparoDTOImpl value,
          $Res Function(_$KitEtiquetaPreparoDTOImpl) then) =
      __$$KitEtiquetaPreparoDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int codKit});
}

/// @nodoc
class __$$KitEtiquetaPreparoDTOImplCopyWithImpl<$Res>
    extends _$KitEtiquetaPreparoDTOCopyWithImpl<$Res,
        _$KitEtiquetaPreparoDTOImpl>
    implements _$$KitEtiquetaPreparoDTOImplCopyWith<$Res> {
  __$$KitEtiquetaPreparoDTOImplCopyWithImpl(_$KitEtiquetaPreparoDTOImpl _value,
      $Res Function(_$KitEtiquetaPreparoDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codKit = null,
  }) {
    return _then(_$KitEtiquetaPreparoDTOImpl(
      codKit: null == codKit
          ? _value.codKit
          : codKit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KitEtiquetaPreparoDTOImpl implements _KitEtiquetaPreparoDTO {
  _$KitEtiquetaPreparoDTOImpl({required this.codKit});

  factory _$KitEtiquetaPreparoDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$KitEtiquetaPreparoDTOImplFromJson(json);

  @override
  int codKit;

  @override
  String toString() {
    return 'KitEtiquetaPreparoDTO(codKit: $codKit)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KitEtiquetaPreparoDTOImplCopyWith<_$KitEtiquetaPreparoDTOImpl>
      get copyWith => __$$KitEtiquetaPreparoDTOImplCopyWithImpl<
          _$KitEtiquetaPreparoDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KitEtiquetaPreparoDTOImplToJson(
      this,
    );
  }
}

abstract class _KitEtiquetaPreparoDTO implements KitEtiquetaPreparoDTO {
  factory _KitEtiquetaPreparoDTO({required int codKit}) =
      _$KitEtiquetaPreparoDTOImpl;

  factory _KitEtiquetaPreparoDTO.fromJson(Map<String, dynamic> json) =
      _$KitEtiquetaPreparoDTOImpl.fromJson;

  @override
  int get codKit;
  set codKit(int value);
  @override
  @JsonKey(ignore: true)
  _$$KitEtiquetaPreparoDTOImplCopyWith<_$KitEtiquetaPreparoDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
