// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'feed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Feed _$FeedFromJson(Map<String, dynamic> json) {
  return _Feed.fromJson(json);
}

/// @nodoc
class _$FeedTearOff {
  const _$FeedTearOff();

  _Feed call(
      {@JsonKey(name: 'id')
          String? id,
      @JsonKey(name: 'sequenceNumber')
          int? sequenceNumber,
      @JsonKey(name: 'uid')
          String? uid,
      @JsonKey(name: 'isAnonymous')
          bool? isAnonymous,
      @JsonKey(name: 'flavour', unknownEnumValue: Flavour.UNKNOWN)
          Flavour? flavour,
      @JsonKey(name: 'actions')
          List<Action>? actions,
      @JsonKey(name: 'nudges')
          List<Nudge>? nudges,
      @JsonKey(name: 'items')
          List<Item>? items}) {
    return _Feed(
      id: id,
      sequenceNumber: sequenceNumber,
      uid: uid,
      isAnonymous: isAnonymous,
      flavour: flavour,
      actions: actions,
      nudges: nudges,
      items: items,
    );
  }

  Feed fromJson(Map<String, Object> json) {
    return Feed.fromJson(json);
  }
}

/// @nodoc
const $Feed = _$FeedTearOff();

/// @nodoc
mixin _$Feed {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'sequenceNumber')
  int? get sequenceNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'uid')
  String? get uid => throw _privateConstructorUsedError;

  /// Note : [isAnonymous] is not removed here since the backend will always return it
  @JsonKey(name: 'isAnonymous')
  bool? get isAnonymous => throw _privateConstructorUsedError;
  @JsonKey(name: 'flavour', unknownEnumValue: Flavour.UNKNOWN)
  Flavour? get flavour => throw _privateConstructorUsedError;
  @JsonKey(name: 'actions')
  List<Action>? get actions => throw _privateConstructorUsedError;
  @JsonKey(name: 'nudges')
  List<Nudge>? get nudges => throw _privateConstructorUsedError;
  @JsonKey(name: 'items')
  List<Item>? get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeedCopyWith<Feed> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedCopyWith<$Res> {
  factory $FeedCopyWith(Feed value, $Res Function(Feed) then) =
      _$FeedCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id')
          String? id,
      @JsonKey(name: 'sequenceNumber')
          int? sequenceNumber,
      @JsonKey(name: 'uid')
          String? uid,
      @JsonKey(name: 'isAnonymous')
          bool? isAnonymous,
      @JsonKey(name: 'flavour', unknownEnumValue: Flavour.UNKNOWN)
          Flavour? flavour,
      @JsonKey(name: 'actions')
          List<Action>? actions,
      @JsonKey(name: 'nudges')
          List<Nudge>? nudges,
      @JsonKey(name: 'items')
          List<Item>? items});
}

/// @nodoc
class _$FeedCopyWithImpl<$Res> implements $FeedCopyWith<$Res> {
  _$FeedCopyWithImpl(this._value, this._then);

  final Feed _value;
  // ignore: unused_field
  final $Res Function(Feed) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? sequenceNumber = freezed,
    Object? uid = freezed,
    Object? isAnonymous = freezed,
    Object? flavour = freezed,
    Object? actions = freezed,
    Object? nudges = freezed,
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      sequenceNumber: sequenceNumber == freezed
          ? _value.sequenceNumber
          : sequenceNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      isAnonymous: isAnonymous == freezed
          ? _value.isAnonymous
          : isAnonymous // ignore: cast_nullable_to_non_nullable
              as bool?,
      flavour: flavour == freezed
          ? _value.flavour
          : flavour // ignore: cast_nullable_to_non_nullable
              as Flavour?,
      actions: actions == freezed
          ? _value.actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<Action>?,
      nudges: nudges == freezed
          ? _value.nudges
          : nudges // ignore: cast_nullable_to_non_nullable
              as List<Nudge>?,
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>?,
    ));
  }
}

/// @nodoc
abstract class _$FeedCopyWith<$Res> implements $FeedCopyWith<$Res> {
  factory _$FeedCopyWith(_Feed value, $Res Function(_Feed) then) =
      __$FeedCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id')
          String? id,
      @JsonKey(name: 'sequenceNumber')
          int? sequenceNumber,
      @JsonKey(name: 'uid')
          String? uid,
      @JsonKey(name: 'isAnonymous')
          bool? isAnonymous,
      @JsonKey(name: 'flavour', unknownEnumValue: Flavour.UNKNOWN)
          Flavour? flavour,
      @JsonKey(name: 'actions')
          List<Action>? actions,
      @JsonKey(name: 'nudges')
          List<Nudge>? nudges,
      @JsonKey(name: 'items')
          List<Item>? items});
}

