import 'dart:async';

import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:noob/noob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// initialize `BuildTracker`
final buildTracker = BuildTracker(
  printBuildFrameIncludeRebuildDirtyWidget: false,
  enabled: false,
) //
  ..addIgnored([
    '_FocusMarker',
    'FocusScope',
    'Focus',
    '_MaterialInterior',
    'RawMaterialButton',
    'UncontrolledProviderScope ← ProviderScope',
    "Consumer-[<'PositionIndicator'>]",
    "HookBuilder-[<'ignore'>]",
  ]);

void main() {
  // initialize `TrackingBuildOwnerWidgetsFlutterBinding` to enable tracking
  TrackingBuildOwnerWidgetsFlutterBinding.ensureInitialized();

  // print top 10 stacks leading to rebuilds every 10 seconds
  Timer.periodic(const Duration(seconds: 10),
      (_) => buildTracker.printTopScheduleBuildForStacks());

  final router = UriRouter(routes: [
    MyHomePage.route,
    PointerIndicatorExample.route,
    BuildTrackerExample.route,
    BooksPage.route,
  ]);

  runApp(
    ProviderScope(
      child: MyApp(
        router: router,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.router,
  }) : super(key: key);

  final UriRouter router;

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'noob',
        theme: ThemeData(primarySwatch: Colors.blue),
        onGenerateRoute: router.generateRoute,
      );
}

class MyHomePage extends HookWidget {
  static final route = UriRoute.widget(path: '/', child: const MyHomePage());
  static final path = route.build();

  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('noob examples')),
        body: ListView(
          children: [
            Card(
              child: InkWell(
                onTap: () =>
                    Navigator.pushNamed(context, PointerIndicatorExample.path),
                child: const ListTile(
                  title: Text(
                    'PointerIndicator',
                  ),
                ),
              ),
            ),
            Card(
              child: InkWell(
                onTap: () =>
                    Navigator.pushNamed(context, BuildTrackerExample.path),
                child: const ListTile(
                  title: Text(
                    'BuildTracker',
                  ),
                ),
              ),
            ),
            Card(
              child: InkWell(
                onTap: () => Navigator.pushNamed(context, BooksPage.path('1')),
                child: const ListTile(
                  title: Text(
                    'UriRouter -> Book 1',
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}

class PointerIndicatorExample extends HookWidget {
  static final route = UriRoute.widget(
      path: 'PointerIndicator', child: const PointerIndicatorExample());
  static final path = route.build();

  const PointerIndicatorExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('PointerIndicator')),
        body: PointerIndicator(
          child: ListView.builder(
            itemBuilder: (_, i) => Card(
              child: ListTile(
                title: Text('Item $i'),
              ),
            ),
          ),
        ),
      );
}

final counterProvider = StateProvider((ref) => 0);

class BuildTrackerExample extends HookWidget {
  static final route =
      UriRoute.widget(path: 'BuildTracker', child: const BuildTrackerExample());
  static final path = route.build();

  const BuildTrackerExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final log = useValueNotifier('');
    useEffect(() {
      buildTracker.enabled = true;
      final savedDebugPrint = debugPrint;
      debugPrint = (String? message, {int? wrapWidth}) {
        savedDebugPrint(message, wrapWidth: wrapWidth);
        log.value += '$message\n';
      };
      return () {
        buildTracker.enabled = false;
        debugPrint = savedDebugPrint;
      };
    });
    final counter = useProvider(counterProvider).state;
    return Scaffold(
      appBar: AppBar(title: const Text('BuildTracker')),
      body: Align(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Button clicked $counter times'),
            const Text('debugPrint output:'),
            Expanded(
              child: HookBuilder(
                key: const ValueKey('ignore'),
                builder: (_) {
                  final controller = useScrollController();
                  WidgetsBinding.instance!.addPostFrameCallback((_) =>
                      controller.jumpTo(controller.position.maxScrollExtent));
                  return Markdown(
                      data: useValueListenable(log), controller: controller);
                },
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

class BooksPage extends StatelessWidget {
  static final route = UriRoute(
    path: '/books/:id',
    pageBuilder: (context, params) => BooksPage(
      id: params.pathParams['id']!,
      pageParams: params,
    ),
  );

  static String path(String id) =>
      route.build(pathParams: <String, String>{'id': id});

  const BooksPage({Key? key, required this.pageParams, required this.id})
      : super(key: key);

  final String id;
  final PageParams pageParams;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('UriRouter: BooksPage $id')),
        body: Align(
          child: Text(
            'You selected book $id. Full params:\n$pageParams',
            maxLines: 20,
          ),
        ),
      );
}
