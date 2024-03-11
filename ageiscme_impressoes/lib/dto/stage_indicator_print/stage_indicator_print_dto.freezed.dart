// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stage_indicator_print_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StageIndicatorPrintDTO _$StageIndicatorPrintDTOFromJson(
    Map<String, dynamic> json) {
  return _StageIndicatorPrintDTO.fromJson(json);
}

/// @nodoc
mixin _$StageIndicatorPrintDTO {
  int get instituitionCod => throw _privateConstructorUsedError;
  set instituitionCod(int value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StageIndicatorPrintDTOCopyWith<StageIndicatorPrintDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StageIndicatorPrintDTOCopyWith<$Res> {
  factory $StageIndicatorPrintDTOCopyWith(StageIndicatorPrintDTO value,
          $Res Function(StageIndicatorPrintDTO) then) =
      _$StageIndicatorPrintDTOCopyWithImpl<$Res, StageIndicatorPrintDTO>;
  @useResult
  $Res call({int instituitionCod});
}

/// @nodoc
class _$StageIndicatorPrintDTOCopyWithImpl<$Res,
        $Val extends StageIndicatorPrintDTO>
    implements $StageIndicatorPrintDTOCopyWith<$Res> {
  _$StageIndicatorPrintDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? instituitionCod = null,
  }) {
    return _then(_value.copyWith(
      instituitionCod: null == instituitionCod
          ? _value.instituitionCod
          : instituitionCod // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StageIndicatorPrintDTOImplCopyWith<$Res>
    implements $StageIndicatorPrintDTOCopyWith<$Res> {
  factory _$$StageIndicatorPrintDTOImplCopyWith(
          _$StageIndicatorPrintDTOImpl value,
          $Res Function(_$StageIndicatorPrintDTOImpl) then) =
      __$$StageIndicatorPrintDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int instituitionCod});
}

/// @nodoc
class __$$StageIndicatorPrintDTOImplCopyWithImpl<$Res>
    extends _$StageIndicatorPrintDTOCopyWithImpl<$Res,
        _$StageIndicatorPrintDTOImpl>
    implements _$$StageIndicatorPrintDTOImplCopyWith<$Res> {
  __$$StageIndicatorPrintDTOImplCopyWithImpl(
      _$StageIndicatorPrintDTOImpl _value,
      $Res Function(_$StageIndicatorPrintDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? instituitionCod = null,
  }) {
    return _then(_$StageIndicatorPrintDTOImpl(
      instituitionCod: null == instituitionCod
          ? _value.instituitionCod
          : instituitionCod // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StageIndicatorPrintDTOImpl
    with DiagnosticableTreeMixin
    implements _StageIndicatorPrintDTO {
  _$StageIndicatorPrintDTOImpl({required this.instituitionCod});

  factory _$StageIndicatorPrintDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$StageIndicatorPrintDTOImplFromJson(json);

  @override
  int instituitionCod;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StageIndicatorPrintDTO(instituitionCod: $instituitionCod)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StageIndicatorPrintDTO'))
      ..add(DiagnosticsProperty('instituitionCod', instituitionCod));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StageIndicatorPrintDTOImplCopyWith<_$StageIndicatorPrintDTOImpl>
      get copyWith => __$$StageIndicatorPrintDTOImplCopyWithImpl<
          _$StageIndicatorPrintDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StageIndicatorPrintDTOImplToJson(
      this,
    );
  }
}

abstract class _StageIndicatorPrintDTO implements StageIndicatorPrintDTO {
  factory _StageIndicatorPrintDTO({required int instituitionCod}) =
      _$StageIndicatorPrintDTOImpl;

  factory _StageIndicatorPrintDTO.fromJson(Map<String, dynamic> json) =
      _$StageIndicatorPrintDTOImpl.fromJson;

  @override
  int get instituitionCod;
  set instituitionCod(int value);
  @override
  @JsonKey(ignore: true)
  _$$StageIndicatorPrintDTOImplCopyWith<_$StageIndicatorPrintDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
