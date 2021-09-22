// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'inputs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FeedResponsePayload _$FeedResponsePayloadFromJson(Map<String, dynamic> json) {
  return _FeedResponsePayload.fromJson(json);
}

/// @nodoc
class _$FeedResponsePayloadTearOff {
  const _$FeedResponsePayloadTearOff();

  _FeedResponsePayload call(
      {@JsonKey(name: 'data') required GetFeedData data}) {
    return _FeedResponsePayload(
      data: data,
    );
  }

  FeedResponsePayload fromJson(Map<String, Object> json) {
    return FeedResponsePayload.fromJson(json);
  }
}

/// @nodoc
const $FeedResponsePayload = _$FeedResponsePayloadTearOff();

/// @nodoc
mixin _$FeedResponsePayload {
  @JsonKey(name: 'data')
  GetFeedData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeedResponsePayloadCopyWith<FeedResponsePayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedResponsePayloadCopyWith<$Res> {
  factory $FeedResponsePayloadCopyWith(
          FeedResponsePayload value, $Res Function(FeedResponsePayload) then) =
      _$FeedResponsePayloadCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'data') GetFeedData data});

  $GetFeedDataCopyWith<$Res> get data;
}

/// @nodoc
class _$FeedResponsePayloadCopyWithImpl<$Res>
    implements $FeedResponsePayloadCopyWith<$Res> {
  _$FeedResponsePayloadCopyWithImpl(this._value, this._then);

  final FeedResponsePayload _value;
  // ignore: unused_field
  final $Res Function(FeedResponsePayload) _then;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as GetFeedData,
    ));
  }

  @override
  $GetFeedDataCopyWith<$Res> get data {
    return $GetFeedDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
abstract class _$FeedResponsePayloadCopyWith<$Res>
    implements $FeedResponsePayloadCopyWith<$Res> {
  factory _$FeedResponsePayloadCopyWith(_FeedResponsePayload value,
          $Res Function(_FeedResponsePayload) then) =
      __$FeedResponsePayloadCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'data') GetFeedData data});

  @override
  $GetFeedDataCopyWith<$Res> get data;
}

/// @nodoc
class __$FeedResponsePayloadCopyWithImpl<$Res>
    extends _$FeedResponsePayloadCopyWithImpl<$Res>
    implements _$FeedResponsePayloadCopyWith<$Res> {
  __$FeedResponsePayloadCopyWithImpl(
      _FeedResponsePayload _value, $Res Function(_FeedResponsePayload) _then)
      : super(_value, (v) => _then(v as _FeedResponsePayload));

  @override
  _FeedResponsePayload get _value => super._value as _FeedResponsePayload;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_FeedResponsePayload(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as GetFeedData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FeedResponsePayload implements _FeedResponsePayload {
  _$_FeedResponsePayload({@JsonKey(name: 'data') required this.data});

  factory _$_FeedResponsePayload.fromJson(Map<String, dynamic> json) =>
      _$_$_FeedResponsePayloadFromJson(json);

  @override
  @JsonKey(name: 'data')
  final GetFeedData data;

  @override
  String toString() {
    return 'FeedResponsePayload(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FeedResponsePayload &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  _$FeedResponsePayloadCopyWith<_FeedResponsePayload> get copyWith =>
      __$FeedResponsePayloadCopyWithImpl<_FeedResponsePayload>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FeedResponsePayloadToJson(this);
  }
}

abstract class _FeedResponsePayload implements FeedResponsePayload {
  factory _FeedResponsePayload(
          {@JsonKey(name: 'data') required GetFeedData data}) =
      _$_FeedResponsePayload;

  factory _FeedResponsePayload.fromJson(Map<String, dynamic> json) =
      _$_FeedResponsePayload.fromJson;

  @override
  @JsonKey(name: 'data')
  GetFeedData get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FeedResponsePayloadCopyWith<_FeedResponsePayload> get copyWith =>
      throw _privateConstructorUsedError;
}

GetFeedData _$GetFeedDataFromJson(Map<String, dynamic> json) {
  return _GetFeedData.fromJson(json);
}

/// @nodoc
class _$GetFeedDataTearOff {
  const _$GetFeedDataTearOff();

  _GetFeedData call({@JsonKey(name: 'getFeed') required Feed getFeed}) {
    return _GetFeedData(
      getFeed: getFeed,
    );
  }

  GetFeedData fromJson(Map<String, Object> json) {
    return GetFeedData.fromJson(json);
  }
}

/// @nodoc
const $GetFeedData = _$GetFeedDataTearOff();

/// @nodoc
mixin _$GetFeedData {
  @JsonKey(name: 'getFeed')
  Feed get getFeed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetFeedDataCopyWith<GetFeedData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetFeedDataCopyWith<$Res> {
  factory $GetFeedDataCopyWith(
          GetFeedData value, $Res Function(GetFeedData) then) =
      _$GetFeedDataCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'getFeed') Feed getFeed});

  $FeedCopyWith<$Res> get getFeed;
}

