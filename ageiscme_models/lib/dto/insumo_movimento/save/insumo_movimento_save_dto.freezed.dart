// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'insumo_movimento_save_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InsumoMovimentoSaveDTO _$InsumoMovimentoSaveDTOFromJson(
    Map<String, dynamic> json) {
  return _InsumoMovimentoSaveDTO.fromJson(json);
}

/// @nodoc
mixin _$InsumoMovimentoSaveDTO {
  InsumoMovimentoModel get insumoMovimento =>
      throw _privateConstructorUsedError;
  set insumoMovimento(InsumoMovimentoModel value) =>
      throw _privateConstructorUsedError;
  int? get numeroSolicitacaoItem => throw _privateConstructorUsedError;
  set numeroSolicitacaoItem(int? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InsumoMovimentoSaveDTOCopyWith<InsumoMovimentoSaveDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InsumoMovimentoSaveDTOCopyWith<$Res> {
  factory $InsumoMovimentoSaveDTOCopyWith(InsumoMovimentoSaveDTO value,
          $Res Function(InsumoMovimentoSaveDTO) then) =
      _$InsumoMovimentoSaveDTOCopyWithImpl<$Res, InsumoMovimentoSaveDTO>;
  @useResult
  $Res call({InsumoMovimentoModel insumoMovimento, int? numeroSolicitacaoItem});

  $InsumoMovimentoModelCopyWith<$Res> get insumoMovimento;
}

/// @nodoc
class _$InsumoMovimentoSaveDTOCopyWithImpl<$Res,
        $Val extends InsumoMovimentoSaveDTO>
    implements $InsumoMovimentoSaveDTOCopyWith<$Res> {
  _$InsumoMovimentoSaveDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? insumoMovimento = null,
    Object? numeroSolicitacaoItem = freezed,
  }) {
    return _then(_value.copyWith(
      insumoMovimento: null == insumoMovimento
          ? _value.insumoMovimento
          : insumoMovimento // ignore: cast_nullable_to_non_nullable
              as InsumoMovimentoModel,
      numeroSolicitacaoItem: freezed == numeroSolicitacaoItem
          ? _value.numeroSolicitacaoItem
          : numeroSolicitacaoItem // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $InsumoMovimentoModelCopyWith<$Res> get insumoMovimento {
    return $InsumoMovimentoModelCopyWith<$Res>(_value.insumoMovimento, (value) {
      return _then(_value.copyWith(insumoMovimento: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InsumoMovimentoSaveDTOImplCopyWith<$Res>
    implements $InsumoMovimentoSaveDTOCopyWith<$Res> {
  factory _$$InsumoMovimentoSaveDTOImplCopyWith(
          _$InsumoMovimentoSaveDTOImpl value,
          $Res Function(_$InsumoMovimentoSaveDTOImpl) then) =
      __$$InsumoMovimentoSaveDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({InsumoMovimentoModel insumoMovimento, int? numeroSolicitacaoItem});

  @override
  $InsumoMovimentoModelCopyWith<$Res> get insumoMovimento;
}

/// @nodoc
class __$$InsumoMovimentoSaveDTOImplCopyWithImpl<$Res>
    extends _$InsumoMovimentoSaveDTOCopyWithImpl<$Res,
        _$InsumoMovimentoSaveDTOImpl>
    implements _$$InsumoMovimentoSaveDTOImplCopyWith<$Res> {
  __$$InsumoMovimentoSaveDTOImplCopyWithImpl(
      _$InsumoMovimentoSaveDTOImpl _value,
      $Res Function(_$InsumoMovimentoSaveDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? insumoMovimento = null,
    Object? numeroSolicitacaoItem = freezed,
  }) {
    return _then(_$InsumoMovimentoSaveDTOImpl(
      insumoMovimento: null == insumoMovimento
          ? _value.insumoMovimento
          : insumoMovimento // ignore: cast_nullable_to_non_nullable
              as InsumoMovimentoModel,
      numeroSolicitacaoItem: freezed == numeroSolicitacaoItem
          ? _value.numeroSolicitacaoItem
          : numeroSolicitacaoItem // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InsumoMovimentoSaveDTOImpl
    with DiagnosticableTreeMixin
    implements _InsumoMovimentoSaveDTO {
  _$InsumoMovimentoSaveDTOImpl(
      {required this.insumoMovimento, this.numeroSolicitacaoItem});

  factory _$InsumoMovimentoSaveDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$InsumoMovimentoSaveDTOImplFromJson(json);

  @override
  InsumoMovimentoModel insumoMovimento;
  @override
  int? numeroSolicitacaoItem;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'InsumoMovimentoSaveDTO(insumoMovimento: $insumoMovimento, numeroSolicitacaoItem: $numeroSolicitacaoItem)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'InsumoMovimentoSaveDTO'))
      ..add(DiagnosticsProperty('insumoMovimento', insumoMovimento))
      ..add(
          DiagnosticsProperty('numeroSolicitacaoItem', numeroSolicitacaoItem));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InsumoMovimentoSaveDTOImplCopyWith<_$InsumoMovimentoSaveDTOImpl>
      get copyWith => __$$InsumoMovimentoSaveDTOImplCopyWithImpl<
          _$InsumoMovimentoSaveDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InsumoMovimentoSaveDTOImplToJson(
      this,
    );
  }
}

abstract class _InsumoMovimentoSaveDTO implements InsumoMovimentoSaveDTO {
  factory _InsumoMovimentoSaveDTO(
      {required InsumoMovimentoModel insumoMovimento,
      int? numeroSolicitacaoItem}) = _$InsumoMovimentoSaveDTOImpl;

  factory _InsumoMovimentoSaveDTO.fromJson(Map<String, dynamic> json) =
      _$InsumoMovimentoSaveDTOImpl.fromJson;

  @override
  InsumoMovimentoModel get insumoMovimento;
  set insumoMovimento(InsumoMovimentoModel value);
  @override
  int? get numeroSolicitacaoItem;
  set numeroSolicitacaoItem(int? value);
  @override
  @JsonKey(ignore: true)
  _$$InsumoMovimentoSaveDTOImplCopyWith<_$InsumoMovimentoSaveDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
