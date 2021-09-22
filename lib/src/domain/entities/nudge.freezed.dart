// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'nudge.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Nudge _$NudgeFromJson(Map<String, dynamic> json) {
  return _Nudge.fromJson(json);
}

/// @nodoc
class _$NudgeTearOff {
  const _$NudgeTearOff();

  _Nudge call(
      {@JsonKey(name: 'id')
          String? id,
      @JsonKey(name: 'sequenceNumber')
          int? sequenceNumber,
      @JsonKey(name: 'title')
          String? title,
      @JsonKey(name: 'text')
          String? text,
      @JsonKey(name: 'actions')
          List<Action>? actions,
      @JsonKey(name: 'visibility', unknownEnumValue: Visibility.UNKNOWN)
          Visibility? visibility,
      @JsonKey(name: 'status', unknownEnumValue: Status.UNKNOWN)
          Status? status,
      @JsonKey(name: 'expiry')
          String? expiry,
      @JsonKey(name: 'links')
          List<Link>? links,
      @JsonKey(name: 'groups')
          List<String>? groups,
      @JsonKey(name: 'users')
          List<String>? users,
      @JsonKey(name: 'notificationChannels', unknownEnumValue: Channel.UNKNOWN)
          List<Channel>? notificationChannels}) {
    return _Nudge(
      id: id,
      sequenceNumber: sequenceNumber,
      title: title,
      text: text,
      actions: actions,
      visibility: visibility,
      status: status,
      expiry: expiry,
      links: links,
      groups: groups,
      users: users,
      notificationChannels: notificationChannels,
    );
  }

  Nudge fromJson(Map<String, Object> json) {
    return Nudge.fromJson(json);
  }
}

/// @nodoc
const $Nudge = _$NudgeTearOff();

/// @nodoc
mixin _$Nudge {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'sequenceNumber')
  int? get sequenceNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'text')
  String? get text => throw _privateConstructorUsedError;
  @JsonKey(name: 'actions')
  List<Action>? get actions => throw _privateConstructorUsedError;
  @JsonKey(name: 'visibility', unknownEnumValue: Visibility.UNKNOWN)
  Visibility? get visibility => throw _privateConstructorUsedError;
  @JsonKey(name: 'status', unknownEnumValue: Status.UNKNOWN)
  Status? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'expiry')
  String? get expiry => throw _privateConstructorUsedError;
  @JsonKey(name: 'links')
  List<Link>? get links => throw _privateConstructorUsedError;
  @JsonKey(name: 'groups')
  List<String>? get groups => throw _privateConstructorUsedError;
  @JsonKey(name: 'users')
  List<String>? get users => throw _privateConstructorUsedError;
  @JsonKey(name: 'notificationChannels', unknownEnumValue: Channel.UNKNOWN)
  List<Channel>? get notificationChannels => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NudgeCopyWith<Nudge> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NudgeCopyWith<$Res> {
  factory $NudgeCopyWith(Nudge value, $Res Function(Nudge) then) =
      _$NudgeCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id')
          String? id,
      @JsonKey(name: 'sequenceNumber')
          int? sequenceNumber,
      @JsonKey(name: 'title')
          String? title,
      @JsonKey(name: 'text')
          String? text,
      @JsonKey(name: 'actions')
          List<Action>? actions,
      @JsonKey(name: 'visibility', unknownEnumValue: Visibility.UNKNOWN)
          Visibility? visibility,
      @JsonKey(name: 'status', unknownEnumValue: Status.UNKNOWN)
          Status? status,
      @JsonKey(name: 'expiry')
          String? expiry,
      @JsonKey(name: 'links')
          List<Link>? links,
      @JsonKey(name: 'groups')
          List<String>? groups,
      @JsonKey(name: 'users')
          List<String>? users,
      @JsonKey(name: 'notificationChannels', unknownEnumValue: Channel.UNKNOWN)
          List<Channel>? notificationChannels});
}

/// @nodoc
class _$NudgeCopyWithImpl<$Res> implements $NudgeCopyWith<$Res> {
  _$NudgeCopyWithImpl(this._value, this._then);

