// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'processo_leitura_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProcessoLeituraFilter _$ProcessoLeituraFilterFromJson(
    Map<String, dynamic> json) {
  return _ProcessoLeituraFilter.fromJson(json);
}

/// @nodoc
mixin _$ProcessoLeituraFilter {
  int? get codItem => throw _privateConstructorUsedError;
  set codItem(int? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProcessoLeituraFilterCopyWith<ProcessoLeituraFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcessoLeituraFilterCopyWith<$Res> {
  factory $ProcessoLeituraFilterCopyWith(ProcessoLeituraFilter value,
          $Res Function(ProcessoLeituraFilter) then) =
      _$ProcessoLeituraFilterCopyWithImpl<$Res, ProcessoLeituraFilter>;
  @useResult
  $Res call({int? codItem});
}

/// @nodoc
class _$ProcessoLeituraFilterCopyWithImpl<$Res,
        $Val extends ProcessoLeituraFilter>
    implements $ProcessoLeituraFilterCopyWith<$Res> {
  _$ProcessoLeituraFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codItem = freezed,
  }) {
    return _then(_value.copyWith(
      codItem: freezed == codItem
          ? _value.codItem
          : codItem // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProcessoLeituraFilterImplCopyWith<$Res>
    implements $ProcessoLeituraFilterCopyWith<$Res> {
  factory _$$ProcessoLeituraFilterImplCopyWith(
          _$ProcessoLeituraFilterImpl value,
          $Res Function(_$ProcessoLeituraFilterImpl) then) =
      __$$ProcessoLeituraFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? codItem});
}

/// @nodoc
class __$$ProcessoLeituraFilterImplCopyWithImpl<$Res>
    extends _$ProcessoLeituraFilterCopyWithImpl<$Res,
        _$ProcessoLeituraFilterImpl>
    implements _$$ProcessoLeituraFilterImplCopyWith<$Res> {
  __$$ProcessoLeituraFilterImplCopyWithImpl(_$ProcessoLeituraFilterImpl _value,
      $Res Function(_$ProcessoLeituraFilterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? codItem = freezed,
  }) {
    return _then(_$ProcessoLeituraFilterImpl(
      codItem: freezed == codItem
          ? _value.codItem
          : codItem // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProcessoLeituraFilterImpl implements _ProcessoLeituraFilter {
  _$ProcessoLeituraFilterImpl({required this.codItem});

  factory _$ProcessoLeituraFilterImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProcessoLeituraFilterImplFromJson(json);

  @override
  int? codItem;

  @override
  String toString() {
    return 'ProcessoLeituraFilter(codItem: $codItem)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcessoLeituraFilterImplCopyWith<_$ProcessoLeituraFilterImpl>
      get copyWith => __$$ProcessoLeituraFilterImplCopyWithImpl<
          _$ProcessoLeituraFilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProcessoLeituraFilterImplToJson(
      this,
    );
  }
}

abstract class _ProcessoLeituraFilter implements ProcessoLeituraFilter {
  factory _ProcessoLeituraFilter({required int? codItem}) =
      _$ProcessoLeituraFilterImpl;

  factory _ProcessoLeituraFilter.fromJson(Map<String, dynamic> json) =
      _$ProcessoLeituraFilterImpl.fromJson;

  @override
  int? get codItem;
  set codItem(int? value);
  @override
  @JsonKey(ignore: true)
  _$$ProcessoLeituraFilterImplCopyWith<_$ProcessoLeituraFilterImpl>
      get copyWith => throw _privateConstructorUsedError;
}