/// @nodoc
class __$FeedCopyWithImpl<$Res> extends _$FeedCopyWithImpl<$Res>
    implements _$FeedCopyWith<$Res> {
  __$FeedCopyWithImpl(_Feed _value, $Res Function(_Feed) _then)
      : super(_value, (v) => _then(v as _Feed));

  @override
  _Feed get _value => super._value as _Feed;

  @override
  $Res call({
    Object? id = freezed,
    Object? sequenceNumber = freezed,
    Object? uid = freezed,
    Object? isAnonymous = freezed,
    Object? flavour = freezed,
    Object? actions = freezed,
    Object? nudges = freezed,
    Object? items = freezed,
  }) {
    return _then(_Feed(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      sequenceNumber: sequenceNumber == freezed
          ? _value.sequenceNumber
          : sequenceNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      isAnonymous: isAnonymous == freezed
          ? _value.isAnonymous
          : isAnonymous // ignore: cast_nullable_to_non_nullable
              as bool?,
      flavour: flavour == freezed
          ? _value.flavour
          : flavour // ignore: cast_nullable_to_non_nullable
              as Flavour?,
      actions: actions == freezed
          ? _value.actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<Action>?,
      nudges: nudges == freezed
          ? _value.nudges
          : nudges // ignore: cast_nullable_to_non_nullable
              as List<Nudge>?,
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Feed implements _Feed {
  _$_Feed(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'sequenceNumber') this.sequenceNumber,
      @JsonKey(name: 'uid') this.uid,
      @JsonKey(name: 'isAnonymous') this.isAnonymous,
      @JsonKey(name: 'flavour', unknownEnumValue: Flavour.UNKNOWN) this.flavour,
      @JsonKey(name: 'actions') this.actions,
      @JsonKey(name: 'nudges') this.nudges,
      @JsonKey(name: 'items') this.items});

  factory _$_Feed.fromJson(Map<String, dynamic> json) =>
      _$_$_FeedFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'sequenceNumber')
  final int? sequenceNumber;
  @override
  @JsonKey(name: 'uid')
  final String? uid;
  @override

  /// Note : [isAnonymous] is not removed here since the backend will always return it
  @JsonKey(name: 'isAnonymous')
  final bool? isAnonymous;
  @override
  @JsonKey(name: 'flavour', unknownEnumValue: Flavour.UNKNOWN)
  final Flavour? flavour;
  @override
  @JsonKey(name: 'actions')
  final List<Action>? actions;
  @override
  @JsonKey(name: 'nudges')
  final List<Nudge>? nudges;
  @override
  @JsonKey(name: 'items')
  final List<Item>? items;

  @override
  String toString() {
    return 'Feed(id: $id, sequenceNumber: $sequenceNumber, uid: $uid, isAnonymous: $isAnonymous, flavour: $flavour, actions: $actions, nudges: $nudges, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Feed &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.sequenceNumber, sequenceNumber) ||
                const DeepCollectionEquality()
                    .equals(other.sequenceNumber, sequenceNumber)) &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.isAnonymous, isAnonymous) ||
                const DeepCollectionEquality()
                    .equals(other.isAnonymous, isAnonymous)) &&
            (identical(other.flavour, flavour) ||
                const DeepCollectionEquality()
                    .equals(other.flavour, flavour)) &&
            (identical(other.actions, actions) ||
                const DeepCollectionEquality()
                    .equals(other.actions, actions)) &&
            (identical(other.nudges, nudges) ||
                const DeepCollectionEquality().equals(other.nudges, nudges)) &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(sequenceNumber) ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(isAnonymous) ^
      const DeepCollectionEquality().hash(flavour) ^
      const DeepCollectionEquality().hash(actions) ^
      const DeepCollectionEquality().hash(nudges) ^
      const DeepCollectionEquality().hash(items);

  @JsonKey(ignore: true)
  @override
  _$FeedCopyWith<_Feed> get copyWith =>
      __$FeedCopyWithImpl<_Feed>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FeedToJson(this);
  }
}

abstract class _Feed implements Feed {
  factory _Feed(
      {@JsonKey(name: 'id')
          String? id,
      @JsonKey(name: 'sequenceNumber')
          int? sequenceNumber,
      @JsonKey(name: 'uid')
          String? uid,
      @JsonKey(name: 'isAnonymous')
          bool? isAnonymous,
      @JsonKey(name: 'flavour', unknownEnumValue: Flavour.UNKNOWN)
          Flavour? flavour,
      @JsonKey(name: 'actions')
          List<Action>? actions,
      @JsonKey(name: 'nudges')
          List<Nudge>? nudges,
      @JsonKey(name: 'items')
          List<Item>? items}) = _$_Feed;

  factory _Feed.fromJson(Map<String, dynamic> json) = _$_Feed.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'sequenceNumber')
  int? get sequenceNumber => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'uid')
  String? get uid => throw _privateConstructorUsedError;
  @override

  /// Note : [isAnonymous] is not removed here since the backend will always return it
  @JsonKey(name: 'isAnonymous')
  bool? get isAnonymous => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'flavour', unknownEnumValue: Flavour.UNKNOWN)
  Flavour? get flavour => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'actions')
  List<Action>? get actions => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'nudges')
  List<Nudge>? get nudges => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'items')
  List<Item>? get items => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FeedCopyWith<_Feed> get copyWith => throw _privateConstructorUsedError;
}
