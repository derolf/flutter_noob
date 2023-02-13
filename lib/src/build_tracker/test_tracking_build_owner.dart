import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:noob/src/build_tracker/tracking_build_owner.dart';

///
/// [AutomatedTestWidgetsFlutterBinding] with [TrackingBuildOwnerWidgetsBindingMixin]
///
class TrackingBuildOwnerAutomatedTestWidgetsFlutterBinding
    extends AutomatedTestWidgetsFlutterBinding
    with TrackingBuildOwnerWidgetsBindingMixin {
  static WidgetsBinding ensureInitialized() {
    if (!_initialized) {
      _initialized = true;
      TrackingBuildOwnerAutomatedTestWidgetsFlutterBinding();
    }
    assert(WidgetsBinding.instance
        is TrackingBuildOwnerAutomatedTestWidgetsFlutterBinding);
    return WidgetsBinding.instance;
  }

  static var _initialized = false;
}
