# `tester.pumpWidget(...)`

# BuildTracker frame #1

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
* main.<fn>                                test/build_tracker_test.dart 10:36
  testWidgets.<fn>.<fn>                    package:flutter_test/src/widget_tester.dart 144:29
  _asyncThenWrapperHelper                  dart:async
  testWidgets.<fn>.<fn>                    package:flutter_test/src/widget_tester.dart
  TestWidgetsFlutterBinding._runTestBody   package:flutter_test/src/binding.dart 790:19
  _CustomZone.runBinary                    dart:async
  TestWidgetsFlutterBinding._runTest       package:flutter_test/src/binding.dart 768:14
  AutomatedTestWidgetsFlutterBinding.runTest.<fn> package:flutter_test/src/binding.dart 1189:24
* FakeAsync.run.<fn>.<fn>                  package:fake_async/fake_async.dart 178:54
  runZoned                                 dart:async
* withClock                                package:clock/src/default.dart 48:10
* FakeAsync.run.<fn>                       package:fake_async/fake_async.dart 178:22
  runZoned                                 dart:async
* FakeAsync.run                            package:fake_async/fake_async.dart 178:7
  AutomatedTestWidgetsFlutterBinding.runTest package:flutter_test/src/binding.dart 1186:15
  testWidgets.<fn>                         package:flutter_test/src/widget_tester.dart 136:24
* Declarer.test.<fn>.<fn>                  package:test_api/src/backend/declarer.dart 200:19
  _asyncThenWrapperHelper                  dart:async
* Declarer.test.<fn>.<fn>                  package:test_api/src/backend/declarer.dart
  runZoned                                 dart:async
* Declarer.test.<fn>                       package:test_api/src/backend/declarer.dart 198:13
* Declarer.test.<fn>                       package:test_api/src/backend/declarer.dart 181:48
* Invoker.waitForOutstandingCallbacks.<fn> package:test_api/src/backend/invoker.dart 231:15
* Invoker.waitForOutstandingCallbacks.<fn> package:test_api/src/backend/invoker.dart 228:14
  runZoned                                 dart:async
* Invoker.waitForOutstandingCallbacks      package:test_api/src/backend/invoker.dart 228:5
* Invoker._onRun.<fn>.<fn>.<fn>            package:test_api/src/backend/invoker.dart 383:17
  _asyncThenWrapperHelper                  dart:async
* Invoker._onRun.<fn>.<fn>.<fn>            package:test_api/src/backend/invoker.dart
  runZoned                                 dart:async
* Invoker._onRun.<fn>.<fn>                 package:test_api/src/backend/invoker.dart 370:9
* Invoker._guardIfGuarded                  package:test_api/src/backend/invoker.dart 415:15
* Invoker._onRun.<fn>                      package:test_api/src/backend/invoker.dart 369:7
* Chain.capture                            package:stack_trace
* Invoker._onRun                           package:test_api/src/backend/invoker.dart 368:11
* LiveTestController.run                   package:test_api/src/backend/live_test_controller.dart 153:11
* RemoteListener._runLiveTest.<fn>         package:test_api/src/remote_listener.dart 255:16
  runZoned                                 dart:async
* RemoteListener._runLiveTest              package:test_api/src/remote_listener.dart 254:5
* RemoteListener._serializeTest.<fn>       package:test_api/src/remote_listener.dart 207:7
  _StreamSinkWrapper.add                   dart:async
* _GuaranteeSink.add                       package:stream_channel/src/guarantee_channel.dart 125:12
* new _MultiChannel.<fn>                   package:stream_channel/src/multi_channel.dart 159:31
```

# END of BuildTracker frame #1

# Looping `text.value`

# BuildTracker frame #2

## Widgets that were built

- `ValueListenableBuilder<String> ← [root]`
- `Directionality ← ValueListenableBuilder<String> ← [root]`
- `Text ← Directionality ← ValueListenableBuilder<String> ← [root]`

## Widgets that were marked dirty (build roots)

### ValueListenableBuilder<String> ← [root]:

Stack trace #16e7ece8:

```
  State.setState                           package:flutter/src/widgets/framework.dart 1287:15
  _ValueListenableBuilderState._valueChanged package:flutter/src/widgets/value_listenable_builder.dart 182:5
  ChangeNotifier.notifyListeners           package:flutter/src/foundation/change_notifier.dart 243:25
  ValueNotifier.value=                     package:flutter/src/foundation/change_notifier.dart 309:5
