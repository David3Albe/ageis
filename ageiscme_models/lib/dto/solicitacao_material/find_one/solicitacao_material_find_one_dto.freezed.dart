// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'solicitacao_material_find_one_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SolicitacaoMaterialFindOneDTO _$SolicitacaoMaterialFindOneDTOFromJson(
    Map<String, dynamic> json) {
  return _SolicitacaoMaterialFindOneDTO.fromJson(json);
}

/// @nodoc
mixin _$SolicitacaoMaterialFindOneDTO {
  int get cod => throw _privateConstructorUsedError;
  set cod(int value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SolicitacaoMaterialFindOneDTOCopyWith<SolicitacaoMaterialFindOneDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SolicitacaoMaterialFindOneDTOCopyWith<$Res> {
  factory $SolicitacaoMaterialFindOneDTOCopyWith(
          SolicitacaoMaterialFindOneDTO value,
          $Res Function(SolicitacaoMaterialFindOneDTO) then) =
      _$SolicitacaoMaterialFindOneDTOCopyWithImpl<$Res,
          SolicitacaoMaterialFindOneDTO>;
  @useResult
  $Res call({int cod});
}

/// @nodoc
class _$SolicitacaoMaterialFindOneDTOCopyWithImpl<$Res,
        $Val extends SolicitacaoMaterialFindOneDTO>
    implements $SolicitacaoMaterialFindOneDTOCopyWith<$Res> {
  _$SolicitacaoMaterialFindOneDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
  }) {
    return _then(_value.copyWith(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SolicitacaoMaterialFindOneDTOImplCopyWith<$Res>
    implements $SolicitacaoMaterialFindOneDTOCopyWith<$Res> {
  factory _$$SolicitacaoMaterialFindOneDTOImplCopyWith(
          _$SolicitacaoMaterialFindOneDTOImpl value,
          $Res Function(_$SolicitacaoMaterialFindOneDTOImpl) then) =
      __$$SolicitacaoMaterialFindOneDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cod});
}

/// @nodoc
class __$$SolicitacaoMaterialFindOneDTOImplCopyWithImpl<$Res>
    extends _$SolicitacaoMaterialFindOneDTOCopyWithImpl<$Res,
        _$SolicitacaoMaterialFindOneDTOImpl>
    implements _$$SolicitacaoMaterialFindOneDTOImplCopyWith<$Res> {
  __$$SolicitacaoMaterialFindOneDTOImplCopyWithImpl(
      _$SolicitacaoMaterialFindOneDTOImpl _value,
      $Res Function(_$SolicitacaoMaterialFindOneDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = null,
  }) {
    return _then(_$SolicitacaoMaterialFindOneDTOImpl(
      cod: null == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SolicitacaoMaterialFindOneDTOImpl
    with DiagnosticableTreeMixin
    implements _SolicitacaoMaterialFindOneDTO {
  _$SolicitacaoMaterialFindOneDTOImpl({required this.cod});

  factory _$SolicitacaoMaterialFindOneDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SolicitacaoMaterialFindOneDTOImplFromJson(json);

  @override
  int cod;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SolicitacaoMaterialFindOneDTO(cod: $cod)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SolicitacaoMaterialFindOneDTO'))
      ..add(DiagnosticsProperty('cod', cod));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SolicitacaoMaterialFindOneDTOImplCopyWith<
          _$SolicitacaoMaterialFindOneDTOImpl>
      get copyWith => __$$SolicitacaoMaterialFindOneDTOImplCopyWithImpl<
          _$SolicitacaoMaterialFindOneDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SolicitacaoMaterialFindOneDTOImplToJson(
      this,
    );
  }
}

abstract class _SolicitacaoMaterialFindOneDTO
    implements SolicitacaoMaterialFindOneDTO {
  factory _SolicitacaoMaterialFindOneDTO({required int cod}) =
      _$SolicitacaoMaterialFindOneDTOImpl;

  factory _SolicitacaoMaterialFindOneDTO.fromJson(Map<String, dynamic> json) =
      _$SolicitacaoMaterialFindOneDTOImpl.fromJson;

  @override
  int get cod;
  set cod(int value);
  @override
  @JsonKey(ignore: true)
  _$$SolicitacaoMaterialFindOneDTOImplCopyWith<
          _$SolicitacaoMaterialFindOneDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
