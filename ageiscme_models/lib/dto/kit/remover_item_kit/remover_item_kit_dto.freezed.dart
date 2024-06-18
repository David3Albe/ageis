// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remover_item_kit_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RemoverItemKitDTO _$RemoverItemKitDTOFromJson(Map<String, dynamic> json) {
  return _RemoverItemKitDTO.fromJson(json);
}

/// @nodoc
mixin _$RemoverItemKitDTO {
  int get codKit => throw _privateConstructorUsedError;
  set codKit(int value) => throw _privateConstructorUsedError;
  String? get codBarraItem => throw _privateConstructorUsedError;
  set codBarraItem(String? value) => throw _privateConstructorUsedError;
  int? get codMotivo => throw _privateConstructorUsedError;
  set codMotivo(int? value) => throw _privateConstructorUsedError;
  int? get codUsuario => throw _privateConstructorUsedError;
  set codUsuario(int? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RemoverItemKitDTOCopyWith<RemoverItemKitDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoverItemKitDTOCopyWith<$Res> {
  factory $RemoverItemKitDTOCopyWith(
          RemoverItemKitDTO value, $Res Function(RemoverItemKitDTO) then) =
      _$RemoverItemKitDTOCopyWithImpl<$Res, RemoverItemKitDTO>;
  @useResult
  $Res call(
      {int codKit, String? codBarraItem, int? codMotivo, int? codUsuario});
}

/// @nodoc
class _$RemoverItemKitDTOCopyWithImpl<$Res, $Val extends RemoverItemKitDTO>
    implements $RemoverItemKitDTOCopyWith<$Res> {
  _$RemoverItemKitDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codKit = null,
    Object? codBarraItem = freezed,
    Object? codMotivo = freezed,
    Object? codUsuario = freezed,
  }) {
    return _then(_value.copyWith(
      codKit: null == codKit
          ? _value.codKit
          : codKit // ignore: cast_nullable_to_non_nullable
              as int,
      codBarraItem: freezed == codBarraItem
          ? _value.codBarraItem
          : codBarraItem // ignore: cast_nullable_to_non_nullable
              as String?,
      codMotivo: freezed == codMotivo
          ? _value.codMotivo
          : codMotivo // ignore: cast_nullable_to_non_nullable
              as int?,
      codUsuario: freezed == codUsuario
          ? _value.codUsuario
          : codUsuario // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RemoverItemKitDTOImplCopyWith<$Res>
    implements $RemoverItemKitDTOCopyWith<$Res> {
  factory _$$RemoverItemKitDTOImplCopyWith(_$RemoverItemKitDTOImpl value,
          $Res Function(_$RemoverItemKitDTOImpl) then) =
      __$$RemoverItemKitDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int codKit, String? codBarraItem, int? codMotivo, int? codUsuario});
}

/// @nodoc
class __$$RemoverItemKitDTOImplCopyWithImpl<$Res>
    extends _$RemoverItemKitDTOCopyWithImpl<$Res, _$RemoverItemKitDTOImpl>
    implements _$$RemoverItemKitDTOImplCopyWith<$Res> {
  __$$RemoverItemKitDTOImplCopyWithImpl(_$RemoverItemKitDTOImpl _value,
      $Res Function(_$RemoverItemKitDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codKit = null,
    Object? codBarraItem = freezed,
    Object? codMotivo = freezed,
    Object? codUsuario = freezed,
  }) {
    return _then(_$RemoverItemKitDTOImpl(
      codKit: null == codKit
          ? _value.codKit
          : codKit // ignore: cast_nullable_to_non_nullable
              as int,
      codBarraItem: freezed == codBarraItem
          ? _value.codBarraItem
          : codBarraItem // ignore: cast_nullable_to_non_nullable
              as String?,
      codMotivo: freezed == codMotivo
          ? _value.codMotivo
          : codMotivo // ignore: cast_nullable_to_non_nullable
              as int?,
      codUsuario: freezed == codUsuario
          ? _value.codUsuario
          : codUsuario // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RemoverItemKitDTOImpl implements _RemoverItemKitDTO {
  _$RemoverItemKitDTOImpl(
      {required this.codKit,
      this.codBarraItem,
      this.codMotivo,
      this.codUsuario});

  factory _$RemoverItemKitDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$RemoverItemKitDTOImplFromJson(json);

  @override
  int codKit;
  @override
  String? codBarraItem;
  @override
  int? codMotivo;
  @override
  int? codUsuario;

  @override
  String toString() {
    return 'RemoverItemKitDTO(codKit: $codKit, codBarraItem: $codBarraItem, codMotivo: $codMotivo, codUsuario: $codUsuario)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoverItemKitDTOImplCopyWith<_$RemoverItemKitDTOImpl> get copyWith =>
      __$$RemoverItemKitDTOImplCopyWithImpl<_$RemoverItemKitDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RemoverItemKitDTOImplToJson(
      this,
    );
  }
}

abstract class _RemoverItemKitDTO implements RemoverItemKitDTO {
  factory _RemoverItemKitDTO(
      {required int codKit,
      String? codBarraItem,
      int? codMotivo,
      int? codUsuario}) = _$RemoverItemKitDTOImpl;

  factory _RemoverItemKitDTO.fromJson(Map<String, dynamic> json) =
      _$RemoverItemKitDTOImpl.fromJson;

  @override
  int get codKit;
  set codKit(int value);
  @override
  String? get codBarraItem;
  set codBarraItem(String? value);
  @override
  int? get codMotivo;
  set codMotivo(int? value);
  @override
  int? get codUsuario;
  set codUsuario(int? value);
  @override
  @JsonKey(ignore: true)
  _$$RemoverItemKitDTOImplCopyWith<_$RemoverItemKitDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
