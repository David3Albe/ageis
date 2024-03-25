// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'folha_rotulado_print_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FolhaRotuladoPrintDTO _$FolhaRotuladoPrintDTOFromJson(
    Map<String, dynamic> json) {
  return _FolhaRotuladoPrintDTO.fromJson(json);
}

/// @nodoc
mixin _$FolhaRotuladoPrintDTO {
  Map<String, List<FolhaRotuladoItemPrintDTO>> get itensPorTipo =>
      throw _privateConstructorUsedError;
  set itensPorTipo(Map<String, List<FolhaRotuladoItemPrintDTO>> value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FolhaRotuladoPrintDTOCopyWith<FolhaRotuladoPrintDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FolhaRotuladoPrintDTOCopyWith<$Res> {
  factory $FolhaRotuladoPrintDTOCopyWith(FolhaRotuladoPrintDTO value,
          $Res Function(FolhaRotuladoPrintDTO) then) =
      _$FolhaRotuladoPrintDTOCopyWithImpl<$Res, FolhaRotuladoPrintDTO>;
  @useResult
  $Res call({Map<String, List<FolhaRotuladoItemPrintDTO>> itensPorTipo});
}

/// @nodoc
class _$FolhaRotuladoPrintDTOCopyWithImpl<$Res,
        $Val extends FolhaRotuladoPrintDTO>
    implements $FolhaRotuladoPrintDTOCopyWith<$Res> {
  _$FolhaRotuladoPrintDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itensPorTipo = null,
  }) {
    return _then(_value.copyWith(
      itensPorTipo: null == itensPorTipo
          ? _value.itensPorTipo
          : itensPorTipo // ignore: cast_nullable_to_non_nullable
              as Map<String, List<FolhaRotuladoItemPrintDTO>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FolhaRotuladoPrintDTOImplCopyWith<$Res>
    implements $FolhaRotuladoPrintDTOCopyWith<$Res> {
  factory _$$FolhaRotuladoPrintDTOImplCopyWith(
          _$FolhaRotuladoPrintDTOImpl value,
          $Res Function(_$FolhaRotuladoPrintDTOImpl) then) =
      __$$FolhaRotuladoPrintDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, List<FolhaRotuladoItemPrintDTO>> itensPorTipo});
}

/// @nodoc
class __$$FolhaRotuladoPrintDTOImplCopyWithImpl<$Res>
    extends _$FolhaRotuladoPrintDTOCopyWithImpl<$Res,
        _$FolhaRotuladoPrintDTOImpl>
    implements _$$FolhaRotuladoPrintDTOImplCopyWith<$Res> {
  __$$FolhaRotuladoPrintDTOImplCopyWithImpl(_$FolhaRotuladoPrintDTOImpl _value,
      $Res Function(_$FolhaRotuladoPrintDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itensPorTipo = null,
  }) {
    return _then(_$FolhaRotuladoPrintDTOImpl(
      itensPorTipo: null == itensPorTipo
          ? _value.itensPorTipo
          : itensPorTipo // ignore: cast_nullable_to_non_nullable
              as Map<String, List<FolhaRotuladoItemPrintDTO>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FolhaRotuladoPrintDTOImpl
    with DiagnosticableTreeMixin
    implements _FolhaRotuladoPrintDTO {
  _$FolhaRotuladoPrintDTOImpl({required this.itensPorTipo});

  factory _$FolhaRotuladoPrintDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$FolhaRotuladoPrintDTOImplFromJson(json);

  @override
  Map<String, List<FolhaRotuladoItemPrintDTO>> itensPorTipo;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FolhaRotuladoPrintDTO(itensPorTipo: $itensPorTipo)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FolhaRotuladoPrintDTO'))
      ..add(DiagnosticsProperty('itensPorTipo', itensPorTipo));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FolhaRotuladoPrintDTOImplCopyWith<_$FolhaRotuladoPrintDTOImpl>
      get copyWith => __$$FolhaRotuladoPrintDTOImplCopyWithImpl<
          _$FolhaRotuladoPrintDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FolhaRotuladoPrintDTOImplToJson(
      this,
    );
  }
}

abstract class _FolhaRotuladoPrintDTO implements FolhaRotuladoPrintDTO {
  factory _FolhaRotuladoPrintDTO(
      {required Map<String, List<FolhaRotuladoItemPrintDTO>>
          itensPorTipo}) = _$FolhaRotuladoPrintDTOImpl;

  factory _FolhaRotuladoPrintDTO.fromJson(Map<String, dynamic> json) =
      _$FolhaRotuladoPrintDTOImpl.fromJson;

  @override
  Map<String, List<FolhaRotuladoItemPrintDTO>> get itensPorTipo;
  set itensPorTipo(Map<String, List<FolhaRotuladoItemPrintDTO>> value);
  @override
  @JsonKey(ignore: true)
  _$$FolhaRotuladoPrintDTOImplCopyWith<_$FolhaRotuladoPrintDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