  final Nudge _value;
  // ignore: unused_field
  final $Res Function(Nudge) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? sequenceNumber = freezed,
    Object? title = freezed,
    Object? text = freezed,
    Object? actions = freezed,
    Object? visibility = freezed,
    Object? status = freezed,
    Object? expiry = freezed,
    Object? links = freezed,
    Object? groups = freezed,
    Object? users = freezed,
    Object? notificationChannels = freezed,
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
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      actions: actions == freezed
          ? _value.actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<Action>?,
      visibility: visibility == freezed
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as Visibility?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status?,
      expiry: expiry == freezed
          ? _value.expiry
          : expiry // ignore: cast_nullable_to_non_nullable
              as String?,
      links: links == freezed
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as List<Link>?,
      groups: groups == freezed
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      users: users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      notificationChannels: notificationChannels == freezed
          ? _value.notificationChannels
          : notificationChannels // ignore: cast_nullable_to_non_nullable
              as List<Channel>?,
    ));
  }
}

/// @nodoc
abstract class _$NudgeCopyWith<$Res> implements $NudgeCopyWith<$Res> {
  factory _$NudgeCopyWith(_Nudge value, $Res Function(_Nudge) then) =
      __$NudgeCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id')
          String? id,
      @JsonKey(name: 'sequenceNumber')
          int? sequenceNumber,
      @JsonKey(name: 'title')
          String? title,
      @JsonKey(name: 'text')
          String? text,
      @JsonKey(name: 'actions')
          List<Action>? actions,
      @JsonKey(name: 'visibility', unknownEnumValue: Visibility.UNKNOWN)
          Visibility? visibility,
      @JsonKey(name: 'status', unknownEnumValue: Status.UNKNOWN)
          Status? status,
      @JsonKey(name: 'expiry')
          String? expiry,
      @JsonKey(name: 'links')
          List<Link>? links,
      @JsonKey(name: 'groups')
          List<String>? groups,
      @JsonKey(name: 'users')
          List<String>? users,
      @JsonKey(name: 'notificationChannels', unknownEnumValue: Channel.UNKNOWN)
          List<Channel>? notificationChannels});
}

/// @nodoc
class __$NudgeCopyWithImpl<$Res> extends _$NudgeCopyWithImpl<$Res>
    implements _$NudgeCopyWith<$Res> {
  __$NudgeCopyWithImpl(_Nudge _value, $Res Function(_Nudge) _then)
      : super(_value, (v) => _then(v as _Nudge));

  @override
  _Nudge get _value => super._value as _Nudge;

  @override
  $Res call({
    Object? id = freezed,
    Object? sequenceNumber = freezed,
    Object? title = freezed,
    Object? text = freezed,
    Object? actions = freezed,
    Object? visibility = freezed,
    Object? status = freezed,
    Object? expiry = freezed,
    Object? links = freezed,
    Object? groups = freezed,
    Object? users = freezed,
    Object? notificationChannels = freezed,
  }) {
    return _then(_Nudge(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      sequenceNumber: sequenceNumber == freezed
          ? _value.sequenceNumber
          : sequenceNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      actions: actions == freezed
          ? _value.actions
          : actions // ignore: cast_nullable_to_non_nullable
              as List<Action>?,
      visibility: visibility == freezed
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as Visibility?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status?,
      expiry: expiry == freezed
          ? _value.expiry
          : expiry // ignore: cast_nullable_to_non_nullable
              as String?,
      links: links == freezed
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as List<Link>?,
      groups: groups == freezed
          ? _value.groups
          : groups // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      users: users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      notificationChannels: notificationChannels == freezed
          ? _value.notificationChannels
          : notificationChannels // ignore: cast_nullable_to_non_nullable
              as List<Channel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Nudge implements _Nudge {
  _$_Nudge(
      {@JsonKey(name: 'id')
          this.id,
      @JsonKey(name: 'sequenceNumber')
          this.sequenceNumber,
      @JsonKey(name: 'title')
          this.title,
      @JsonKey(name: 'text')
          this.text,
      @JsonKey(name: 'actions')
          this.actions,
      @JsonKey(name: 'visibility', unknownEnumValue: Visibility.UNKNOWN)
          this.visibility,
      @JsonKey(name: 'status', unknownEnumValue: Status.UNKNOWN)
          this.status,
      @JsonKey(name: 'expiry')
          this.expiry,
      @JsonKey(name: 'links')
          this.links,
      @JsonKey(name: 'groups')
          this.groups,
      @JsonKey(name: 'users')
          this.users,
      @JsonKey(name: 'notificationChannels', unknownEnumValue: Channel.UNKNOWN)
          this.notificationChannels});

  factory _$_Nudge.fromJson(Map<String, dynamic> json) =>
      _$_$_NudgeFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'sequenceNumber')
  final int? sequenceNumber;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'text')
  final String? text;
  @override
  @JsonKey(name: 'actions')
  final List<Action>? actions;
  @override
  @JsonKey(name: 'visibility', unknownEnumValue: Visibility.UNKNOWN)
  final Visibility? visibility;
  @override
  @JsonKey(name: 'status', unknownEnumValue: Status.UNKNOWN)
  final Status? status;
  @override
  @JsonKey(name: 'expiry')
  final String? expiry;
  @override
  @JsonKey(name: 'links')
  final List<Link>? links;
  @override
  @JsonKey(name: 'groups')
  final List<String>? groups;
  @override
  @JsonKey(name: 'users')
  final List<String>? users;
  @override
  @JsonKey(name: 'notificationChannels', unknownEnumValue: Channel.UNKNOWN)
  final List<Channel>? notificationChannels;

  @override
  String toString() {
    return 'Nudge(id: $id, sequenceNumber: $sequenceNumber, title: $title, text: $text, actions: $actions, visibility: $visibility, status: $status, expiry: $expiry, links: $links, groups: $groups, users: $users, notificationChannels: $notificationChannels)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Nudge &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.sequenceNumber, sequenceNumber) ||
                const DeepCollectionEquality()
                    .equals(other.sequenceNumber, sequenceNumber)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)) &&
            (identical(other.actions, actions) ||
                const DeepCollectionEquality()
                    .equals(other.actions, actions)) &&
            (identical(other.visibility, visibility) ||
                const DeepCollectionEquality()
                    .equals(other.visibility, visibility)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.expiry, expiry) ||
                const DeepCollectionEquality().equals(other.expiry, expiry)) &&
            (identical(other.links, links) ||
                const DeepCollectionEquality().equals(other.links, links)) &&
            (identical(other.groups, groups) ||
                const DeepCollectionEquality().equals(other.groups, groups)) &&
            (identical(other.users, users) ||
                const DeepCollectionEquality().equals(other.users, users)) &&
            (identical(other.notificationChannels, notificationChannels) ||
                const DeepCollectionEquality()
                    .equals(other.notificationChannels, notificationChannels)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(sequenceNumber) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(text) ^
      const DeepCollectionEquality().hash(actions) ^
      const DeepCollectionEquality().hash(visibility) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(expiry) ^
      const DeepCollectionEquality().hash(links) ^
      const DeepCollectionEquality().hash(groups) ^
      const DeepCollectionEquality().hash(users) ^
      const DeepCollectionEquality().hash(notificationChannels);

  @JsonKey(ignore: true)
  @override
  _$NudgeCopyWith<_Nudge> get copyWith =>
      __$NudgeCopyWithImpl<_Nudge>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_NudgeToJson(this);
  }
}