* main.<fn>                                test/build_tracker_test.dart 30:12
  _asyncThenWrapperHelper                  dart:async
* main.<fn>                                test/build_tracker_test.dart
  testWidgets.<fn>.<fn>                    package:flutter_test/src/widget_tester.dart 144:29
  _asyncThenWrapperHelper                  dart:async
  testWidgets.<fn>.<fn>                    package:flutter_test/src/widget_tester.dart
  TestWidgetsFlutterBinding._runTestBody   package:flutter_test/src/binding.dart 790:19
  _CustomZone.runBinary                    dart:async
  TestWidgetsFlutterBinding._runTest       package:flutter_test/src/binding.dart 768:14
  AutomatedTestWidgetsFlutterBinding.runTest.<fn> package:flutter_test/src/binding.dart 1189:24
* FakeAsync.run.<fn>.<fn>                  package:fake_async/fake_async.dart 178:54
  runZoned                                 dart:async
* withClock                                package:clock/src/default.dart 48:10
* FakeAsync.run.<fn>                       package:fake_async/fake_async.dart 178:22
  runZoned                                 dart:async
* FakeAsync.run                            package:fake_async/fake_async.dart 178:7
  AutomatedTestWidgetsFlutterBinding.runTest package:flutter_test/src/binding.dart 1186:15
  testWidgets.<fn>                         package:flutter_test/src/widget_tester.dart 136:24
* Declarer.test.<fn>.<fn>                  package:test_api/src/backend/declarer.dart 200:19
  _asyncThenWrapperHelper                  dart:async
* Declarer.test.<fn>.<fn>                  package:test_api/src/backend/declarer.dart
  runZoned                                 dart:async
* Declarer.test.<fn>                       package:test_api/src/backend/declarer.dart 198:13
* Declarer.test.<fn>                       package:test_api/src/backend/declarer.dart 181:48
* Invoker.waitForOutstandingCallbacks.<fn> package:test_api/src/backend/invoker.dart 231:15
* Invoker.waitForOutstandingCallbacks.<fn> package:test_api/src/backend/invoker.dart 228:14
  runZoned                                 dart:async
* Invoker.waitForOutstandingCallbacks      package:test_api/src/backend/invoker.dart 228:5
* Invoker._onRun.<fn>.<fn>.<fn>            package:test_api/src/backend/invoker.dart 383:17
  _asyncThenWrapperHelper                  dart:async
* Invoker._onRun.<fn>.<fn>.<fn>            package:test_api/src/backend/invoker.dart
  runZoned                                 dart:async
* Invoker._onRun.<fn>.<fn>                 package:test_api/src/backend/invoker.dart 370:9
* Invoker._guardIfGuarded                  package:test_api/src/backend/invoker.dart 415:15
* Invoker._onRun.<fn>                      package:test_api/src/backend/invoker.dart 369:7
* Chain.capture                            package:stack_trace
* Invoker._onRun                           package:test_api/src/backend/invoker.dart 368:11
* LiveTestController.run                   package:test_api/src/backend/live_test_controller.dart 153:11
* RemoteListener._runLiveTest.<fn>         package:test_api/src/remote_listener.dart 255:16
  runZoned                                 dart:async
* RemoteListener._runLiveTest              package:test_api/src/remote_listener.dart 254:5
* RemoteListener._serializeTest.<fn>       package:test_api/src/remote_listener.dart 207:7
  _StreamSinkWrapper.add                   dart:async
