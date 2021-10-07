// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:user_feed/src/presentation/router/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.feedDocumentViewer:
      return MaterialPageRoute<Widget>(builder: (_) => Container());

    default:
      return _errorRoute();
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute<Widget>(builder: (_) => Container());
}
