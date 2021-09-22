// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'context.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Context _$ContextFromJson(Map<String, dynamic> json) {
  return _Context.fromJson(json);
}

/// @nodoc
class _$ContextTearOff {
  const _$ContextTearOff();

  _Context call(
      {@JsonKey(name: 'userID')
          String? userID,
      @JsonKey(name: 'flavour', unknownEnumValue: Flavour.UNKNOWN)
          Flavour? flavour,
      @JsonKey(name: 'organizationID')
          String? organizationID,
      @JsonKey(name: 'locationID')
          String? locationID,
      @JsonKey(name: 'timestamp')
          String? timestamp}) {
    return _Context(
      userID: userID,
      flavour: flavour,
      organizationID: organizationID,
      locationID: locationID,
      timestamp: timestamp,
    );
  }

  Context fromJson(Map<String, Object> json) {
    return Context.fromJson(json);
  }
}

/// @nodoc
const $Context = _$ContextTearOff();

/// @nodoc
mixin _$Context {
  @JsonKey(name: 'userID')
  String? get userID => throw _privateConstructorUsedError;
  @JsonKey(name: 'flavour', unknownEnumValue: Flavour.UNKNOWN)
  Flavour? get flavour => throw _privateConstructorUsedError;
  @JsonKey(name: 'organizationID')
  String? get organizationID => throw _privateConstructorUsedError;
  @JsonKey(name: 'locationID')
  String? get locationID => throw _privateConstructorUsedError;
  @JsonKey(name: 'timestamp')
  String? get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContextCopyWith<Context> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContextCopyWith<$Res> {
  factory $ContextCopyWith(Context value, $Res Function(Context) then) =
      _$ContextCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'userID')
          String? userID,
      @JsonKey(name: 'flavour', unknownEnumValue: Flavour.UNKNOWN)
          Flavour? flavour,
      @JsonKey(name: 'organizationID')
          String? organizationID,
      @JsonKey(name: 'locationID')
          String? locationID,
      @JsonKey(name: 'timestamp')
          String? timestamp});
}

/// @nodoc
class _$ContextCopyWithImpl<$Res> implements $ContextCopyWith<$Res> {
  _$ContextCopyWithImpl(this._value, this._then);

  final Context _value;
  // ignore: unused_field
  final $Res Function(Context) _then;

  @override
  $Res call({
    Object? userID = freezed,
    Object? flavour = freezed,
    Object? organizationID = freezed,
    Object? locationID = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_value.copyWith(
      userID: userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String?,
      flavour: flavour == freezed
          ? _value.flavour
          : flavour // ignore: cast_nullable_to_non_nullable
              as Flavour?,
      organizationID: organizationID == freezed
          ? _value.organizationID
          : organizationID // ignore: cast_nullable_to_non_nullable
              as String?,
      locationID: locationID == freezed
          ? _value.locationID
          : locationID // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ContextCopyWith<$Res> implements $ContextCopyWith<$Res> {
  factory _$ContextCopyWith(_Context value, $Res Function(_Context) then) =
      __$ContextCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'userID')
          String? userID,
      @JsonKey(name: 'flavour', unknownEnumValue: Flavour.UNKNOWN)
          Flavour? flavour,
      @JsonKey(name: 'organizationID')
          String? organizationID,
      @JsonKey(name: 'locationID')
          String? locationID,
      @JsonKey(name: 'timestamp')
          String? timestamp});
}

/// @nodoc
class __$ContextCopyWithImpl<$Res> extends _$ContextCopyWithImpl<$Res>
    implements _$ContextCopyWith<$Res> {
  __$ContextCopyWithImpl(_Context _value, $Res Function(_Context) _then)
      : super(_value, (v) => _then(v as _Context));

  @override
  _Context get _value => super._value as _Context;

  @override
  $Res call({
    Object? userID = freezed,
    Object? flavour = freezed,
    Object? organizationID = freezed,
    Object? locationID = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_Context(
      userID: userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String?,
      flavour: flavour == freezed
          ? _value.flavour
          : flavour // ignore: cast_nullable_to_non_nullable
              as Flavour?,
      organizationID: organizationID == freezed
          ? _value.organizationID
          : organizationID // ignore: cast_nullable_to_non_nullable
              as String?,
      locationID: locationID == freezed
          ? _value.locationID
          : locationID // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Context implements _Context {
  _$_Context(
      {@JsonKey(name: 'userID') this.userID,
      @JsonKey(name: 'flavour', unknownEnumValue: Flavour.UNKNOWN) this.flavour,
      @JsonKey(name: 'organizationID') this.organizationID,
      @JsonKey(name: 'locationID') this.locationID,
      @JsonKey(name: 'timestamp') this.timestamp});

  factory _$_Context.fromJson(Map<String, dynamic> json) =>
      _$_$_ContextFromJson(json);

  @override
  @JsonKey(name: 'userID')
  final String? userID;
  @override
  @JsonKey(name: 'flavour', unknownEnumValue: Flavour.UNKNOWN)
  final Flavour? flavour;
  @override
  @JsonKey(name: 'organizationID')
  final String? organizationID;
  @override
  @JsonKey(name: 'locationID')
  final String? locationID;
  @override
  @JsonKey(name: 'timestamp')
  final String? timestamp;

  @override
  String toString() {
    return 'Context(userID: $userID, flavour: $flavour, organizationID: $organizationID, locationID: $locationID, timestamp: $timestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Context &&
            (identical(other.userID, userID) ||
                const DeepCollectionEquality().equals(other.userID, userID)) &&
            (identical(other.flavour, flavour) ||
                const DeepCollectionEquality()
                    .equals(other.flavour, flavour)) &&
            (identical(other.organizationID, organizationID) ||
                const DeepCollectionEquality()
                    .equals(other.organizationID, organizationID)) &&
            (identical(other.locationID, locationID) ||
                const DeepCollectionEquality()
                    .equals(other.locationID, locationID)) &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userID) ^
      const DeepCollectionEquality().hash(flavour) ^
      const DeepCollectionEquality().hash(organizationID) ^
      const DeepCollectionEquality().hash(locationID) ^
      const DeepCollectionEquality().hash(timestamp);

  @JsonKey(ignore: true)
  @override
  _$ContextCopyWith<_Context> get copyWith =>
      __$ContextCopyWithImpl<_Context>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ContextToJson(this);
  }
}

abstract class _Context implements Context {
  factory _Context(
      {@JsonKey(name: 'userID')
          String? userID,
      @JsonKey(name: 'flavour', unknownEnumValue: Flavour.UNKNOWN)
          Flavour? flavour,
      @JsonKey(name: 'organizationID')
          String? organizationID,
      @JsonKey(name: 'locationID')
          String? locationID,
      @JsonKey(name: 'timestamp')
          String? timestamp}) = _$_Context;

  factory _Context.fromJson(Map<String, dynamic> json) = _$_Context.fromJson;

  @override
  @JsonKey(name: 'userID')
  String? get userID => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'flavour', unknownEnumValue: Flavour.UNKNOWN)
  Flavour? get flavour => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'organizationID')
  String? get organizationID => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'locationID')
  String? get locationID => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'timestamp')
  String? get timestamp => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ContextCopyWith<_Context> get copyWith =>
      throw _privateConstructorUsedError;
}
