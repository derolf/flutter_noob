# noob

A few handy tools for Flutter apps.

- [BuildTracker](#buildtracker)
- [OverlayPointerIndicator](#pointerindicator)
- [Hooks](#hooks)

# BuildTracker

```Dart
void main() {
  // initialize `TrackingBuildOwnerWidgetsFlutterBinding` to enable tracking
  TrackingBuildOwnerWidgetsFlutterBinding.ensureInitialized();

  // initialize `BuildTracker`
  final tracker = BuildTracker(printBuildFrameIncludeRebuildDirtyWidget: false);

  // print top 10 stacks leading to rebuilds every 10 seconds
  Timer.periodic(const Duration(seconds: 10), (_) => tracker.printTopScheduleBuildForStacks());

  // run
  runApp(...);
}
```

A lot of people have spent hours in trying to figure out why Flutter constantly rebuilds dozens of widgets in their app. To the rescue, `BuildTracker` allows to track which widgets are rebuilt during every frame and -- even more important -- what caused them to rebuild.

Flutter's rendering pipeline is usually idle until some widget in the widget tree is marked as dirty, e.g. by calling `setState` on the `State` of a `StatefulWidget`. In that case, Flutter will schedule the widget to be build during the next frame. However, before the next frame is actually being built, there might be many more widgets being marked dirty. All these widgets we call the "build roots" of the succeeding frame.

When Flutter is eventually building the next frame, it starts by building the build roots and these might trigger builds of more widgets as the process is recursively trickling down the widget tree.

For each frame, `BuildTracker` prints all widgets that were rebuilt and the stack traces for each of the build roots.

Consider the following example test-case:

```Dart
void main() {
  TrackingBuildOwnerAutomatedTestWidgetsFlutterBinding.ensureInitialized();

  final tracker = BuildTracker(enabled: false);

  testWidgets('Test build frames', (tester) async {
    tracker.enabled = true;

    final text = ValueNotifier('');

    debugPrint('# `tester.pumpWidget(...)`');
    debugPrint('');
    await tester.pumpWidget(
      ValueListenableBuilder<String>(
        valueListenable: text,
        builder: (_, value, child) => Directionality(
          textDirection: TextDirection.ltr,
          child: Text(value),
        ),
      ),
    );

    debugPrint("# Looping `text.value`");
    debugPrint('');
    for (var i = 0; i < 10; i++) {
      text.value = '$i';
      await tester.pump();
    }

    debugPrint('# test end');
    debugPrint('');
    tracker.enabled = false;

    tracker.printTopScheduleBuildForStacks();
  });
}
```

If we run the example, `BuildTracker` generates markdown-formatted logs that contain rebuilt and dirty widgets. The full output can be found [here](build_tracker_example.md).

For example, after `text.value = '0'`, we have:

## Widgets that were built

- `[root]`
- `ValueListenableBuilder<String> ← [root]`
- `Directionality ← ValueListenableBuilder<String> ← [root]`
- `Text ← Directionality ← ValueListenableBuilder<String> ← [root]`

## Widgets that were marked dirty (build roots)

### [root]:

Stack trace #1beada3:

```
  Element.markNeedsBuild                   package:flutter/src/widgets/framework.dart 4157:12
  RenderObjectToWidgetAdapter.attachToRenderTree package:flutter/src/widgets/binding.dart 1102:15
  WidgetsBinding.attachRootWidget          package:flutter/src/widgets/binding.dart 934:7
  WidgetTester.pumpWidget.<fn>             package:flutter_test/src/widget_tester.dart 520:15
  _CustomZone.run                          dart:async
  TestAsyncUtils.guard                     package:flutter_test/src/test_async_utils.dart 72:41
  WidgetTester.pumpWidget                  package:flutter_test/src/widget_tester.dart 519:27
* main.<fn>                                test/build_tracker_test.dart 17:18
```

Hence, we can easily spot that `test/build_tracker_test.dart 25:10` was the actual location that triggered the frame, which is `text.value = '0'`.

Furthermore, calling `BuildTracker.printTopScheduleBuildForStacks` prints the top stack traces resulting in rebuids:

## Top 10 `scheduleBuildFor` stack traces (build roots)

### 10 times:

Stack trace #16e7ece8:

```
  State.setState                           package:flutter/src/widgets/framework.dart 1287:15
  _ValueListenableBuilderState._valueChanged package:flutter/src/widgets/value_listenable_builder.dart 182:5
  ChangeNotifier.notifyListeners           package:flutter/src/foundation/change_notifier.dart 243:25
  ValueNotifier.value=                     package:flutter/src/foundation/change_notifier.dart 309:5
* main.<fn>                                test/build_tracker_test.dart 30:12
...
```

### 1 times:

Stack trace #1beada3:

```
  Element.markNeedsBuild                   package:flutter/src/widgets/framework.dart 4157:12
  RenderObjectToWidgetAdapter.attachToRenderTree package:flutter/src/widgets/binding.dart 1102:15
  WidgetsBinding.attachRootWidget          package:flutter/src/widgets/binding.dart 934:7
  WidgetTester.pumpWidget.<fn>             package:flutter_test/src/widget_tester.dart 520:15
  _CustomZone.run                          dart:async
  TestAsyncUtils.guard                     package:flutter_test/src/test_async_utils.dart 72:41
  WidgetTester.pumpWidget                  package:flutter_test/src/widget_tester.dart 519:27
* main.<fn>                                test/build_tracker_test.dart 17:18
...
```

# OverlayPointerIndicator

```Dart
OverlayPointerIndicator(child: ...)
```

The `OverlayPointerIndicator` shows positions of `PointerEvent`s and hence allows to record the screen including "fingers".

# Hooks

Some handy hooks:

- `useRebuild`: Manually trigger rebuilding of a `HookWidet`/`HookBuilder`
- `useVariable`: Lightweight hook to create a variable (mutable value) that doesn't trigger rebuilds when it's changed
