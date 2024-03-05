// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consulta_processos_leitura_devolvido_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConsultaProcessosLeituraDevolvidoModel
    _$ConsultaProcessosLeituraDevolvidoModelFromJson(
        Map<String, dynamic> json) {
  return _ConsultaProcessosLeituraDevolvidoModel.fromJson(json);
}

/// @nodoc
mixin _$ConsultaProcessosLeituraDevolvidoModel {
  int? get codLocal => throw _privateConstructorUsedError;
  set codLocal(int? value) => throw _privateConstructorUsedError;
  String? get nomeLocal => throw _privateConstructorUsedError;
  set nomeLocal(String? value) => throw _privateConstructorUsedError;
  int? get qtde => throw _privateConstructorUsedError;
  set qtde(int? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConsultaProcessosLeituraDevolvidoModelCopyWith<
          ConsultaProcessosLeituraDevolvidoModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsultaProcessosLeituraDevolvidoModelCopyWith<$Res> {
  factory $ConsultaProcessosLeituraDevolvidoModelCopyWith(
          ConsultaProcessosLeituraDevolvidoModel value,
          $Res Function(ConsultaProcessosLeituraDevolvidoModel) then) =
      _$ConsultaProcessosLeituraDevolvidoModelCopyWithImpl<$Res,
          ConsultaProcessosLeituraDevolvidoModel>;
  @useResult
  $Res call({int? codLocal, String? nomeLocal, int? qtde});
}

/// @nodoc
class _$ConsultaProcessosLeituraDevolvidoModelCopyWithImpl<$Res,
        $Val extends ConsultaProcessosLeituraDevolvidoModel>
    implements $ConsultaProcessosLeituraDevolvidoModelCopyWith<$Res> {
  _$ConsultaProcessosLeituraDevolvidoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codLocal = freezed,
    Object? nomeLocal = freezed,
    Object? qtde = freezed,
  }) {
    return _then(_value.copyWith(
      codLocal: freezed == codLocal
          ? _value.codLocal
          : codLocal // ignore: cast_nullable_to_non_nullable
              as int?,
      nomeLocal: freezed == nomeLocal
          ? _value.nomeLocal
          : nomeLocal // ignore: cast_nullable_to_non_nullable
              as String?,
      qtde: freezed == qtde
          ? _value.qtde
          : qtde // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConsultaProcessosLeituraDevolvidoModelImplCopyWith<$Res>
    implements $ConsultaProcessosLeituraDevolvidoModelCopyWith<$Res> {
  factory _$$ConsultaProcessosLeituraDevolvidoModelImplCopyWith(
          _$ConsultaProcessosLeituraDevolvidoModelImpl value,
          $Res Function(_$ConsultaProcessosLeituraDevolvidoModelImpl) then) =
      __$$ConsultaProcessosLeituraDevolvidoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? codLocal, String? nomeLocal, int? qtde});
}

/// @nodoc
class __$$ConsultaProcessosLeituraDevolvidoModelImplCopyWithImpl<$Res>
    extends _$ConsultaProcessosLeituraDevolvidoModelCopyWithImpl<$Res,
        _$ConsultaProcessosLeituraDevolvidoModelImpl>
    implements _$$ConsultaProcessosLeituraDevolvidoModelImplCopyWith<$Res> {
  __$$ConsultaProcessosLeituraDevolvidoModelImplCopyWithImpl(
      _$ConsultaProcessosLeituraDevolvidoModelImpl _value,
      $Res Function(_$ConsultaProcessosLeituraDevolvidoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codLocal = freezed,
    Object? nomeLocal = freezed,
    Object? qtde = freezed,
  }) {
    return _then(_$ConsultaProcessosLeituraDevolvidoModelImpl(
      codLocal: freezed == codLocal
          ? _value.codLocal
          : codLocal // ignore: cast_nullable_to_non_nullable
              as int?,
      nomeLocal: freezed == nomeLocal
          ? _value.nomeLocal
          : nomeLocal // ignore: cast_nullable_to_non_nullable
              as String?,
      qtde: freezed == qtde
          ? _value.qtde
          : qtde // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsultaProcessosLeituraDevolvidoModelImpl
    extends _ConsultaProcessosLeituraDevolvidoModel {
  _$ConsultaProcessosLeituraDevolvidoModelImpl(
      {required this.codLocal, required this.nomeLocal, required this.qtde})
      : super._();

  factory _$ConsultaProcessosLeituraDevolvidoModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ConsultaProcessosLeituraDevolvidoModelImplFromJson(json);

  @override
  int? codLocal;
  @override
  String? nomeLocal;
  @override
  int? qtde;

  @override
  String toString() {
    return 'ConsultaProcessosLeituraDevolvidoModel(codLocal: $codLocal, nomeLocal: $nomeLocal, qtde: $qtde)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsultaProcessosLeituraDevolvidoModelImplCopyWith<
          _$ConsultaProcessosLeituraDevolvidoModelImpl>
      get copyWith =>
          __$$ConsultaProcessosLeituraDevolvidoModelImplCopyWithImpl<
              _$ConsultaProcessosLeituraDevolvidoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsultaProcessosLeituraDevolvidoModelImplToJson(
      this,
    );
  }
}

abstract class _ConsultaProcessosLeituraDevolvidoModel
    extends ConsultaProcessosLeituraDevolvidoModel {
  factory _ConsultaProcessosLeituraDevolvidoModel(
      {required int? codLocal,
      required String? nomeLocal,
      required int? qtde}) = _$ConsultaProcessosLeituraDevolvidoModelImpl;
  _ConsultaProcessosLeituraDevolvidoModel._() : super._();

  factory _ConsultaProcessosLeituraDevolvidoModel.fromJson(
          Map<String, dynamic> json) =
      _$ConsultaProcessosLeituraDevolvidoModelImpl.fromJson;

  @override
  int? get codLocal;
  set codLocal(int? value);
  @override
  String? get nomeLocal;
  set nomeLocal(String? value);
  @override
  int? get qtde;
  set qtde(int? value);
  @override
  @JsonKey(ignore: true)
  _$$ConsultaProcessosLeituraDevolvidoModelImplCopyWith<
          _$ConsultaProcessosLeituraDevolvidoModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
