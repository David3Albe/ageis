// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'arsenais_print_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ArsenaisPrintDTO _$ArsenaisPrintDTOFromJson(Map<String, dynamic> json) {
  return _ArsenaisPrintDTO.fromJson(json);
}

/// @nodoc
mixin _$ArsenaisPrintDTO {
  int get companyCod => throw _privateConstructorUsedError;
  set companyCod(int value) => throw _privateConstructorUsedError;
  String get companyName => throw _privateConstructorUsedError;
  set companyName(String value) => throw _privateConstructorUsedError;
  List<ArsenalPrintDTO> get arsenais => throw _privateConstructorUsedError;
  set arsenais(List<ArsenalPrintDTO> value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArsenaisPrintDTOCopyWith<ArsenaisPrintDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArsenaisPrintDTOCopyWith<$Res> {
  factory $ArsenaisPrintDTOCopyWith(
          ArsenaisPrintDTO value, $Res Function(ArsenaisPrintDTO) then) =
      _$ArsenaisPrintDTOCopyWithImpl<$Res, ArsenaisPrintDTO>;
  @useResult
  $Res call(
      {int companyCod, String companyName, List<ArsenalPrintDTO> arsenais});
}

/// @nodoc
class _$ArsenaisPrintDTOCopyWithImpl<$Res, $Val extends ArsenaisPrintDTO>
    implements $ArsenaisPrintDTOCopyWith<$Res> {
  _$ArsenaisPrintDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companyCod = null,
    Object? companyName = null,
    Object? arsenais = null,
  }) {
    return _then(_value.copyWith(
      companyCod: null == companyCod
          ? _value.companyCod
          : companyCod // ignore: cast_nullable_to_non_nullable
              as int,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      arsenais: null == arsenais
          ? _value.arsenais
          : arsenais // ignore: cast_nullable_to_non_nullable
              as List<ArsenalPrintDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArsenaisPrintDTOImplCopyWith<$Res>
    implements $ArsenaisPrintDTOCopyWith<$Res> {
  factory _$$ArsenaisPrintDTOImplCopyWith(_$ArsenaisPrintDTOImpl value,
          $Res Function(_$ArsenaisPrintDTOImpl) then) =
      __$$ArsenaisPrintDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int companyCod, String companyName, List<ArsenalPrintDTO> arsenais});
}

/// @nodoc
class __$$ArsenaisPrintDTOImplCopyWithImpl<$Res>
    extends _$ArsenaisPrintDTOCopyWithImpl<$Res, _$ArsenaisPrintDTOImpl>
    implements _$$ArsenaisPrintDTOImplCopyWith<$Res> {
  __$$ArsenaisPrintDTOImplCopyWithImpl(_$ArsenaisPrintDTOImpl _value,
      $Res Function(_$ArsenaisPrintDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companyCod = null,
    Object? companyName = null,
    Object? arsenais = null,
  }) {
    return _then(_$ArsenaisPrintDTOImpl(
      companyCod: null == companyCod
          ? _value.companyCod
          : companyCod // ignore: cast_nullable_to_non_nullable
              as int,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      arsenais: null == arsenais
          ? _value.arsenais
          : arsenais // ignore: cast_nullable_to_non_nullable
              as List<ArsenalPrintDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArsenaisPrintDTOImpl
    with DiagnosticableTreeMixin
    implements _ArsenaisPrintDTO {
  _$ArsenaisPrintDTOImpl(
      {required this.companyCod,
      required this.companyName,
      required this.arsenais});

  factory _$ArsenaisPrintDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArsenaisPrintDTOImplFromJson(json);

  @override
  int companyCod;
  @override
  String companyName;
  @override
  List<ArsenalPrintDTO> arsenais;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ArsenaisPrintDTO(companyCod: $companyCod, companyName: $companyName, arsenais: $arsenais)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ArsenaisPrintDTO'))
      ..add(DiagnosticsProperty('companyCod', companyCod))
      ..add(DiagnosticsProperty('companyName', companyName))
      ..add(DiagnosticsProperty('arsenais', arsenais));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArsenaisPrintDTOImplCopyWith<_$ArsenaisPrintDTOImpl> get copyWith =>
      __$$ArsenaisPrintDTOImplCopyWithImpl<_$ArsenaisPrintDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArsenaisPrintDTOImplToJson(
      this,
    );
  }
}

abstract class _ArsenaisPrintDTO implements ArsenaisPrintDTO {
  factory _ArsenaisPrintDTO(
      {required int companyCod,
      required String companyName,
      required List<ArsenalPrintDTO> arsenais}) = _$ArsenaisPrintDTOImpl;

  factory _ArsenaisPrintDTO.fromJson(Map<String, dynamic> json) =
      _$ArsenaisPrintDTOImpl.fromJson;

  @override
  int get companyCod;
  set companyCod(int value);
  @override
  String get companyName;
  set companyName(String value);
  @override
  List<ArsenalPrintDTO> get arsenais;
  set arsenais(List<ArsenalPrintDTO> value);
  @override
  @JsonKey(ignore: true)
  _$$ArsenaisPrintDTOImplCopyWith<_$ArsenaisPrintDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