* _GuaranteeSink.add                       package:stream_channel/src/guarantee_channel.dart 125:12
* new _MultiChannel.<fn>                   package:stream_channel/src/multi_channel.dart 159:31
```

# END of BuildTracker frame #2

# BuildTracker frame #3

## Widgets that were built

- `ValueListenableBuilder<String> ← [root]`
- `Directionality ← ValueListenableBuilder<String> ← [root]`
- `Text ← Directionality ← ValueListenableBuilder<String> ← [root]`

## Widgets that were marked dirty (build roots)

### ValueListenableBuilder<String> ← [root]:

Stack trace #16e7ece8 observed in frame #2 for the first time

# END of BuildTracker frame #3

# BuildTracker frame #4

## Widgets that were built

- `ValueListenableBuilder<String> ← [root]`
- `Directionality ← ValueListenableBuilder<String> ← [root]`
- `Text ← Directionality ← ValueListenableBuilder<String> ← [root]`

## Widgets that were marked dirty (build roots)

### ValueListenableBuilder<String> ← [root]:

Stack trace #16e7ece8 observed in frame #2 for the first time

# END of BuildTracker frame #4

# BuildTracker frame #5

## Widgets that were built

- `ValueListenableBuilder<String> ← [root]`
- `Directionality ← ValueListenableBuilder<String> ← [root]`
- `Text ← Directionality ← ValueListenableBuilder<String> ← [root]`

## Widgets that were marked dirty (build roots)

### ValueListenableBuilder<String> ← [root]:

Stack trace #16e7ece8 observed in frame #2 for the first time

# END of BuildTracker frame #5

# BuildTracker frame #6

## Widgets that were built

- `ValueListenableBuilder<String> ← [root]`
- `Directionality ← ValueListenableBuilder<String> ← [root]`
- `Text ← Directionality ← ValueListenableBuilder<String> ← [root]`

## Widgets that were marked dirty (build roots)

### ValueListenableBuilder<String> ← [root]:

Stack trace #16e7ece8 observed in frame #2 for the first time

# END of BuildTracker frame #6

# BuildTracker frame #7

## Widgets that were built

- `ValueListenableBuilder<String> ← [root]`
- `Directionality ← ValueListenableBuilder<String> ← [root]`
- `Text ← Directionality ← ValueListenableBuilder<String> ← [root]`

## Widgets that were marked dirty (build roots)

### ValueListenableBuilder<String> ← [root]:

Stack trace #16e7ece8 observed in frame #2 for the first time

# END of BuildTracker frame #7

# BuildTracker frame #8

## Widgets that were built

- `ValueListenableBuilder<String> ← [root]`
- `Directionality ← ValueListenableBuilder<String> ← [root]`
- `Text ← Directionality ← ValueListenableBuilder<String> ← [root]`

## Widgets that were marked dirty (build roots)

### ValueListenableBuilder<String> ← [root]:

Stack trace #16e7ece8 observed in frame #2 for the first time

# END of BuildTracker frame #8

# BuildTracker frame #9

## Widgets that were built

- `ValueListenableBuilder<String> ← [root]`
- `Directionality ← ValueListenableBuilder<String> ← [root]`
- `Text ← Directionality ← ValueListenableBuilder<String> ← [root]`

## Widgets that were marked dirty (build roots)

### ValueListenableBuilder<String> ← [root]:

Stack trace #16e7ece8 observed in frame #2 for the first time

# END of BuildTracker frame #9

# BuildTracker frame #10

## Widgets that were built

- `ValueListenableBuilder<String> ← [root]`
- `Directionality ← ValueListenableBuilder<String> ← [root]`
- `Text ← Directionality ← ValueListenableBuilder<String> ← [root]`

## Widgets that were marked dirty (build roots)

### ValueListenableBuilder<String> ← [root]:

Stack trace #16e7ece8 observed in frame #2 for the first time

# END of BuildTracker frame #10

# BuildTracker frame #11

## Widgets that were built

- `ValueListenableBuilder<String> ← [root]`
- `Directionality ← ValueListenableBuilder<String> ← [root]`
- `Text ← Directionality ← ValueListenableBuilder<String> ← [root]`

## Widgets that were marked dirty (build roots)

### ValueListenableBuilder<String> ← [root]:

Stack trace #16e7ece8 observed in frame #2 for the first time

# END of BuildTracker frame #11

# test end

## Top 10 `scheduleBuildFor` stack traces (build roots)

### 10 times:

Stack trace #16e7ece8:

```
  State.setState                           package:flutter/src/widgets/framework.dart 1287:15
  _ValueListenableBuilderState._valueChanged package:flutter/src/widgets/value_listenable_builder.dart 182:5
  ChangeNotifier.notifyListeners           package:flutter/src/foundation/change_notifier.dart 243:25
  ValueNotifier.value=                     package:flutter/src/foundation/change_notifier.dart 309:5
