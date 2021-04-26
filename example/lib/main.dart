import 'dart:async';

import 'package:noob/noob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  // initialize `TrackingBuildOwnerWidgetsFlutterBinding` to enable tracking
  TrackingBuildOwnerWidgetsFlutterBinding.ensureInitialized();

  // initialize `BuildTracker`
  final tracker = BuildTracker(
    printBuildFrameIncludeRebuildDirtyWidget: false,
  ) //
    ..addIgnored([
      '_FocusMarker',
      'FocusScope',
      'Focus',
      '_MaterialInterior',
      'RawMaterialButton',
      'UncontrolledProviderScope ← ProviderScope',
      "Consumer-[<'PositionIndicator'>]",
    ]);

  // print top 10 stacks leading to rebuilds every 10 seconds
  Timer.periodic(const Duration(seconds: 10),
      (_) => tracker.printTopScheduleBuildForStacks());

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'debug_tools',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'debug_tools demo'),
      );
}

final counterProvider = StateProvider((ref) => 0);

class MyHomePage extends HookWidget {
  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final counter = useProvider(counterProvider).state;
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Align(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PointerIndicator(
              child: Container(
                alignment: Alignment.center,
                color: Colors.amber,
                width: 300,
                height: 300,
                child: Text('Button clicked $counter times'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read(counterProvider).state++,
        child: const Icon(Icons.add),
      ),
    );
  }
}
