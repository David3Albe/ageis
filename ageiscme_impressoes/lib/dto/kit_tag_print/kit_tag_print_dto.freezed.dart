// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kit_tag_print_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

KitTagPrintDTO _$KitTagPrintDTOFromJson(Map<String, dynamic> json) {
  return _KitTagPrintDTO.fromJson(json);
}

/// @nodoc
mixin _$KitTagPrintDTO {
  String get codBarra => throw _privateConstructorUsedError;
  set codBarra(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KitTagPrintDTOCopyWith<KitTagPrintDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KitTagPrintDTOCopyWith<$Res> {
  factory $KitTagPrintDTOCopyWith(
          KitTagPrintDTO value, $Res Function(KitTagPrintDTO) then) =
      _$KitTagPrintDTOCopyWithImpl<$Res, KitTagPrintDTO>;
  @useResult
  $Res call({String codBarra});
}

/// @nodoc
class _$KitTagPrintDTOCopyWithImpl<$Res, $Val extends KitTagPrintDTO>
    implements $KitTagPrintDTOCopyWith<$Res> {
  _$KitTagPrintDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codBarra = null,
  }) {
    return _then(_value.copyWith(
      codBarra: null == codBarra
          ? _value.codBarra
          : codBarra // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KitTagPrintDTOImplCopyWith<$Res>
    implements $KitTagPrintDTOCopyWith<$Res> {
  factory _$$KitTagPrintDTOImplCopyWith(_$KitTagPrintDTOImpl value,
          $Res Function(_$KitTagPrintDTOImpl) then) =
      __$$KitTagPrintDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String codBarra});
}

/// @nodoc
class __$$KitTagPrintDTOImplCopyWithImpl<$Res>
    extends _$KitTagPrintDTOCopyWithImpl<$Res, _$KitTagPrintDTOImpl>
    implements _$$KitTagPrintDTOImplCopyWith<$Res> {
  __$$KitTagPrintDTOImplCopyWithImpl(
      _$KitTagPrintDTOImpl _value, $Res Function(_$KitTagPrintDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codBarra = null,
  }) {
    return _then(_$KitTagPrintDTOImpl(
      codBarra: null == codBarra
          ? _value.codBarra
          : codBarra // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KitTagPrintDTOImpl
    with DiagnosticableTreeMixin
    implements _KitTagPrintDTO {
  _$KitTagPrintDTOImpl({required this.codBarra});

  factory _$KitTagPrintDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$KitTagPrintDTOImplFromJson(json);

  @override
  String codBarra;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'KitTagPrintDTO(codBarra: $codBarra)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'KitTagPrintDTO'))
      ..add(DiagnosticsProperty('codBarra', codBarra));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KitTagPrintDTOImplCopyWith<_$KitTagPrintDTOImpl> get copyWith =>
      __$$KitTagPrintDTOImplCopyWithImpl<_$KitTagPrintDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KitTagPrintDTOImplToJson(
      this,
    );
  }
}

abstract class _KitTagPrintDTO implements KitTagPrintDTO {
  factory _KitTagPrintDTO({required String codBarra}) = _$KitTagPrintDTOImpl;

  factory _KitTagPrintDTO.fromJson(Map<String, dynamic> json) =
      _$KitTagPrintDTOImpl.fromJson;

  @override
  String get codBarra;
  set codBarra(String value);
  @override
  @JsonKey(ignore: true)
  _$$KitTagPrintDTOImplCopyWith<_$KitTagPrintDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