/// @nodoc
class _$GetFeedDataCopyWithImpl<$Res> implements $GetFeedDataCopyWith<$Res> {
  _$GetFeedDataCopyWithImpl(this._value, this._then);

  final GetFeedData _value;
  // ignore: unused_field
  final $Res Function(GetFeedData) _then;

  @override
  $Res call({
    Object? getFeed = freezed,
  }) {
    return _then(_value.copyWith(
      getFeed: getFeed == freezed
          ? _value.getFeed
          : getFeed // ignore: cast_nullable_to_non_nullable
              as Feed,
    ));
  }

  @override
  $FeedCopyWith<$Res> get getFeed {
    return $FeedCopyWith<$Res>(_value.getFeed, (value) {
      return _then(_value.copyWith(getFeed: value));
    });
  }
}

/// @nodoc
abstract class _$GetFeedDataCopyWith<$Res>
    implements $GetFeedDataCopyWith<$Res> {
  factory _$GetFeedDataCopyWith(
          _GetFeedData value, $Res Function(_GetFeedData) then) =
      __$GetFeedDataCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'getFeed') Feed getFeed});

  @override
  $FeedCopyWith<$Res> get getFeed;
}

/// @nodoc
class __$GetFeedDataCopyWithImpl<$Res> extends _$GetFeedDataCopyWithImpl<$Res>
    implements _$GetFeedDataCopyWith<$Res> {
  __$GetFeedDataCopyWithImpl(
      _GetFeedData _value, $Res Function(_GetFeedData) _then)
      : super(_value, (v) => _then(v as _GetFeedData));

  @override
  _GetFeedData get _value => super._value as _GetFeedData;

  @override
  $Res call({
    Object? getFeed = freezed,
  }) {
    return _then(_GetFeedData(
      getFeed: getFeed == freezed
          ? _value.getFeed
          : getFeed // ignore: cast_nullable_to_non_nullable
              as Feed,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GetFeedData implements _GetFeedData {
  _$_GetFeedData({@JsonKey(name: 'getFeed') required this.getFeed});

  factory _$_GetFeedData.fromJson(Map<String, dynamic> json) =>
      _$_$_GetFeedDataFromJson(json);

  @override
  @JsonKey(name: 'getFeed')
  final Feed getFeed;

  @override
  String toString() {
    return 'GetFeedData(getFeed: $getFeed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GetFeedData &&
            (identical(other.getFeed, getFeed) ||
                const DeepCollectionEquality().equals(other.getFeed, getFeed)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(getFeed);

  @JsonKey(ignore: true)
  @override
  _$GetFeedDataCopyWith<_GetFeedData> get copyWith =>
      __$GetFeedDataCopyWithImpl<_GetFeedData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GetFeedDataToJson(this);
  }
}

abstract class _GetFeedData implements GetFeedData {
  factory _GetFeedData({@JsonKey(name: 'getFeed') required Feed getFeed}) =
      _$_GetFeedData;

  factory _GetFeedData.fromJson(Map<String, dynamic> json) =
      _$_GetFeedData.fromJson;

  @override
  @JsonKey(name: 'getFeed')
  Feed get getFeed => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GetFeedDataCopyWith<_GetFeedData> get copyWith =>
      throw _privateConstructorUsedError;
}
