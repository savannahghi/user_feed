import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_feed/src/domain/value_objects/feed_store.dart';
import 'package:user_feed/src/presentation/router/router_generator.dart';
import 'package:user_feed/user_feed.dart';

Future<void> buildTestWidget({
  required WidgetTester tester,
  required Widget child,
  Map<String, Function>? customCallbacks,
  Flavour flavour = Flavour.CONSUMER,
  List<NavigatorObserver>? navigatorObservers,
}) async {
  FeedStore()
    ..flavour.add(flavour)
    ..feedContentCallbacks
        .add(customCallbacks ?? <String, Function>{kGetMedicine: () {}});

  await tester.pumpWidget(
    MaterialApp(
      onGenerateRoute: generateRoute,
      home: Scaffold(body: child),
    ),
  );
}
