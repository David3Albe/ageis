// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'command_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CommandResultModel _$CommandResultModelFromJson(Map<String, dynamic> json) {
  return _CommandResultModel.fromJson(json);
}

/// @nodoc
mixin _$CommandResultModel {
  bool get success => throw _privateConstructorUsedError;
  set success(bool value) => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  set message(String value) => throw _privateConstructorUsedError;
  dynamic get data => throw _privateConstructorUsedError;
  set data(dynamic value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommandResultModelCopyWith<CommandResultModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommandResultModelCopyWith<$Res> {
  factory $CommandResultModelCopyWith(
          CommandResultModel value, $Res Function(CommandResultModel) then) =
      _$CommandResultModelCopyWithImpl<$Res, CommandResultModel>;
  @useResult
  $Res call({bool success, String message, dynamic data});
}

/// @nodoc
class _$CommandResultModelCopyWithImpl<$Res, $Val extends CommandResultModel>
    implements $CommandResultModelCopyWith<$Res> {
  _$CommandResultModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommandResultModelImplCopyWith<$Res>
    implements $CommandResultModelCopyWith<$Res> {
  factory _$$CommandResultModelImplCopyWith(_$CommandResultModelImpl value,
          $Res Function(_$CommandResultModelImpl) then) =
      __$$CommandResultModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, dynamic data});
}

/// @nodoc
class __$$CommandResultModelImplCopyWithImpl<$Res>
    extends _$CommandResultModelCopyWithImpl<$Res, _$CommandResultModelImpl>
    implements _$$CommandResultModelImplCopyWith<$Res> {
  __$$CommandResultModelImplCopyWithImpl(_$CommandResultModelImpl _value,
      $Res Function(_$CommandResultModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$CommandResultModelImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommandResultModelImpl
    with DiagnosticableTreeMixin
    implements _CommandResultModel {
  _$CommandResultModelImpl(
      {required this.success, required this.message, required this.data});

  factory _$CommandResultModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommandResultModelImplFromJson(json);

  @override
  bool success;
  @override
  String message;
  @override
  dynamic data;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CommandResultModel(success: $success, message: $message, data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CommandResultModel'))
      ..add(DiagnosticsProperty('success', success))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('data', data));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommandResultModelImplCopyWith<_$CommandResultModelImpl> get copyWith =>
      __$$CommandResultModelImplCopyWithImpl<_$CommandResultModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommandResultModelImplToJson(
      this,
    );
  }
}

abstract class _CommandResultModel implements CommandResultModel {
  factory _CommandResultModel(
      {required bool success,
      required String message,
      required dynamic data}) = _$CommandResultModelImpl;

  factory _CommandResultModel.fromJson(Map<String, dynamic> json) =
      _$CommandResultModelImpl.fromJson;

  @override
  bool get success;
  set success(bool value);
  @override
  String get message;
  set message(String value);
  @override
  dynamic get data;
  set data(dynamic value);
  @override
  @JsonKey(ignore: true)
  _$$CommandResultModelImplCopyWith<_$CommandResultModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
