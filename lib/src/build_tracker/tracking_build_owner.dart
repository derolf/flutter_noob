import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

///
/// This function is called whenever a build is scheduled for an [Element].
///
/// To enable this callback, you need to use the [TrackingBuildOwnerWidgetsBindingMixin] mixin on your [WidgetsBinding].
///
void Function(Element e)? debugOnScheduleBuildFor;

///
/// A mixin on [WidgetsBinding] that injects [TrackingBuildOwner] as its `buildOwner`.
///
/// If you don't have custom [WidgetsBinding]:
/// * Call [TrackingBuildOwnerWidgetsFlutterBinding.ensureInitialized()] at the beginning of your app.
/// * Call [TrackingBuildOwnerAutomatedTestWidgetsFlutterBinding.ensureInitialized()] at the beginning of your tests.
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

///
/// [WidgetsFlutterBinding] with [TrackingBuildOwnerWidgetsBindingMixin]
///
class TrackingBuildOwnerWidgetsFlutterBinding extends WidgetsFlutterBinding with TrackingBuildOwnerWidgetsBindingMixin {
  static WidgetsBinding ensureInitialized() {
    if (WidgetsBinding.instance == null) {
      TrackingBuildOwnerWidgetsFlutterBinding();
    }
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
    if (_isReassembling == 0) {
      debugOnScheduleBuildFor?.call(element);
    }
    super.scheduleBuildFor(element);
  }

  @override
  void reassemble(Element root, DebugReassembleConfig? reassembleConfig) {
    _isReassembling++;
    try {
      super.reassemble(root, reassembleConfig);
    } finally {
      _isReassembling--;
    }
  }

  var _isReassembling = 0;
}
