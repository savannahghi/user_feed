// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Message _$MessageFromJson(Map<String, dynamic> json) {
  return _Message.fromJson(json);
}

/// @nodoc
class _$MessageTearOff {
  const _$MessageTearOff();

  _Message call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'sequenceNumber') int? sequenceNumber,
      @JsonKey(name: 'replyTo') String? replyTo,
      @JsonKey(name: 'postedByUID') String? postedByUID,
      @JsonKey(name: 'postedByName') String? postedByName,
      @JsonKey(name: 'text') String? text,
      @JsonKey(name: 'timestamp') String? timestamp}) {
    return _Message(
      id: id,
      sequenceNumber: sequenceNumber,
      replyTo: replyTo,
      postedByUID: postedByUID,
      postedByName: postedByName,
      text: text,
      timestamp: timestamp,
    );
  }

  Message fromJson(Map<String, Object> json) {
    return Message.fromJson(json);
  }
}

/// @nodoc
const $Message = _$MessageTearOff();

/// @nodoc
mixin _$Message {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'sequenceNumber')
  int? get sequenceNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'replyTo')
  String? get replyTo => throw _privateConstructorUsedError;
  @JsonKey(name: 'postedByUID')
  String? get postedByUID => throw _privateConstructorUsedError;
  @JsonKey(name: 'postedByName')
  String? get postedByName => throw _privateConstructorUsedError;
  @JsonKey(name: 'text')
  String? get text => throw _privateConstructorUsedError;
  @JsonKey(name: 'timestamp')
  String? get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'sequenceNumber') int? sequenceNumber,
      @JsonKey(name: 'replyTo') String? replyTo,
      @JsonKey(name: 'postedByUID') String? postedByUID,
      @JsonKey(name: 'postedByName') String? postedByName,
      @JsonKey(name: 'text') String? text,
      @JsonKey(name: 'timestamp') String? timestamp});
}

/// @nodoc
class _$MessageCopyWithImpl<$Res> implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  final Message _value;
  // ignore: unused_field
  final $Res Function(Message) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? sequenceNumber = freezed,
    Object? replyTo = freezed,
    Object? postedByUID = freezed,
    Object? postedByName = freezed,
    Object? text = freezed,
    Object? timestamp = freezed,
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
      replyTo: replyTo == freezed
          ? _value.replyTo
          : replyTo // ignore: cast_nullable_to_non_nullable
              as String?,
      postedByUID: postedByUID == freezed
          ? _value.postedByUID
          : postedByUID // ignore: cast_nullable_to_non_nullable
              as String?,
      postedByName: postedByName == freezed
          ? _value.postedByName
          : postedByName // ignore: cast_nullable_to_non_nullable
              as String?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$MessageCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$MessageCopyWith(_Message value, $Res Function(_Message) then) =
      __$MessageCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'sequenceNumber') int? sequenceNumber,
      @JsonKey(name: 'replyTo') String? replyTo,
      @JsonKey(name: 'postedByUID') String? postedByUID,
      @JsonKey(name: 'postedByName') String? postedByName,
      @JsonKey(name: 'text') String? text,
      @JsonKey(name: 'timestamp') String? timestamp});
}

/// @nodoc
class __$MessageCopyWithImpl<$Res> extends _$MessageCopyWithImpl<$Res>
    implements _$MessageCopyWith<$Res> {
  __$MessageCopyWithImpl(_Message _value, $Res Function(_Message) _then)
      : super(_value, (v) => _then(v as _Message));

  @override
  _Message get _value => super._value as _Message;

  @override
  $Res call({
    Object? id = freezed,
    Object? sequenceNumber = freezed,
    Object? replyTo = freezed,
    Object? postedByUID = freezed,
    Object? postedByName = freezed,
    Object? text = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_Message(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      sequenceNumber: sequenceNumber == freezed
          ? _value.sequenceNumber
          : sequenceNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      replyTo: replyTo == freezed
          ? _value.replyTo
          : replyTo // ignore: cast_nullable_to_non_nullable
              as String?,
      postedByUID: postedByUID == freezed
          ? _value.postedByUID
          : postedByUID // ignore: cast_nullable_to_non_nullable
              as String?,
      postedByName: postedByName == freezed
          ? _value.postedByName
          : postedByName // ignore: cast_nullable_to_non_nullable
              as String?,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
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
class _$_Message implements _Message {
  _$_Message(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'sequenceNumber') this.sequenceNumber,
      @JsonKey(name: 'replyTo') this.replyTo,
      @JsonKey(name: 'postedByUID') this.postedByUID,
      @JsonKey(name: 'postedByName') this.postedByName,
      @JsonKey(name: 'text') this.text,
      @JsonKey(name: 'timestamp') this.timestamp});

  factory _$_Message.fromJson(Map<String, dynamic> json) =>
      _$_$_MessageFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'sequenceNumber')
  final int? sequenceNumber;
  @override
  @JsonKey(name: 'replyTo')
  final String? replyTo;
  @override
  @JsonKey(name: 'postedByUID')
  final String? postedByUID;
  @override
  @JsonKey(name: 'postedByName')
  final String? postedByName;
  @override
  @JsonKey(name: 'text')
  final String? text;
  @override
  @JsonKey(name: 'timestamp')
  final String? timestamp;

  @override
  String toString() {
    return 'Message(id: $id, sequenceNumber: $sequenceNumber, replyTo: $replyTo, postedByUID: $postedByUID, postedByName: $postedByName, text: $text, timestamp: $timestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Message &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.sequenceNumber, sequenceNumber) ||
                const DeepCollectionEquality()
                    .equals(other.sequenceNumber, sequenceNumber)) &&
            (identical(other.replyTo, replyTo) ||
                const DeepCollectionEquality()
                    .equals(other.replyTo, replyTo)) &&
            (identical(other.postedByUID, postedByUID) ||
                const DeepCollectionEquality()
                    .equals(other.postedByUID, postedByUID)) &&
            (identical(other.postedByName, postedByName) ||
                const DeepCollectionEquality()
                    .equals(other.postedByName, postedByName)) &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)) &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(sequenceNumber) ^
      const DeepCollectionEquality().hash(replyTo) ^
      const DeepCollectionEquality().hash(postedByUID) ^
      const DeepCollectionEquality().hash(postedByName) ^
      const DeepCollectionEquality().hash(text) ^
      const DeepCollectionEquality().hash(timestamp);

  @JsonKey(ignore: true)
  @override
  _$MessageCopyWith<_Message> get copyWith =>
      __$MessageCopyWithImpl<_Message>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MessageToJson(this);
  }
}

abstract class _Message implements Message {
  factory _Message(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'sequenceNumber') int? sequenceNumber,
      @JsonKey(name: 'replyTo') String? replyTo,
      @JsonKey(name: 'postedByUID') String? postedByUID,
      @JsonKey(name: 'postedByName') String? postedByName,
      @JsonKey(name: 'text') String? text,
      @JsonKey(name: 'timestamp') String? timestamp}) = _$_Message;

  factory _Message.fromJson(Map<String, dynamic> json) = _$_Message.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'sequenceNumber')
  int? get sequenceNumber => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'replyTo')
  String? get replyTo => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'postedByUID')
  String? get postedByUID => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'postedByName')
  String? get postedByName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'text')
  String? get text => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'timestamp')
  String? get timestamp => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MessageCopyWith<_Message> get copyWith =>
      throw _privateConstructorUsedError;
}
