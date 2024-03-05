// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tipo_documento_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TipoDocumentoModel _$TipoDocumentoModelFromJson(Map<String, dynamic> json) {
  return _TipoDocumentoModel.fromJson(json);
}

/// @nodoc
mixin _$TipoDocumentoModel {
  int? get cod => throw _privateConstructorUsedError;
  set cod(int? value) => throw _privateConstructorUsedError;
  String? get descricao => throw _privateConstructorUsedError;
  set descricao(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TipoDocumentoModelCopyWith<TipoDocumentoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TipoDocumentoModelCopyWith<$Res> {
  factory $TipoDocumentoModelCopyWith(
          TipoDocumentoModel value, $Res Function(TipoDocumentoModel) then) =
      _$TipoDocumentoModelCopyWithImpl<$Res, TipoDocumentoModel>;
  @useResult
  $Res call({int? cod, String? descricao});
}

/// @nodoc
class _$TipoDocumentoModelCopyWithImpl<$Res, $Val extends TipoDocumentoModel>
    implements $TipoDocumentoModelCopyWith<$Res> {
  _$TipoDocumentoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? descricao = freezed,
  }) {
    return _then(_value.copyWith(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      descricao: freezed == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TipoDocumentoModelImplCopyWith<$Res>
    implements $TipoDocumentoModelCopyWith<$Res> {
  factory _$$TipoDocumentoModelImplCopyWith(_$TipoDocumentoModelImpl value,
          $Res Function(_$TipoDocumentoModelImpl) then) =
      __$$TipoDocumentoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? cod, String? descricao});
}

/// @nodoc
class __$$TipoDocumentoModelImplCopyWithImpl<$Res>
    extends _$TipoDocumentoModelCopyWithImpl<$Res, _$TipoDocumentoModelImpl>
    implements _$$TipoDocumentoModelImplCopyWith<$Res> {
  __$$TipoDocumentoModelImplCopyWithImpl(_$TipoDocumentoModelImpl _value,
      $Res Function(_$TipoDocumentoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cod = freezed,
    Object? descricao = freezed,
  }) {
    return _then(_$TipoDocumentoModelImpl(
      cod: freezed == cod
          ? _value.cod
          : cod // ignore: cast_nullable_to_non_nullable
              as int?,
      descricao: freezed == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TipoDocumentoModelImpl extends _TipoDocumentoModel
    with DiagnosticableTreeMixin {
  _$TipoDocumentoModelImpl({required this.cod, required this.descricao})
      : super._();

  factory _$TipoDocumentoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TipoDocumentoModelImplFromJson(json);

  @override
  int? cod;
  @override
  String? descricao;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TipoDocumentoModel(cod: $cod, descricao: $descricao)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TipoDocumentoModel'))
      ..add(DiagnosticsProperty('cod', cod))
      ..add(DiagnosticsProperty('descricao', descricao));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TipoDocumentoModelImplCopyWith<_$TipoDocumentoModelImpl> get copyWith =>
      __$$TipoDocumentoModelImplCopyWithImpl<_$TipoDocumentoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TipoDocumentoModelImplToJson(
      this,
    );
  }
}

abstract class _TipoDocumentoModel extends TipoDocumentoModel {
  factory _TipoDocumentoModel({required int? cod, required String? descricao}) =
      _$TipoDocumentoModelImpl;
  _TipoDocumentoModel._() : super._();

  factory _TipoDocumentoModel.fromJson(Map<String, dynamic> json) =
      _$TipoDocumentoModelImpl.fromJson;

  @override
  int? get cod;
  set cod(int? value);
  @override
  String? get descricao;
  set descricao(String? value);
  @override
  @JsonKey(ignore: true)
  _$$TipoDocumentoModelImplCopyWith<_$TipoDocumentoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
