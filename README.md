# debug_tools

A few handy tools to debug Flutter apps.

## BuildTracker

```Dart
void main() {
  TrackingBuildOwnerWidgetsFlutterBinding.ensureInitialized();
  BuildTracker(printBuildFrameIncludeBuilt: false); // disable built widgets to reduce the noise
  runApp(...)
}
```

A lot of people have spent hours in trying to figure out why Flutter constantly rebuilds dozens of widgts in their app. To the rescue, `BuildTracker` allows to track which widgets are rebuilt during every frame and -- even more important -- what caused them to rebuild.

Flutter's rendering pipeline is usually idle until some widget in the widget tree is marked as dirty, e.g. by calling `setState` on the `State` of a `StatefulWidget`. In that case, Flutter will schedule the widget to be build during the next frame. However, before the next frame is actually being built, there might be many more widgets being marked dirty. All these widgets we call the "build roots" of the succeeding frame.

When Flutter is eventually building the next frame, it starts by building the build roots and these might triggers builds of more widgets as the process is recursively trickling down the widget tree.

For each frame, `BuildTracker` prints all widgets that were rebuilt and the stack traces for each of the build root.

Consider the following example test-case:

```Dart
void main() {
  TrackingBuildOwnerAutomatedTestWidgetsFlutterBinding.ensureInitialized();

  final tracker = BuildTracker(enabled: false);

  testWidgets('Example', (tester) async {
    tracker.enabled = true;

    final text = ValueNotifier('');

    debugPrint('# `tester.pumpWidget(...)`');
    await tester.pumpWidget(
      ValueListenableBuilder<String>(
        valueListenable: text,
        builder: (_, value, child) => Directionality(textDirection: TextDirection.ltr, child: Text(value)),
      ),
    );

    debugPrint("# `text.value = '42'`");
    text.value = '42';

    debugPrint('# `test.pump`');
    await tester.pump();

    debugPrint('# test end');
    tracker.enabled = false;
  });
}
```

If we run the example, `BuildTracker` generates markdown-formatted logs that contain rebuilt and dirty widgets. For example, after `text.value = '42'`, we have:

## Widgets that were built

- `ValueListenableBuilder<String> ← [root]`
- `Directionality ← ValueListenableBuilder<String> ← [root]`
- `Text ← Directionality ← ValueListenableBuilder<String> ← [root]`

## Widgets that were marked dirty (build roots)

### ValueListenableBuilder<String> ← [root]:

```
  State.setState                           package:flutter/src/widgets/framework.dart 1287:15
  _ValueListenableBuilderState._valueChanged package:flutter/src/widgets/value_listenable_builder.dart 182:5
  ChangeNotifier.notifyListeners           package:flutter/src/foundation/change_notifier.dart 243:25
  ValueNotifier.value=                     package:flutter/src/foundation/change_notifier.dart 309:5
* main.<fn>                                test/build_tracker_test.dart 25:10
...
```

Hence, we can easily spot that `test/build_tracker_test.dart 25:10` was the actual location that triggered the frame, which is `text.value = '42'`.

The full output can be found [here](build_tracker_example.md).
