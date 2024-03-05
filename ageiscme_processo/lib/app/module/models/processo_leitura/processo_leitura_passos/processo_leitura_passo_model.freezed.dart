// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'processo_leitura_passo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProcessoLeituraPassoModel _$ProcessoLeituraPassoModelFromJson(
    Map<String, dynamic> json) {
  return _ProcessoLeituraPassoModel.fromJson(json);
}

/// @nodoc
mixin _$ProcessoLeituraPassoModel {
  int get tipoPasso => throw _privateConstructorUsedError;
  set tipoPasso(int value) => throw _privateConstructorUsedError;
  String get descricao => throw _privateConstructorUsedError;
  set descricao(String value) => throw _privateConstructorUsedError;
  int get situacao => throw _privateConstructorUsedError;
  set situacao(int value) => throw _privateConstructorUsedError;
  int get ordem => throw _privateConstructorUsedError;
  set ordem(int value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProcessoLeituraPassoModelCopyWith<ProcessoLeituraPassoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcessoLeituraPassoModelCopyWith<$Res> {
  factory $ProcessoLeituraPassoModelCopyWith(ProcessoLeituraPassoModel value,
          $Res Function(ProcessoLeituraPassoModel) then) =
      _$ProcessoLeituraPassoModelCopyWithImpl<$Res, ProcessoLeituraPassoModel>;
  @useResult
  $Res call({int tipoPasso, String descricao, int situacao, int ordem});
}

/// @nodoc
class _$ProcessoLeituraPassoModelCopyWithImpl<$Res,
        $Val extends ProcessoLeituraPassoModel>
    implements $ProcessoLeituraPassoModelCopyWith<$Res> {
  _$ProcessoLeituraPassoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tipoPasso = null,
    Object? descricao = null,
    Object? situacao = null,
    Object? ordem = null,
  }) {
    return _then(_value.copyWith(
      tipoPasso: null == tipoPasso
          ? _value.tipoPasso
          : tipoPasso // ignore: cast_nullable_to_non_nullable
              as int,
      descricao: null == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String,
      situacao: null == situacao
          ? _value.situacao
          : situacao // ignore: cast_nullable_to_non_nullable
              as int,
      ordem: null == ordem
          ? _value.ordem
          : ordem // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProcessoLeituraPassoModelImplCopyWith<$Res>
    implements $ProcessoLeituraPassoModelCopyWith<$Res> {
  factory _$$ProcessoLeituraPassoModelImplCopyWith(
          _$ProcessoLeituraPassoModelImpl value,
          $Res Function(_$ProcessoLeituraPassoModelImpl) then) =
      __$$ProcessoLeituraPassoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int tipoPasso, String descricao, int situacao, int ordem});
}

/// @nodoc
class __$$ProcessoLeituraPassoModelImplCopyWithImpl<$Res>
    extends _$ProcessoLeituraPassoModelCopyWithImpl<$Res,
        _$ProcessoLeituraPassoModelImpl>
    implements _$$ProcessoLeituraPassoModelImplCopyWith<$Res> {
  __$$ProcessoLeituraPassoModelImplCopyWithImpl(
      _$ProcessoLeituraPassoModelImpl _value,
      $Res Function(_$ProcessoLeituraPassoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tipoPasso = null,
    Object? descricao = null,
    Object? situacao = null,
    Object? ordem = null,
  }) {
    return _then(_$ProcessoLeituraPassoModelImpl(
      tipoPasso: null == tipoPasso
          ? _value.tipoPasso
          : tipoPasso // ignore: cast_nullable_to_non_nullable
              as int,
      descricao: null == descricao
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String,
      situacao: null == situacao
          ? _value.situacao
          : situacao // ignore: cast_nullable_to_non_nullable
              as int,
      ordem: null == ordem
          ? _value.ordem
          : ordem // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProcessoLeituraPassoModelImpl extends _ProcessoLeituraPassoModel
    with DiagnosticableTreeMixin {
  _$ProcessoLeituraPassoModelImpl(
      {required this.tipoPasso,
      required this.descricao,
      required this.situacao,
      required this.ordem})
      : super._();

  factory _$ProcessoLeituraPassoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProcessoLeituraPassoModelImplFromJson(json);

  @override
  int tipoPasso;
  @override
  String descricao;
  @override
  int situacao;
  @override
  int ordem;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProcessoLeituraPassoModel(tipoPasso: $tipoPasso, descricao: $descricao, situacao: $situacao, ordem: $ordem)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProcessoLeituraPassoModel'))
      ..add(DiagnosticsProperty('tipoPasso', tipoPasso))
      ..add(DiagnosticsProperty('descricao', descricao))
      ..add(DiagnosticsProperty('situacao', situacao))
      ..add(DiagnosticsProperty('ordem', ordem));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcessoLeituraPassoModelImplCopyWith<_$ProcessoLeituraPassoModelImpl>
      get copyWith => __$$ProcessoLeituraPassoModelImplCopyWithImpl<
          _$ProcessoLeituraPassoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProcessoLeituraPassoModelImplToJson(
      this,
    );
  }
}

abstract class _ProcessoLeituraPassoModel extends ProcessoLeituraPassoModel {
  factory _ProcessoLeituraPassoModel(
      {required int tipoPasso,
      required String descricao,
      required int situacao,
      required int ordem}) = _$ProcessoLeituraPassoModelImpl;
  _ProcessoLeituraPassoModel._() : super._();

  factory _ProcessoLeituraPassoModel.fromJson(Map<String, dynamic> json) =
      _$ProcessoLeituraPassoModelImpl.fromJson;

  @override
  int get tipoPasso;
  set tipoPasso(int value);
  @override
  String get descricao;
  set descricao(String value);
  @override
  int get situacao;
  set situacao(int value);
  @override
  int get ordem;
  set ordem(int value);
  @override
  @JsonKey(ignore: true)
  _$$ProcessoLeituraPassoModelImplCopyWith<_$ProcessoLeituraPassoModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
