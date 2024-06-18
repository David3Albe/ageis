// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'solicitacao_material_add_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SolicitacaoMaterialAddDTO _$SolicitacaoMaterialAddDTOFromJson(
    Map<String, dynamic> json) {
  return _SolicitacaoMaterialAddDTO.fromJson(json);
}

/// @nodoc
mixin _$SolicitacaoMaterialAddDTO {
  int get codUsuarioSolicitante => throw _privateConstructorUsedError;
  set codUsuarioSolicitante(int value) => throw _privateConstructorUsedError;
  int get situacao => throw _privateConstructorUsedError;
  set situacao(int value) => throw _privateConstructorUsedError;
  List<SolicitacaoMaterialItemModel> get solicitacoesMateriais =>
      throw _privateConstructorUsedError;
  set solicitacoesMateriais(List<SolicitacaoMaterialItemModel> value) =>
      throw _privateConstructorUsedError;
  String? get codBarraUsuarioAutorizacao => throw _privateConstructorUsedError;
  set codBarraUsuarioAutorizacao(String? value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SolicitacaoMaterialAddDTOCopyWith<SolicitacaoMaterialAddDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SolicitacaoMaterialAddDTOCopyWith<$Res> {
  factory $SolicitacaoMaterialAddDTOCopyWith(SolicitacaoMaterialAddDTO value,
          $Res Function(SolicitacaoMaterialAddDTO) then) =
      _$SolicitacaoMaterialAddDTOCopyWithImpl<$Res, SolicitacaoMaterialAddDTO>;
  @useResult
  $Res call(
      {int codUsuarioSolicitante,
      int situacao,
      List<SolicitacaoMaterialItemModel> solicitacoesMateriais,
      String? codBarraUsuarioAutorizacao});
}

/// @nodoc
class _$SolicitacaoMaterialAddDTOCopyWithImpl<$Res,
        $Val extends SolicitacaoMaterialAddDTO>
    implements $SolicitacaoMaterialAddDTOCopyWith<$Res> {
  _$SolicitacaoMaterialAddDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codUsuarioSolicitante = null,
    Object? situacao = null,
    Object? solicitacoesMateriais = null,
    Object? codBarraUsuarioAutorizacao = freezed,
  }) {
    return _then(_value.copyWith(
      codUsuarioSolicitante: null == codUsuarioSolicitante
          ? _value.codUsuarioSolicitante
          : codUsuarioSolicitante // ignore: cast_nullable_to_non_nullable
              as int,
      situacao: null == situacao
          ? _value.situacao
          : situacao // ignore: cast_nullable_to_non_nullable
              as int,
      solicitacoesMateriais: null == solicitacoesMateriais
          ? _value.solicitacoesMateriais
          : solicitacoesMateriais // ignore: cast_nullable_to_non_nullable
              as List<SolicitacaoMaterialItemModel>,
      codBarraUsuarioAutorizacao: freezed == codBarraUsuarioAutorizacao
          ? _value.codBarraUsuarioAutorizacao
          : codBarraUsuarioAutorizacao // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SolicitacaoMaterialAddDTOImplCopyWith<$Res>
    implements $SolicitacaoMaterialAddDTOCopyWith<$Res> {
  factory _$$SolicitacaoMaterialAddDTOImplCopyWith(
          _$SolicitacaoMaterialAddDTOImpl value,
          $Res Function(_$SolicitacaoMaterialAddDTOImpl) then) =
      __$$SolicitacaoMaterialAddDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int codUsuarioSolicitante,
      int situacao,
      List<SolicitacaoMaterialItemModel> solicitacoesMateriais,
      String? codBarraUsuarioAutorizacao});
}

/// @nodoc
class __$$SolicitacaoMaterialAddDTOImplCopyWithImpl<$Res>
    extends _$SolicitacaoMaterialAddDTOCopyWithImpl<$Res,
        _$SolicitacaoMaterialAddDTOImpl>
    implements _$$SolicitacaoMaterialAddDTOImplCopyWith<$Res> {
  __$$SolicitacaoMaterialAddDTOImplCopyWithImpl(
      _$SolicitacaoMaterialAddDTOImpl _value,
      $Res Function(_$SolicitacaoMaterialAddDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codUsuarioSolicitante = null,
    Object? situacao = null,
    Object? solicitacoesMateriais = null,
    Object? codBarraUsuarioAutorizacao = freezed,
  }) {
    return _then(_$SolicitacaoMaterialAddDTOImpl(
      codUsuarioSolicitante: null == codUsuarioSolicitante
          ? _value.codUsuarioSolicitante
          : codUsuarioSolicitante // ignore: cast_nullable_to_non_nullable
              as int,
      situacao: null == situacao
          ? _value.situacao
          : situacao // ignore: cast_nullable_to_non_nullable
              as int,
      solicitacoesMateriais: null == solicitacoesMateriais
          ? _value.solicitacoesMateriais
          : solicitacoesMateriais // ignore: cast_nullable_to_non_nullable
              as List<SolicitacaoMaterialItemModel>,
      codBarraUsuarioAutorizacao: freezed == codBarraUsuarioAutorizacao
          ? _value.codBarraUsuarioAutorizacao
          : codBarraUsuarioAutorizacao // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SolicitacaoMaterialAddDTOImpl
    with DiagnosticableTreeMixin
    implements _SolicitacaoMaterialAddDTO {
  _$SolicitacaoMaterialAddDTOImpl(
      {required this.codUsuarioSolicitante,
      required this.situacao,
      required this.solicitacoesMateriais,
      this.codBarraUsuarioAutorizacao});

  factory _$SolicitacaoMaterialAddDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$SolicitacaoMaterialAddDTOImplFromJson(json);

  @override
  int codUsuarioSolicitante;
  @override
  int situacao;
  @override
  List<SolicitacaoMaterialItemModel> solicitacoesMateriais;
  @override
  String? codBarraUsuarioAutorizacao;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SolicitacaoMaterialAddDTO(codUsuarioSolicitante: $codUsuarioSolicitante, situacao: $situacao, solicitacoesMateriais: $solicitacoesMateriais, codBarraUsuarioAutorizacao: $codBarraUsuarioAutorizacao)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SolicitacaoMaterialAddDTO'))
      ..add(DiagnosticsProperty('codUsuarioSolicitante', codUsuarioSolicitante))
      ..add(DiagnosticsProperty('situacao', situacao))
      ..add(DiagnosticsProperty('solicitacoesMateriais', solicitacoesMateriais))
      ..add(DiagnosticsProperty(
          'codBarraUsuarioAutorizacao', codBarraUsuarioAutorizacao));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SolicitacaoMaterialAddDTOImplCopyWith<_$SolicitacaoMaterialAddDTOImpl>
      get copyWith => __$$SolicitacaoMaterialAddDTOImplCopyWithImpl<
          _$SolicitacaoMaterialAddDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SolicitacaoMaterialAddDTOImplToJson(
      this,
    );
  }
}

abstract class _SolicitacaoMaterialAddDTO implements SolicitacaoMaterialAddDTO {
  factory _SolicitacaoMaterialAddDTO(
      {required int codUsuarioSolicitante,
      required int situacao,
      required List<SolicitacaoMaterialItemModel> solicitacoesMateriais,
      String? codBarraUsuarioAutorizacao}) = _$SolicitacaoMaterialAddDTOImpl;

  factory _SolicitacaoMaterialAddDTO.fromJson(Map<String, dynamic> json) =
      _$SolicitacaoMaterialAddDTOImpl.fromJson;

  @override
  int get codUsuarioSolicitante;
  set codUsuarioSolicitante(int value);
  @override
  int get situacao;
  set situacao(int value);
  @override
  List<SolicitacaoMaterialItemModel> get solicitacoesMateriais;
  set solicitacoesMateriais(List<SolicitacaoMaterialItemModel> value);
  @override
  String? get codBarraUsuarioAutorizacao;
  set codBarraUsuarioAutorizacao(String? value);
  @override
  @JsonKey(ignore: true)
  _$$SolicitacaoMaterialAddDTOImplCopyWith<_$SolicitacaoMaterialAddDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
