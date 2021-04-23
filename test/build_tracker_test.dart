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
