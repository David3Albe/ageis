// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'packagings_packaging_print_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PackagingsPackagingPrintDTO _$PackagingsPackagingPrintDTOFromJson(
    Map<String, dynamic> json) {
  return _PackagingsPackagingPrintDTO.fromJson(json);
}

/// @nodoc
mixin _$PackagingsPackagingPrintDTO {
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  int get tagId => throw _privateConstructorUsedError;
  set tagId(int value) => throw _privateConstructorUsedError;
  bool get selected => throw _privateConstructorUsedError;
  set selected(bool value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PackagingsPackagingPrintDTOCopyWith<PackagingsPackagingPrintDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackagingsPackagingPrintDTOCopyWith<$Res> {
  factory $PackagingsPackagingPrintDTOCopyWith(
          PackagingsPackagingPrintDTO value,
          $Res Function(PackagingsPackagingPrintDTO) then) =
      _$PackagingsPackagingPrintDTOCopyWithImpl<$Res,
          PackagingsPackagingPrintDTO>;
  @useResult
  $Res call({String name, int tagId, bool selected});
}

/// @nodoc
class _$PackagingsPackagingPrintDTOCopyWithImpl<$Res,
        $Val extends PackagingsPackagingPrintDTO>
    implements $PackagingsPackagingPrintDTOCopyWith<$Res> {
  _$PackagingsPackagingPrintDTOCopyWithImpl(this._value, this._then);

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
              as int,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PackagingsPackagingPrintDTOImplCopyWith<$Res>
    implements $PackagingsPackagingPrintDTOCopyWith<$Res> {
  factory _$$PackagingsPackagingPrintDTOImplCopyWith(
          _$PackagingsPackagingPrintDTOImpl value,
          $Res Function(_$PackagingsPackagingPrintDTOImpl) then) =
      __$$PackagingsPackagingPrintDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int tagId, bool selected});
}

/// @nodoc
class __$$PackagingsPackagingPrintDTOImplCopyWithImpl<$Res>
    extends _$PackagingsPackagingPrintDTOCopyWithImpl<$Res,
        _$PackagingsPackagingPrintDTOImpl>
    implements _$$PackagingsPackagingPrintDTOImplCopyWith<$Res> {
  __$$PackagingsPackagingPrintDTOImplCopyWithImpl(
      _$PackagingsPackagingPrintDTOImpl _value,
      $Res Function(_$PackagingsPackagingPrintDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? tagId = null,
    Object? selected = null,
  }) {
    return _then(_$PackagingsPackagingPrintDTOImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      tagId: null == tagId
          ? _value.tagId
          : tagId // ignore: cast_nullable_to_non_nullable
              as int,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PackagingsPackagingPrintDTOImpl
    with DiagnosticableTreeMixin
    implements _PackagingsPackagingPrintDTO {
  _$PackagingsPackagingPrintDTOImpl(
      {required this.name, required this.tagId, required this.selected});

  factory _$PackagingsPackagingPrintDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PackagingsPackagingPrintDTOImplFromJson(json);

  @override
  String name;
  @override
  int tagId;
  @override
  bool selected;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PackagingsPackagingPrintDTO(name: $name, tagId: $tagId, selected: $selected)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PackagingsPackagingPrintDTO'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('tagId', tagId))
      ..add(DiagnosticsProperty('selected', selected));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PackagingsPackagingPrintDTOImplCopyWith<_$PackagingsPackagingPrintDTOImpl>
      get copyWith => __$$PackagingsPackagingPrintDTOImplCopyWithImpl<
          _$PackagingsPackagingPrintDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PackagingsPackagingPrintDTOImplToJson(
      this,
    );
  }
}

abstract class _PackagingsPackagingPrintDTO
    implements PackagingsPackagingPrintDTO {
  factory _PackagingsPackagingPrintDTO(
      {required String name,
      required int tagId,
      required bool selected}) = _$PackagingsPackagingPrintDTOImpl;

  factory _PackagingsPackagingPrintDTO.fromJson(Map<String, dynamic> json) =
      _$PackagingsPackagingPrintDTOImpl.fromJson;

  @override
  String get name;
  set name(String value);
  @override
  int get tagId;
  set tagId(int value);
  @override
  bool get selected;
  set selected(bool value);
  @override
  @JsonKey(ignore: true)
  _$$PackagingsPackagingPrintDTOImplCopyWith<_$PackagingsPackagingPrintDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
