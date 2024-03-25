// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'packagings_print_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PackagingsPrintDTO _$PackagingsPrintDTOFromJson(Map<String, dynamic> json) {
  return _PackagingsPrintDTO.fromJson(json);
}

/// @nodoc
mixin _$PackagingsPrintDTO {
  String get companyName => throw _privateConstructorUsedError;
  set companyName(String value) => throw _privateConstructorUsedError;
  int get companyCod => throw _privateConstructorUsedError;
  set companyCod(int value) => throw _privateConstructorUsedError;
  List<PackagingsPackagingPrintDTO> get packagings =>
      throw _privateConstructorUsedError;
  set packagings(List<PackagingsPackagingPrintDTO> value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PackagingsPrintDTOCopyWith<PackagingsPrintDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackagingsPrintDTOCopyWith<$Res> {
  factory $PackagingsPrintDTOCopyWith(
          PackagingsPrintDTO value, $Res Function(PackagingsPrintDTO) then) =
      _$PackagingsPrintDTOCopyWithImpl<$Res, PackagingsPrintDTO>;
  @useResult
  $Res call(
      {String companyName,
      int companyCod,
      List<PackagingsPackagingPrintDTO> packagings});
}

/// @nodoc
class _$PackagingsPrintDTOCopyWithImpl<$Res, $Val extends PackagingsPrintDTO>
    implements $PackagingsPrintDTOCopyWith<$Res> {
  _$PackagingsPrintDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companyName = null,
    Object? companyCod = null,
    Object? packagings = null,
  }) {
    return _then(_value.copyWith(
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      companyCod: null == companyCod
          ? _value.companyCod
          : companyCod // ignore: cast_nullable_to_non_nullable
              as int,
      packagings: null == packagings
          ? _value.packagings
          : packagings // ignore: cast_nullable_to_non_nullable
              as List<PackagingsPackagingPrintDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PackagingsPrintDTOImplCopyWith<$Res>
    implements $PackagingsPrintDTOCopyWith<$Res> {
  factory _$$PackagingsPrintDTOImplCopyWith(_$PackagingsPrintDTOImpl value,
          $Res Function(_$PackagingsPrintDTOImpl) then) =
      __$$PackagingsPrintDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String companyName,
      int companyCod,
      List<PackagingsPackagingPrintDTO> packagings});
}

/// @nodoc
class __$$PackagingsPrintDTOImplCopyWithImpl<$Res>
    extends _$PackagingsPrintDTOCopyWithImpl<$Res, _$PackagingsPrintDTOImpl>
    implements _$$PackagingsPrintDTOImplCopyWith<$Res> {
  __$$PackagingsPrintDTOImplCopyWithImpl(_$PackagingsPrintDTOImpl _value,
      $Res Function(_$PackagingsPrintDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companyName = null,
    Object? companyCod = null,
    Object? packagings = null,
  }) {
    return _then(_$PackagingsPrintDTOImpl(
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      companyCod: null == companyCod
          ? _value.companyCod
          : companyCod // ignore: cast_nullable_to_non_nullable
              as int,
      packagings: null == packagings
          ? _value.packagings
          : packagings // ignore: cast_nullable_to_non_nullable
              as List<PackagingsPackagingPrintDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PackagingsPrintDTOImpl
    with DiagnosticableTreeMixin
    implements _PackagingsPrintDTO {
  _$PackagingsPrintDTOImpl(
      {required this.companyName,
      required this.companyCod,
      required this.packagings});

  factory _$PackagingsPrintDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$PackagingsPrintDTOImplFromJson(json);

  @override
  String companyName;
  @override
  int companyCod;
  @override
  List<PackagingsPackagingPrintDTO> packagings;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PackagingsPrintDTO(companyName: $companyName, companyCod: $companyCod, packagings: $packagings)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PackagingsPrintDTO'))
      ..add(DiagnosticsProperty('companyName', companyName))
      ..add(DiagnosticsProperty('companyCod', companyCod))
      ..add(DiagnosticsProperty('packagings', packagings));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PackagingsPrintDTOImplCopyWith<_$PackagingsPrintDTOImpl> get copyWith =>
      __$$PackagingsPrintDTOImplCopyWithImpl<_$PackagingsPrintDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PackagingsPrintDTOImplToJson(
      this,
    );
  }
}

abstract class _PackagingsPrintDTO implements PackagingsPrintDTO {
  factory _PackagingsPrintDTO(
          {required String companyName,
          required int companyCod,
          required List<PackagingsPackagingPrintDTO> packagings}) =
      _$PackagingsPrintDTOImpl;

  factory _PackagingsPrintDTO.fromJson(Map<String, dynamic> json) =
      _$PackagingsPrintDTOImpl.fromJson;

  @override
  String get companyName;
  set companyName(String value);
  @override
  int get companyCod;
  set companyCod(int value);
  @override
  List<PackagingsPackagingPrintDTO> get packagings;
  set packagings(List<PackagingsPackagingPrintDTO> value);
  @override
  @JsonKey(ignore: true)
  _$$PackagingsPrintDTOImplCopyWith<_$PackagingsPrintDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
