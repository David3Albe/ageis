// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'training_record_user_print_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TrainingRecordUserPrintDTO _$TrainingRecordUserPrintDTOFromJson(
    Map<String, dynamic> json) {
  return _TrainingRecordUserPrintDTO.fromJson(json);
}

/// @nodoc
mixin _$TrainingRecordUserPrintDTO {
  String get userName => throw _privateConstructorUsedError;
  set userName(String value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrainingRecordUserPrintDTOCopyWith<TrainingRecordUserPrintDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrainingRecordUserPrintDTOCopyWith<$Res> {
  factory $TrainingRecordUserPrintDTOCopyWith(TrainingRecordUserPrintDTO value,
          $Res Function(TrainingRecordUserPrintDTO) then) =
      _$TrainingRecordUserPrintDTOCopyWithImpl<$Res,
          TrainingRecordUserPrintDTO>;
  @useResult
  $Res call({String userName});
}

/// @nodoc
class _$TrainingRecordUserPrintDTOCopyWithImpl<$Res,
        $Val extends TrainingRecordUserPrintDTO>
    implements $TrainingRecordUserPrintDTOCopyWith<$Res> {
  _$TrainingRecordUserPrintDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
  }) {
    return _then(_value.copyWith(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrainingRecordUserPrintDTOImplCopyWith<$Res>
    implements $TrainingRecordUserPrintDTOCopyWith<$Res> {
  factory _$$TrainingRecordUserPrintDTOImplCopyWith(
          _$TrainingRecordUserPrintDTOImpl value,
          $Res Function(_$TrainingRecordUserPrintDTOImpl) then) =
      __$$TrainingRecordUserPrintDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userName});
}

/// @nodoc
class __$$TrainingRecordUserPrintDTOImplCopyWithImpl<$Res>
    extends _$TrainingRecordUserPrintDTOCopyWithImpl<$Res,
        _$TrainingRecordUserPrintDTOImpl>
    implements _$$TrainingRecordUserPrintDTOImplCopyWith<$Res> {
  __$$TrainingRecordUserPrintDTOImplCopyWithImpl(
      _$TrainingRecordUserPrintDTOImpl _value,
      $Res Function(_$TrainingRecordUserPrintDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
  }) {
    return _then(_$TrainingRecordUserPrintDTOImpl(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrainingRecordUserPrintDTOImpl
    with DiagnosticableTreeMixin
    implements _TrainingRecordUserPrintDTO {
  _$TrainingRecordUserPrintDTOImpl({required this.userName});

  factory _$TrainingRecordUserPrintDTOImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$TrainingRecordUserPrintDTOImplFromJson(json);

  @override
  String userName;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TrainingRecordUserPrintDTO(userName: $userName)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TrainingRecordUserPrintDTO'))
      ..add(DiagnosticsProperty('userName', userName));
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrainingRecordUserPrintDTOImplCopyWith<_$TrainingRecordUserPrintDTOImpl>
      get copyWith => __$$TrainingRecordUserPrintDTOImplCopyWithImpl<
          _$TrainingRecordUserPrintDTOImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrainingRecordUserPrintDTOImplToJson(
      this,
    );
  }
}

abstract class _TrainingRecordUserPrintDTO
    implements TrainingRecordUserPrintDTO {
  factory _TrainingRecordUserPrintDTO({required String userName}) =
      _$TrainingRecordUserPrintDTOImpl;

  factory _TrainingRecordUserPrintDTO.fromJson(Map<String, dynamic> json) =
      _$TrainingRecordUserPrintDTOImpl.fromJson;

  @override
  String get userName;
  set userName(String value);
  @override
  @JsonKey(ignore: true)
  _$$TrainingRecordUserPrintDTOImplCopyWith<_$TrainingRecordUserPrintDTOImpl>
      get copyWith => throw _privateConstructorUsedError;
}