* main.<fn>                                test/build_tracker_test.dart 30:12
  _asyncThenWrapperHelper                  dart:async
* main.<fn>                                test/build_tracker_test.dart
  testWidgets.<fn>.<fn>                    package:flutter_test/src/widget_tester.dart 144:29
  _asyncThenWrapperHelper                  dart:async
  testWidgets.<fn>.<fn>                    package:flutter_test/src/widget_tester.dart
  TestWidgetsFlutterBinding._runTestBody   package:flutter_test/src/binding.dart 790:19
  _CustomZone.runBinary                    dart:async
  TestWidgetsFlutterBinding._runTest       package:flutter_test/src/binding.dart 768:14
  AutomatedTestWidgetsFlutterBinding.runTest.<fn> package:flutter_test/src/binding.dart 1189:24
* FakeAsync.run.<fn>.<fn>                  package:fake_async/fake_async.dart 178:54
  runZoned                                 dart:async
* withClock                                package:clock/src/default.dart 48:10
* FakeAsync.run.<fn>                       package:fake_async/fake_async.dart 178:22
  runZoned                                 dart:async
* FakeAsync.run                            package:fake_async/fake_async.dart 178:7
  AutomatedTestWidgetsFlutterBinding.runTest package:flutter_test/src/binding.dart 1186:15
  testWidgets.<fn>                         package:flutter_test/src/widget_tester.dart 136:24
* Declarer.test.<fn>.<fn>                  package:test_api/src/backend/declarer.dart 200:19
  _asyncThenWrapperHelper                  dart:async
* Declarer.test.<fn>.<fn>                  package:test_api/src/backend/declarer.dart
  runZoned                                 dart:async
* Declarer.test.<fn>                       package:test_api/src/backend/declarer.dart 198:13
* Declarer.test.<fn>                       package:test_api/src/backend/declarer.dart 181:48
* Invoker.waitForOutstandingCallbacks.<fn> package:test_api/src/backend/invoker.dart 231:15
* Invoker.waitForOutstandingCallbacks.<fn> package:test_api/src/backend/invoker.dart 228:14
  runZoned                                 dart:async
* Invoker.waitForOutstandingCallbacks      package:test_api/src/backend/invoker.dart 228:5
* Invoker._onRun.<fn>.<fn>.<fn>            package:test_api/src/backend/invoker.dart 383:17
  _asyncThenWrapperHelper                  dart:async
* Invoker._onRun.<fn>.<fn>.<fn>            package:test_api/src/backend/invoker.dart
  runZoned                                 dart:async
* Invoker._onRun.<fn>.<fn>                 package:test_api/src/backend/invoker.dart 370:9
* Invoker._guardIfGuarded                  package:test_api/src/backend/invoker.dart 415:15
* Invoker._onRun.<fn>                      package:test_api/src/backend/invoker.dart 369:7
* Chain.capture                            package:stack_trace
* Invoker._onRun                           package:test_api/src/backend/invoker.dart 368:11
* LiveTestController.run                   package:test_api/src/backend/live_test_controller.dart 153:11
* RemoteListener._runLiveTest.<fn>         package:test_api/src/remote_listener.dart 255:16
  runZoned                                 dart:async
