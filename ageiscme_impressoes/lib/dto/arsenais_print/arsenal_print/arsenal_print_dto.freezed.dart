// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'arsenal_print_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ArsenalPrintDTO _$ArsenalPrintDTOFromJson(Map<String, dynamic> json) {
  return _ArsenalPrintDTO.fromJson(json);
}

/// @nodoc
mixin _$ArsenalPrintDTO {
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  String get codBarra => throw _privateConstructorUsedError;
  set codBarra(String value) => throw _privateConstructorUsedError;
  bool get selected => throw _privateConstructorUsedError;
  set selected(bool value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArsenalPrintDTOCopyWith<ArsenalPrintDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArsenalPrintDTOCopyWith<$Res> {
  factory $ArsenalPrintDTOCopyWith(
          ArsenalPrintDTO value, $Res Function(ArsenalPrintDTO) then) =
      _$ArsenalPrintDTOCopyWithImpl<$Res, ArsenalPrintDTO>;
  @useResult
  $Res call({String name, String codBarra, bool selected});
}

/// @nodoc
class _$ArsenalPrintDTOCopyWithImpl<$Res, $Val extends ArsenalPrintDTO>
    implements $ArsenalPrintDTOCopyWith<$Res> {
  _$ArsenalPrintDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? codBarra = null,
    Object? selected = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      codBarra: null == codBarra
          ? _value.codBarra
          : codBarra // ignore: cast_nullable_to_non_nullable
              as String,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArsenalPrintDTOImplCopyWith<$Res>
    implements $ArsenalPrintDTOCopyWith<$Res> {
  factory _$$ArsenalPrintDTOImplCopyWith(_$ArsenalPrintDTOImpl value,
          $Res Function(_$ArsenalPrintDTOImpl) then) =
      __$$ArsenalPrintDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String codBarra, bool selected});
}

/// @nodoc
class __$$ArsenalPrintDTOImplCopyWithImpl<$Res>
    extends _$ArsenalPrintDTOCopyWithImpl<$Res, _$ArsenalPrintDTOImpl>
    implements _$$ArsenalPrintDTOImplCopyWith<$Res> {
  __$$ArsenalPrintDTOImplCopyWithImpl(
      _$ArsenalPrintDTOImpl _value, $Res Function(_$ArsenalPrintDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? codBarra = null,
    Object? selected = null,
  }) {
    return _then(_$ArsenalPrintDTOImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      codBarra: null == codBarra
          ? _value.codBarra
          : codBarra // ignore: cast_nullable_to_non_nullable
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
class _$ArsenalPrintDTOImpl
    with DiagnosticableTreeMixin
    implements _ArsenalPrintDTO {
  _$ArsenalPrintDTOImpl(
      {required this.name, required this.codBarra, required this.selected});

  factory _$ArsenalPrintDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArsenalPrintDTOImplFromJson(json);

  @override
  String name;
  @override
  String codBarra;
  @override
  bool selected;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ArsenalPrintDTO(name: $name, codBarra: $codBarra, selected: $selected)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ArsenalPrintDTO'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('codBarra', codBarra))
      ..add(DiagnosticsProperty('selected', selected));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArsenalPrintDTOImplCopyWith<_$ArsenalPrintDTOImpl> get copyWith =>
      __$$ArsenalPrintDTOImplCopyWithImpl<_$ArsenalPrintDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArsenalPrintDTOImplToJson(
      this,
    );
  }
}

abstract class _ArsenalPrintDTO implements ArsenalPrintDTO {
  factory _ArsenalPrintDTO(
      {required String name,
      required String codBarra,
      required bool selected}) = _$ArsenalPrintDTOImpl;

  factory _ArsenalPrintDTO.fromJson(Map<String, dynamic> json) =
      _$ArsenalPrintDTOImpl.fromJson;

  @override
  String get name;
  set name(String value);
  @override
  String get codBarra;
  set codBarra(String value);
  @override
  bool get selected;
  set selected(bool value);
  @override
  @JsonKey(ignore: true)
  _$$ArsenalPrintDTOImplCopyWith<_$ArsenalPrintDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
