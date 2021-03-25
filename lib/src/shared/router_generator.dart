import 'package:flutter/material.dart';
import 'package:sil_feed/src/shared/widgets/routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.feedDocumentViewer:
        return MaterialPageRoute<Widget>(builder: (_) => Container());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute<Widget>(builder: (_) => Container());
  }
}