* RemoteListener._runLiveTest              package:test_api/src/remote_listener.dart 254:5
* RemoteListener._serializeTest.<fn>       package:test_api/src/remote_listener.dart 207:7
  _StreamSinkWrapper.add                   dart:async
* _GuaranteeSink.add                       package:stream_channel/src/guarantee_channel.dart 125:12
* new _MultiChannel.<fn>                   package:stream_channel/src/multi_channel.dart 159:31
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
* main.<fn>                                test/build_tracker_test.dart 10:36
  testWidgets.<fn>.<fn>                    package:flutter_test/src/widget_tester.dart 144:29
  _asyncThenWrapperHelper                  dart:async
  testWidgets.<fn>.<fn>                    package:flutter_test/src/widget_tester.dart
  TestWidgetsFlutterBinding._runTestBody   package:flutter_test/src/binding.dart 790:19
  _CustomZone.runBinary                    dart:async
  TestWidgetsFlutterBinding._runTest       package:flutter_test/src/binding.dart 768:14
  AutomatedTestWidgetsFlutterBinding.runTest.<fn> package:flutter_test/src/binding.dart 1189:24
* FakeAsync.run.<fn>.<fn>                  package:fake_async/fake_async.dart 178:54
  runZoned                                 dart:async
* withClock                                package:clock/src/default.dart 48:10
* FakeAsync.run.<fn>                       package:fake_async/fake_async.dart 178:22
  runZoned                                 dart:async
* FakeAsync.run                            package:fake_async/fake_async.dart 178:7
  AutomatedTestWidgetsFlutterBinding.runTest package:flutter_test/src/binding.dart 1186:15
  testWidgets.<fn>                         package:flutter_test/src/widget_tester.dart 136:24
* Declarer.test.<fn>.<fn>                  package:test_api/src/backend/declarer.dart 200:19
  _asyncThenWrapperHelper                  dart:async
* Declarer.test.<fn>.<fn>                  package:test_api/src/backend/declarer.dart
  runZoned                                 dart:async
* Declarer.test.<fn>                       package:test_api/src/backend/declarer.dart 198:13
* Declarer.test.<fn>                       package:test_api/src/backend/declarer.dart 181:48
* Invoker.waitForOutstandingCallbacks.<fn> package:test_api/src/backend/invoker.dart 231:15
* Invoker.waitForOutstandingCallbacks.<fn> package:test_api/src/backend/invoker.dart 228:14
  runZoned                                 dart:async
* Invoker.waitForOutstandingCallbacks      package:test_api/src/backend/invoker.dart 228:5
* Invoker._onRun.<fn>.<fn>.<fn>            package:test_api/src/backend/invoker.dart 383:17
  _asyncThenWrapperHelper                  dart:async
* Invoker._onRun.<fn>.<fn>.<fn>            package:test_api/src/backend/invoker.dart
  runZoned                                 dart:async
* Invoker._onRun.<fn>.<fn>                 package:test_api/src/backend/invoker.dart 370:9
* Invoker._guardIfGuarded                  package:test_api/src/backend/invoker.dart 415:15
* Invoker._onRun.<fn>                      package:test_api/src/backend/invoker.dart 369:7
* Chain.capture                            package:stack_trace
* Invoker._onRun                           package:test_api/src/backend/invoker.dart 368:11
* LiveTestController.run                   package:test_api/src/backend/live_test_controller.dart 153:11
* RemoteListener._runLiveTest.<fn>         package:test_api/src/remote_listener.dart 255:16
  runZoned                                 dart:async
* RemoteListener._runLiveTest              package:test_api/src/remote_listener.dart 254:5
* RemoteListener._serializeTest.<fn>       package:test_api/src/remote_listener.dart 207:7
  _StreamSinkWrapper.add                   dart:async
* _GuaranteeSink.add                       package:stream_channel/src/guarantee_channel.dart 125:12
* new _MultiChannel.<fn>                   package:stream_channel/src/multi_channel.dart 159:31
```

# BuildTracker frame #12

# END of BuildTracker frame #12

✓ Test build frames
Exited
