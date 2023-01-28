// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';

class GlobalNavigatorKeys {
  const GlobalNavigatorKeys._();

  static final GlobalKey<NavigatorState> rootNavigator =
      GlobalKey(debugLabel: 'root');
  static final GlobalKey<NavigatorState> shellNavigator =
      GlobalKey(debugLabel: 'shell');
}
