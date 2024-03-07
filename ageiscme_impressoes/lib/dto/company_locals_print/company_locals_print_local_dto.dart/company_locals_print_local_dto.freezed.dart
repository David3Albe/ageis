// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_locals_print_local_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CompanyLocalsPrintLocalDTO _$CompanyLocalsPrintLocalDTOFromJson(
    Map<String, dynamic> json) {
  return _CompanyLocalsPrintLocalDTO.fromJson(json);
}

/// @nodoc
mixin _$CompanyLocalsPrintLocalDTO {
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  String get tagId => throw _privateConstructorUsedError;
  set tagId(String value) => throw _privateConstructorUsedError;
  bool get selected => throw _privateConstructorUsedError;
  set selected(bool value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompanyLocalsPrintLocalDTOCopyWith<CompanyLocalsPrintLocalDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyLocalsPrintLocalDTOCopyWith<$Res> {
  factory $CompanyLocalsPrintLocalDTOCopyWith(CompanyLocalsPrintLocalDTO value,
          $Res Function(CompanyLocalsPrintLocalDTO) then) =
      _$CompanyLocalsPrintLocalDTOCopyWithImpl<$Res,
          CompanyLocalsPrintLocalDTO>;
  @useResult
  $Res call({String name, String tagId, bool selected});
}

/// @nodoc
class _$CompanyLocalsPrintLocalDTOCopyWithImpl<$Res,
        $Val extends CompanyLocalsPrintLocalDTO>
    implements $CompanyLocalsPrintLocalDTOCopyWith<$Res> {
  _$CompanyLocalsPrintLocalDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? tagId = null,
    Object? selected = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      tagId: null == tagId
          ? _value.tagId
          : tagId // ignore: cast_nullable_to_non_nullable
              as String,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CompanyLocalsPrintLocalDTOImplCopyWith<$Res>
    implements $CompanyLocalsPrintLocalDTOCopyWith<$Res> {
  factory _$$CompanyLocalsPrintLocalDTOImplCopyWith(
          _$CompanyLocalsPrintLocalDTOImpl value,
          $Res Function(_$CompanyLocalsPrintLocalDTOImpl) then) =
      __$$CompanyLocalsPrintLocalDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String tagId, bool selected});
}

/// @nodoc
class __$$CompanyLocalsPrintLocalDTOImplCopyWithImpl<$Res>
    extends _$CompanyLocalsPrintLocalDTOCopyWithImpl<$Res,
        _$CompanyLocalsPrintLocalDTOImpl>
    implements _$$CompanyLocalsPrintLocalDTOImplCopyWith<$Res> {
  __$$CompanyLocalsPrintLocalDTOImplCopyWithImpl(
      _$CompanyLocalsPrintLocalDTOImpl _value,
      $Res Function(_$CompanyLocalsPrintLocalDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? tagId = null,
    Object? selected = null,
  }) {
    return _then(_$CompanyLocalsPrintLocalDTOImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      tagId: null == tagId
          ? _value.tagId
          : tagId // ignore: cast_nullable_to_non_nullable
              as String,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CompanyLocalsPrintLocalDTOImpl
    with DiagnosticableTreeMixin
    implements _CompanyLocalsPrintLocalDTO {
  _$CompanyLocalsPrintLocalDTOImpl(
      {required this.name, required this.tagId, required this.selected});

  factory _$CompanyLocalsPrintLocalDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CompanyLocalsPrintLocalDTOImplFromJson(json);

  @override
  String name;
  @override
  String tagId;
  @override
  bool selected;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CompanyLocalsPrintLocalDTO(name: $name, tagId: $tagId, selected: $selected)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CompanyLocalsPrintLocalDTO'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('tagId', tagId))
      ..add(DiagnosticsProperty('selected', selected));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CompanyLocalsPrintLocalDTOImplCopyWith<_$CompanyLocalsPrintLocalDTOImpl>
      get copyWith => __$$CompanyLocalsPrintLocalDTOImplCopyWithImpl<
          _$CompanyLocalsPrintLocalDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CompanyLocalsPrintLocalDTOImplToJson(
      this,
    );
  }
}

abstract class _CompanyLocalsPrintLocalDTO
    implements CompanyLocalsPrintLocalDTO {
  factory _CompanyLocalsPrintLocalDTO(
      {required String name,
      required String tagId,
      required bool selected}) = _$CompanyLocalsPrintLocalDTOImpl;

  factory _CompanyLocalsPrintLocalDTO.fromJson(Map<String, dynamic> json) =
      _$CompanyLocalsPrintLocalDTOImpl.fromJson;

  @override
  String get name;
  set name(String value);
  @override
  String get tagId;
  set tagId(String value);
  @override
  bool get selected;
  set selected(bool value);
  @override
  @JsonKey(ignore: true)
  _$$CompanyLocalsPrintLocalDTOImplCopyWith<_$CompanyLocalsPrintLocalDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
