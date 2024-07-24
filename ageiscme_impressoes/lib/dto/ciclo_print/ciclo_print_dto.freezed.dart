// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ciclo_print_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CicloPrintDTO _$CicloPrintDTOFromJson(Map<String, dynamic> json) {
  return _CicloPrintDTO.fromJson(json);
}

/// @nodoc
mixin _$CicloPrintDTO {
  String get instituicao => throw _privateConstructorUsedError;
  set instituicao(String value) => throw _privateConstructorUsedError;
  List<CicloPrintItemsDTO> get items => throw _privateConstructorUsedError;
  set items(List<CicloPrintItemsDTO> value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CicloPrintDTOCopyWith<CicloPrintDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CicloPrintDTOCopyWith<$Res> {
  factory $CicloPrintDTOCopyWith(
          CicloPrintDTO value, $Res Function(CicloPrintDTO) then) =
      _$CicloPrintDTOCopyWithImpl<$Res, CicloPrintDTO>;
  @useResult
  $Res call({String instituicao, List<CicloPrintItemsDTO> items});
}

/// @nodoc
class _$CicloPrintDTOCopyWithImpl<$Res, $Val extends CicloPrintDTO>
    implements $CicloPrintDTOCopyWith<$Res> {
  _$CicloPrintDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? instituicao = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      instituicao: null == instituicao
          ? _value.instituicao
          : instituicao // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CicloPrintItemsDTO>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CicloPrintDTOImplCopyWith<$Res>
    implements $CicloPrintDTOCopyWith<$Res> {
  factory _$$CicloPrintDTOImplCopyWith(
          _$CicloPrintDTOImpl value, $Res Function(_$CicloPrintDTOImpl) then) =
      __$$CicloPrintDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String instituicao, List<CicloPrintItemsDTO> items});
}

/// @nodoc
class __$$CicloPrintDTOImplCopyWithImpl<$Res>
    extends _$CicloPrintDTOCopyWithImpl<$Res, _$CicloPrintDTOImpl>
    implements _$$CicloPrintDTOImplCopyWith<$Res> {
  __$$CicloPrintDTOImplCopyWithImpl(
      _$CicloPrintDTOImpl _value, $Res Function(_$CicloPrintDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? instituicao = null,
    Object? items = null,
  }) {
    return _then(_$CicloPrintDTOImpl(
      instituicao: null == instituicao
          ? _value.instituicao
          : instituicao // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CicloPrintItemsDTO>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CicloPrintDTOImpl
    with DiagnosticableTreeMixin
    implements _CicloPrintDTO {
  _$CicloPrintDTOImpl({required this.instituicao, required this.items});

  factory _$CicloPrintDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$CicloPrintDTOImplFromJson(json);

  @override
  String instituicao;
  @override
  List<CicloPrintItemsDTO> items;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CicloPrintDTO(instituicao: $instituicao, items: $items)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CicloPrintDTO'))
      ..add(DiagnosticsProperty('instituicao', instituicao))
      ..add(DiagnosticsProperty('items', items));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CicloPrintDTOImplCopyWith<_$CicloPrintDTOImpl> get copyWith =>
      __$$CicloPrintDTOImplCopyWithImpl<_$CicloPrintDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CicloPrintDTOImplToJson(
      this,
    );
  }
}

abstract class _CicloPrintDTO implements CicloPrintDTO {
  factory _CicloPrintDTO(
      {required String instituicao,
      required List<CicloPrintItemsDTO> items}) = _$CicloPrintDTOImpl;

  factory _CicloPrintDTO.fromJson(Map<String, dynamic> json) =
      _$CicloPrintDTOImpl.fromJson;

  @override
  String get instituicao;
  set instituicao(String value);
  @override
  List<CicloPrintItemsDTO> get items;
  set items(List<CicloPrintItemsDTO> value);
  @override
  @JsonKey(ignore: true)
  _$$CicloPrintDTOImplCopyWith<_$CicloPrintDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
