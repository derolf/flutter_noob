import 'package:built_collection/built_collection.dart';
import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:noob/src/build_tracker/tracking_build_owner.dart';
import 'package:stack_trace/stack_trace.dart';

export 'test_tracking_build_owner.dart' if (dart.library.html) '_empty.dart';
export 'tracking_build_owner.dart';

part 'build_tracker.freezed.dart';

@freezed
class RebuildDirtyWidget with _$RebuildDirtyWidget {
  factory RebuildDirtyWidget({
    required int timestamp,
    required String widget,
  }) = _RebuildDirtyWidget;
}

@freezed
class ScheduleBuildFor with _$ScheduleBuildFor {
  factory ScheduleBuildFor({
    required int timestamp,
    required String widget,
    required BuiltList<String> stack,
  }) = _ScheduleBuildFor;
}

@freezed
class BuildFrame with _$BuildFrame {
  factory BuildFrame({
    required int number,
    required BuiltList<RebuildDirtyWidget> rebuildDirtyWidgets,
    required BuiltList<ScheduleBuildFor> schedueBuildFors,
  }) = _BuildFrame;
}

///
/// Track rebuilt widgets and build roots for each frame.
///
/// You need the [TrackingBuildOwnerWidgetsBindingMixin] on your [WidgetsBinding].
///
/// See [addIgnored] to ignore certain [Widget]s.
///
class BuildTracker {
  BuildTracker({
    this.onBuildFrame,
    this.printBuildFrame = true,
    this.printBuildFrameIncludeRebuildDirtyWidget = true,
    this.printBuildFrameIncludeScheduleBuildFor = true,
    bool enabled = true,
  }) {
    this.enabled = enabled;
  }

  ///
  /// Print markdown-formatted stats after every frame.
  ///
  bool printBuildFrame;

  ///
  /// Print every widget that was built.
  ///
  bool printBuildFrameIncludeRebuildDirtyWidget;

  ///
  /// Print every widget for which [BuildOwner.scheduleBuildFor] was called with stack traces (build roots).
  ///
  bool printBuildFrameIncludeScheduleBuildFor;

  ///
  /// Called after every frame with `BuildFrame` information collected during the frame build.
  ///
  void Function(BuildFrame)? onBuildFrame;

  ///
  /// Any [Widget] path that starts with `pathStartsWith` will be ignored.
  ///
  /// Example:
  ///
  /// ```dart
  /// addIgnored([
  ///   '_FocusMarker',
  ///   'FocusScope',
  ///   'Focus',
  ///   '_MaterialInterior',
  ///   'RawMaterialButton',
  ///   'UncontrolledProviderScope ← ProviderScope',
  ///   "Consumer-[<'PositionIndicator'>]",
  /// ]);
  ///```
  void addIgnored(List<String> pathStartsWithList) =>
      pathStartsWithList.forEach((_) => _ignoredWidgets.add('$_ '));

  bool get enabled => _enabled;

  set enabled(bool value) {
    if (_enabled == value) {
      return;
    }
    _enabled = value;
    if (value) {
      assert(
        debugOnRebuildDirtyWidget == null,
        "`debugOnRebuildDirtyWidget` already in use ($debugOnRebuildDirtyWidget)",
      );

      assert(
        debugOnScheduleBuildFor == null,
        "`debugOnScheduleBuildFor` already in use ($debugOnScheduleBuildFor)",
      );

      assert(
        WidgetsBinding.instance is TrackingBuildOwnerWidgetsBindingMixin,
        "`TrackingBuildOwnerWidgetsBindingMixin` is required (${WidgetsBinding.instance})",
      );
    }
    debugOnRebuildDirtyWidget = value ? _onDebugOnRebuildDirtyWidget : null;
    debugOnScheduleBuildFor = value ? _onDebugOnScheduleBuildFor : null;

    if (value && !_frameCallbackScheduled) {
      _frameCallbackScheduled = true;
      WidgetsBinding.instance.addPostFrameCallback(_frameCallback);
    }
  }

  void _onDebugOnRebuildDirtyWidget(Element e, bool builtOnce) {
    if (_isIgnored(e.debugGetCreatorChain(10))) {
      return;
    }
    _buildList.add(
      RebuildDirtyWidget(
        timestamp: DateTime.now().millisecondsSinceEpoch,
        widget: e.debugGetCreatorChain(10),
      ),
    );
  }

  void _onDebugOnScheduleBuildFor(Element e) {
    if (_isIgnored(e.debugGetCreatorChain(10))) {
      return;
    }
    var chain = Chain.current();
    final setStateIndex = chain.traces.first.frames.lastIndexWhere(
      (_) =>
          {'package:flutter/', 'packages/flutter/'}
              .any((p) => _.location.startsWith(p)) &&
          {
            'setState',
            'markNeedsBuild',
          }.any((m) => _.member?.endsWith(m) ?? false),
    );
    if (setStateIndex > 0) {
      chain = Chain.current(setStateIndex);
    }
    _buildScheduleList.add(
      ScheduleBuildFor(
        timestamp: DateTime.now().millisecondsSinceEpoch,
        widget: e.debugGetCreatorChain(10),
        stack: chain.terse.traces
            .expand((t) => t.frames)
            .map(
              (f) =>
                  '${f.member},${f.location.replaceFirst(RegExp('^packages/'), 'package:')}',
            )
            .toBuiltList(),
      ),
    );
  }

