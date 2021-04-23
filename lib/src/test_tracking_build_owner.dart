import 'package:debug_tools/src/tracking_build_owner.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

///
/// [AutomatedTestWidgetsFlutterBinding] with [TrackingBuildOwnerWidgetsBindingMixin]
///
class TrackingBuildOwnerAutomatedTestWidgetsFlutterBinding
    extends AutomatedTestWidgetsFlutterBinding
    with TrackingBuildOwnerWidgetsBindingMixin {
  static WidgetsBinding ensureInitialized() {
    if (WidgetsBinding.instance == null) {
      TrackingBuildOwnerAutomatedTestWidgetsFlutterBinding();
    }
    return WidgetsBinding.instance!;
  }
}
