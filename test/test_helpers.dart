import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sil_feed/sil_feed.dart';
import 'package:sil_feed/src/domain/value_objects/feed_store.dart';
import 'package:sil_feed/src/presentation/router/router_generator.dart';

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
      onGenerateRoute: RouteGenerator.generateRoute,
      home: Scaffold(body: child),
    ),
  );
}
