// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_locals_print_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CompanyLocalsPrintDTO _$CompanyLocalsPrintDTOFromJson(
    Map<String, dynamic> json) {
  return _CompanyLocalsPrintDTO.fromJson(json);
}

/// @nodoc
mixin _$CompanyLocalsPrintDTO {
  String get companyName => throw _privateConstructorUsedError;
  set companyName(String value) => throw _privateConstructorUsedError;
  List<CompanyLocalsPrintLocalDTO> get locals =>
      throw _privateConstructorUsedError;
  set locals(List<CompanyLocalsPrintLocalDTO> value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompanyLocalsPrintDTOCopyWith<CompanyLocalsPrintDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyLocalsPrintDTOCopyWith<$Res> {
  factory $CompanyLocalsPrintDTOCopyWith(CompanyLocalsPrintDTO value,
          $Res Function(CompanyLocalsPrintDTO) then) =
      _$CompanyLocalsPrintDTOCopyWithImpl<$Res, CompanyLocalsPrintDTO>;
  @useResult
  $Res call({String companyName, List<CompanyLocalsPrintLocalDTO> locals});
}

/// @nodoc
class _$CompanyLocalsPrintDTOCopyWithImpl<$Res,
        $Val extends CompanyLocalsPrintDTO>
    implements $CompanyLocalsPrintDTOCopyWith<$Res> {
  _$CompanyLocalsPrintDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companyName = null,
    Object? locals = null,
  }) {
    return _then(_value.copyWith(
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      locals: null == locals
          ? _value.locals
          : locals // ignore: cast_nullable_to_non_nullable
              as List<CompanyLocalsPrintLocalDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CompanyLocalsPrintDTOImplCopyWith<$Res>
    implements $CompanyLocalsPrintDTOCopyWith<$Res> {
  factory _$$CompanyLocalsPrintDTOImplCopyWith(
          _$CompanyLocalsPrintDTOImpl value,
          $Res Function(_$CompanyLocalsPrintDTOImpl) then) =
      __$$CompanyLocalsPrintDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String companyName, List<CompanyLocalsPrintLocalDTO> locals});
}

/// @nodoc
class __$$CompanyLocalsPrintDTOImplCopyWithImpl<$Res>
    extends _$CompanyLocalsPrintDTOCopyWithImpl<$Res,
        _$CompanyLocalsPrintDTOImpl>
    implements _$$CompanyLocalsPrintDTOImplCopyWith<$Res> {
  __$$CompanyLocalsPrintDTOImplCopyWithImpl(_$CompanyLocalsPrintDTOImpl _value,
      $Res Function(_$CompanyLocalsPrintDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companyName = null,
    Object? locals = null,
  }) {
    return _then(_$CompanyLocalsPrintDTOImpl(
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      locals: null == locals
          ? _value.locals
          : locals // ignore: cast_nullable_to_non_nullable
              as List<CompanyLocalsPrintLocalDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CompanyLocalsPrintDTOImpl
    with DiagnosticableTreeMixin
    implements _CompanyLocalsPrintDTO {
  _$CompanyLocalsPrintDTOImpl(
      {required this.companyName, required this.locals});

  factory _$CompanyLocalsPrintDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$CompanyLocalsPrintDTOImplFromJson(json);

  @override
  String companyName;
  @override
  List<CompanyLocalsPrintLocalDTO> locals;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CompanyLocalsPrintDTO(companyName: $companyName, locals: $locals)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CompanyLocalsPrintDTO'))
      ..add(DiagnosticsProperty('companyName', companyName))
      ..add(DiagnosticsProperty('locals', locals));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CompanyLocalsPrintDTOImplCopyWith<_$CompanyLocalsPrintDTOImpl>
      get copyWith => __$$CompanyLocalsPrintDTOImplCopyWithImpl<
          _$CompanyLocalsPrintDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CompanyLocalsPrintDTOImplToJson(
      this,
    );
  }
}

abstract class _CompanyLocalsPrintDTO implements CompanyLocalsPrintDTO {
  factory _CompanyLocalsPrintDTO(
          {required String companyName,
          required List<CompanyLocalsPrintLocalDTO> locals}) =
      _$CompanyLocalsPrintDTOImpl;

  factory _CompanyLocalsPrintDTO.fromJson(Map<String, dynamic> json) =
      _$CompanyLocalsPrintDTOImpl.fromJson;

  @override
  String get companyName;
  set companyName(String value);
  @override
  List<CompanyLocalsPrintLocalDTO> get locals;
  set locals(List<CompanyLocalsPrintLocalDTO> value);
  @override
  @JsonKey(ignore: true)
  _$$CompanyLocalsPrintDTOImplCopyWith<_$CompanyLocalsPrintDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
