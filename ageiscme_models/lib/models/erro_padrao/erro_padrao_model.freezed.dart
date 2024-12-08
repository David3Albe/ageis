// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'erro_padrao_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ErroPadraoModel _$ErroPadraoModelFromJson(Map<String, dynamic> json) {
  return _ErroPadraoModel.fromJson(json);
}

/// @nodoc
mixin _$ErroPadraoModel {
  String? get message => throw _privateConstructorUsedError;
  set message(String? value) => throw _privateConstructorUsedError;
  dynamic get data => throw _privateConstructorUsedError;
  set data(dynamic value) => throw _privateConstructorUsedError;
  String? get Message => throw _privateConstructorUsedError;
  set Message(String? value) => throw _privateConstructorUsedError;
  dynamic get Data => throw _privateConstructorUsedError;
  set Data(dynamic value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ErroPadraoModelCopyWith<ErroPadraoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErroPadraoModelCopyWith<$Res> {
  factory $ErroPadraoModelCopyWith(
          ErroPadraoModel value, $Res Function(ErroPadraoModel) then) =
      _$ErroPadraoModelCopyWithImpl<$Res, ErroPadraoModel>;
  @useResult
  $Res call({String? message, dynamic data, String? Message, dynamic Data});
}

/// @nodoc
class _$ErroPadraoModelCopyWithImpl<$Res, $Val extends ErroPadraoModel>
    implements $ErroPadraoModelCopyWith<$Res> {
  _$ErroPadraoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? data = freezed,
    Object? Message = freezed,
    Object? Data = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Message: freezed == Message
          ? _value.Message
          : Message // ignore: cast_nullable_to_non_nullable
              as String?,
      Data: freezed == Data
          ? _value.Data
          : Data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ErroPadraoModelImplCopyWith<$Res>
    implements $ErroPadraoModelCopyWith<$Res> {
  factory _$$ErroPadraoModelImplCopyWith(_$ErroPadraoModelImpl value,
          $Res Function(_$ErroPadraoModelImpl) then) =
      __$$ErroPadraoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, dynamic data, String? Message, dynamic Data});
}

/// @nodoc
class __$$ErroPadraoModelImplCopyWithImpl<$Res>
    extends _$ErroPadraoModelCopyWithImpl<$Res, _$ErroPadraoModelImpl>
    implements _$$ErroPadraoModelImplCopyWith<$Res> {
  __$$ErroPadraoModelImplCopyWithImpl(
      _$ErroPadraoModelImpl _value, $Res Function(_$ErroPadraoModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? data = freezed,
    Object? Message = freezed,
    Object? Data = freezed,
  }) {
    return _then(_$ErroPadraoModelImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
      Message: freezed == Message
          ? _value.Message
          : Message // ignore: cast_nullable_to_non_nullable
              as String?,
      Data: freezed == Data
          ? _value.Data
          : Data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ErroPadraoModelImpl extends _ErroPadraoModel
    with DiagnosticableTreeMixin {
  _$ErroPadraoModelImpl(
      {required this.message,
      required this.data,
      required this.Message,
      required this.Data})
      : super._();

  factory _$ErroPadraoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ErroPadraoModelImplFromJson(json);

  @override
  String? message;
  @override
  dynamic data;
  @override
  String? Message;
  @override
  dynamic Data;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ErroPadraoModel(message: $message, data: $data, Message: $Message, Data: $Data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ErroPadraoModel'))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('data', data))
      ..add(DiagnosticsProperty('Message', Message))
      ..add(DiagnosticsProperty('Data', Data));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErroPadraoModelImplCopyWith<_$ErroPadraoModelImpl> get copyWith =>
      __$$ErroPadraoModelImplCopyWithImpl<_$ErroPadraoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ErroPadraoModelImplToJson(
      this,
    );
  }
}

abstract class _ErroPadraoModel extends ErroPadraoModel {
  factory _ErroPadraoModel(
      {required String? message,
      required dynamic data,
      required String? Message,
      required dynamic Data}) = _$ErroPadraoModelImpl;
  _ErroPadraoModel._() : super._();

  factory _ErroPadraoModel.fromJson(Map<String, dynamic> json) =
      _$ErroPadraoModelImpl.fromJson;

  @override
  String? get message;
  set message(String? value);
  @override
  dynamic get data;
  set data(dynamic value);
  @override
  String? get Message;
  set Message(String? value);
  @override
  dynamic get Data;
  set Data(dynamic value);
  @override
  @JsonKey(ignore: true)
  _$$ErroPadraoModelImplCopyWith<_$ErroPadraoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