abstract class _Nudge implements Nudge {
  factory _Nudge(
      {@JsonKey(name: 'id')
          String? id,
      @JsonKey(name: 'sequenceNumber')
          int? sequenceNumber,
      @JsonKey(name: 'title')
          String? title,
      @JsonKey(name: 'text')
          String? text,
      @JsonKey(name: 'actions')
          List<Action>? actions,
      @JsonKey(name: 'visibility', unknownEnumValue: Visibility.UNKNOWN)
          Visibility? visibility,
      @JsonKey(name: 'status', unknownEnumValue: Status.UNKNOWN)
          Status? status,
      @JsonKey(name: 'expiry')
          String? expiry,
      @JsonKey(name: 'links')
          List<Link>? links,
      @JsonKey(name: 'groups')
          List<String>? groups,
      @JsonKey(name: 'users')
          List<String>? users,
      @JsonKey(name: 'notificationChannels', unknownEnumValue: Channel.UNKNOWN)
          List<Channel>? notificationChannels}) = _$_Nudge;

  factory _Nudge.fromJson(Map<String, dynamic> json) = _$_Nudge.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'sequenceNumber')
  int? get sequenceNumber => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'text')
  String? get text => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'actions')
  List<Action>? get actions => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'visibility', unknownEnumValue: Visibility.UNKNOWN)
  Visibility? get visibility => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'status', unknownEnumValue: Status.UNKNOWN)
  Status? get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'expiry')
  String? get expiry => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'links')
  List<Link>? get links => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'groups')
  List<String>? get groups => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'users')
  List<String>? get users => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'notificationChannels', unknownEnumValue: Channel.UNKNOWN)
  List<Channel>? get notificationChannels => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$NudgeCopyWith<_Nudge> get copyWith => throw _privateConstructorUsedError;
}
