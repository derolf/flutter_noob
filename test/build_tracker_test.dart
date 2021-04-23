import 'package:debug_tools/debug_tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

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