  void _frameCallback(Duration _) {
    _frameCallbackScheduled = false;

    final frame = BuildFrame(
      number: _number++,
      rebuildDirtyWidgets: BuiltList(_buildList),
      schedueBuildFors: BuiltList(_buildScheduleList),
    );

    _buildList.clear();
    _buildScheduleList.clear();

    onBuildFrame?.call(frame);

    for (final e in frame.schedueBuildFors) {
      final stack = e.stack;
      _scheduleBuildForStacksCounter[stack] =
          (_scheduleBuildForStacksCounter[stack] ?? 0) + 1;
    }

    if (printBuildFrame) {
      doPrintBuildFrame(frame);
    }

    if (_enabled && !_frameCallbackScheduled) {
      _frameCallbackScheduled = true;
      WidgetsBinding.instance.addPostFrameCallback(_frameCallback);
    }
  }

  ///
  /// Print markdown-formatted stats.
  ///
  void doPrintBuildFrame(BuildFrame frame) {
    final hasOutput = (printBuildFrameIncludeScheduleBuildFor &&
            frame.schedueBuildFors.isNotEmpty) ||
        (printBuildFrameIncludeRebuildDirtyWidget &&
            frame.rebuildDirtyWidgets.isNotEmpty);

    if (!hasOutput) {
      return;
    }

    debugPrint('# BuildTracker frame #${frame.number}');
    debugPrint('');

    if (printBuildFrameIncludeRebuildDirtyWidget &&
        frame.rebuildDirtyWidgets.isNotEmpty) {
      debugPrint('## Widgets that were built');
      debugPrint('');
      for (final e in frame.rebuildDirtyWidgets) {
        debugPrint('- `${e.widget}`');
      }
      debugPrint('');
    }

    if (printBuildFrameIncludeScheduleBuildFor &&
        frame.schedueBuildFors.isNotEmpty) {
      debugPrint('## Widgets that were marked dirty (build roots)');
      debugPrint('');
      for (final e in frame.schedueBuildFors) {
        final stack = e.stack;

        final stackHash = stack.hashCode.toRadixString(16);

        final printedIn = _printedStacksFirstFrame[stack];
        debugPrint('### ${e.widget}:');
        debugPrint('');
        if (printedIn != null) {
          debugPrint(
            'Stack trace #$stackHash observed in frame #$printedIn for the first time',
          );
        } else {
          _printedStacksFirstFrame[stack] = frame.number;

          debugPrint('Stack trace #$stackHash:');
          debugPrint('```');
          for (final frame in stack.map((_) => _.split(','))) {
            final member = frame[0];
            final location = frame[1];
            final isCore = {
              'dart:',
              'package:flutter/',
              'package:flutter_test/',
            }.any((_) => location.startsWith(_));
            debugPrint(
              '${isCore ? ' ' : '*'} ${member.padRight(40)} $location',
            );
          }
          debugPrint('```');
        }
        debugPrint('');
      }
    }

    debugPrint('# END of BuildTracker frame #${frame.number}');
    debugPrint('');
  }

  ///
  /// Print markdown-formatted top [BuildOwner.scheduleBuildFor] stack traces.
  ///
  void printTopScheduleBuildForStacks({
    int count = 10,
    bool reset = true,
  }) {
    final top = _scheduleBuildForStacksCounter.entries.toList()
      ..sortBy<num>((_) => -_.value)
      ..take(count);

    debugPrint('## Top $count `scheduleBuildFor` stack traces (build roots)');
    debugPrint('');
    for (final e in top) {
      final stack = e.key;

      final stackHash = stack.hashCode.toRadixString(16);

      debugPrint('### ${e.value} times:');
      debugPrint('');

      debugPrint('Stack trace #$stackHash:');
      debugPrint('```');
      for (final frame in stack.map((_) => _.split(','))) {
        final member = frame[0];
        final location = frame[1];
        final isCore = {
          'dart:',
          'package:flutter/',
          'package:flutter_test/',
        }.any((_) => location.startsWith(_));
        debugPrint('${isCore ? ' ' : '*'} ${member.padRight(40)} $location');
      }
      debugPrint('```');
      debugPrint('');
    }

    if (reset) {
      resetScheduledBuildForStacksCounts();
    }
  }

  ///
  /// Reset [BuildOwner.scheduleBuildFor] stack traces counts.
  ///
  void resetScheduledBuildForStacksCounts() {
    _scheduleBuildForStacksCounter.clear();
  }

  bool _isIgnored(String path) =>
      _ignoredWidgets.any((_) => path.startsWith(_));

  var _enabled = false;
  var _number = 1;

  var _frameCallbackScheduled = false;

  final _ignoredWidgets = <String>[];

  final _buildList = <RebuildDirtyWidget>[];
  final _buildScheduleList = <ScheduleBuildFor>[];
  final _scheduleBuildForStacksCounter = <BuiltList<String>, int>{};

  final _printedStacksFirstFrame = <BuiltList<String>, int>{};
}
