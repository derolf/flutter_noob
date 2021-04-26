import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:noob/noob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:noob_example/main.dart';

void main() {
  TrackingBuildOwnerAutomatedTestWidgetsFlutterBinding.ensureInitialized();

  final tracker = BuildTracker(
    printBuildFrameIncludeRebuildDirtyWidget: false,
    enabled: false,
  )..addIgnored([
      '_FocusMarker',
      'FocusScope',
      'Focus',
      '_MaterialInterior',
      'RawMaterialButton',
      'UncontrolledProviderScope ← ProviderScope',
      "Consumer-[<'PositionIndicator'>]",
    ]);

  testWidgets('Test main app', (tester) async {
    tracker.enabled = true;

    debugPrint('# `tester.pumpWidget(...)`');
    debugPrint('');
    await tester.pumpWidget(
      const ProviderScope(child: MyApp()),
    );

    debugPrint("# Click FloatingActionButton");
    debugPrint('');
    await tester.tap(find.byType(FloatingActionButton));

    debugPrint('# pump');
    debugPrint('');
    await tester.pump();

    debugPrint('# test end');
    debugPrint('');
    tracker.enabled = false;

    tracker.printTopScheduleBuildForStacks();
  });
}
