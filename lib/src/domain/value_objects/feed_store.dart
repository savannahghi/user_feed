// Package imports:
import 'package:rxdart/rxdart.dart';

// Project imports:
import 'package:user_feed/user_feed.dart';

class FeedStore {
  factory FeedStore() => _singleton;

  FeedStore._internal();

  static final FeedStore _singleton = FeedStore._internal();

  BehaviorSubject<Map<String, Function>> feedContentCallbacks =
      BehaviorSubject<Map<String, Function>>();

  /// the flavor that the app is running on
  ///
  /// It can be only 2 values, [Flavour.CONSUMER], [Flavour.PRO]
  BehaviorSubject<Flavour> flavour = BehaviorSubject<Flavour>();

  /// whether this user is anonymous
  BehaviorSubject<bool> isAnonymous = BehaviorSubject<bool>.seeded(false);
}
