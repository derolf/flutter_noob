import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

///
/// This function is called whenever a build is scheduled for an [Element].
///
/// To enable this callback, you need to use the [TrackingBuildOwnerWidgetsBindingMixin] mixin on your [WidgetsBinding].
///
/// If you don't use custom [WidgetsBinding]:
/// * Call [TrackingBuildOwnerWidgetsFlutterBinding.ensureInitialized()] at the beginning of your app.
/// * Call [TrackingBuildOwnerAutomatedTestWidgetsFlutterBinding.ensureInitialized()] at the beginning of your tests.
///
void Function(Element e)? debugOnScheduleBuildFor;

///
/// A mixin on [WidgetsBinding] that injects [TrackingBuildOwner] as its `buildOwner`
///
mixin TrackingBuildOwnerWidgetsBindingMixin on WidgetsBinding {
  @override
  BuildOwner? get buildOwner =>
      _buildOwner ??
      (super.buildOwner == null
          ? null
          : _buildOwner = TrackingBuildOwner(onBuildScheduled: super.buildOwner!.onBuildScheduled, focusManager: super.buildOwner!.focusManager));

  TrackingBuildOwner? _buildOwner;
}

class TrackingBuildOwnerWidgetsFlutterBinding extends WidgetsFlutterBinding with TrackingBuildOwnerWidgetsBindingMixin {
  static WidgetsBinding ensureInitialized() {
    if (WidgetsBinding.instance == null) TrackingBuildOwnerWidgetsFlutterBinding();
    return WidgetsBinding.instance!;
  }
}

class TrackingBuildOwnerAutomatedTestWidgetsFlutterBinding extends AutomatedTestWidgetsFlutterBinding with TrackingBuildOwnerWidgetsBindingMixin {
  static WidgetsBinding ensureInitialized() {
    if (WidgetsBinding.instance == null) TrackingBuildOwnerAutomatedTestWidgetsFlutterBinding();
    return WidgetsBinding.instance!;
  }
}

///
/// A [BuildOwner] that allows to track all calls to `scheduleBuildFor` via [debugOnScheduleBuildFor].
///
class TrackingBuildOwner extends BuildOwner {
  TrackingBuildOwner({
    VoidCallback? onBuildScheduled,
    FocusManager? focusManager,
  }) : super(onBuildScheduled: onBuildScheduled, focusManager: focusManager);

  @override
  void scheduleBuildFor(Element element) {
    debugOnScheduleBuildFor?.call(element);
    super.scheduleBuildFor(element);
  }
}
