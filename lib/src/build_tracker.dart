import 'package:built_collection/built_collection.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stack_trace/stack_trace.dart';

import 'tracking_build_owner.dart';

part 'build_tracker.freezed.dart';

@freezed
class BuildEntry with _$BuildEntry {
  factory BuildEntry({
    required int timestamp,
    required String widget,
  }) = _BuildEntry;
}

@freezed
class ScheduleBuildEntry with _$ScheduleBuildEntry {
  factory ScheduleBuildEntry({
    required int timestamp,
    required String widget,
    required BuiltList<String> stack,
  }) = _ScheduleBuildEntry;
}

@freezed
class BuildFrame with _$BuildFrame {
  factory BuildFrame({
    required int number,
    required BuiltList<BuildEntry> built,
    required BuiltList<ScheduleBuildEntry> buildScheduled,
  }) = _BuildFrame;
}

///
/// Track rebuilt widgets and build roots for each frame.
///
/// You need the [TrackingBuildOwnerWidgetsBindingMixin] on your [WidgetsBinding].
///
class BuildTracker {
  BuildTracker({
    this.onBuildFrame,
    this.printBuildFrame = true,
    bool enabled = true,
  }) {
    this.enabled = enabled;
  }

  ///
  /// Print markdown-formatted stats after every frame.
  ///
  bool printBuildFrame;

  ///
  /// Called after every frame with `BuildFrame` information collected during the frame build.
  ///
  void Function(BuildFrame)? onBuildFrame;

  bool get enabled => _enabled;

  set enabled(bool value) {
    if (_enabled == value) {
      return;
    }
    _enabled = value;
    if (value) {
      assert(debugOnRebuildDirtyWidget == null, "`debugOnRebuildDirtyWidget` already in use ($debugOnRebuildDirtyWidget)");
      assert(debugOnScheduleBuildFor == null, "`debugOnScheduleBuildFor` already in use ($debugOnScheduleBuildFor)");
      assert(
        WidgetsBinding.instance is TrackingBuildOwnerWidgetsBindingMixin,
        "`TrackingBuildOwnerWidgetsBindingMixin` is required (${WidgetsBinding.instance})",
      );
    }
    debugOnRebuildDirtyWidget = value ? _onDebugOnRebuildDirtyWidget : null;
    debugOnScheduleBuildFor = value ? _onDebugOnScheduleBuildFor : null;

    if (value && !_frameCallbackScheduled) {
      _frameCallbackScheduled = true;
      WidgetsBinding.instance!.addPostFrameCallback(_frameCallback);
    }
  }

  var _enabled = false;
  var _number = 1;

  var _frameCallbackScheduled = false;

  final _buildList = <BuildEntry>[];
  final _buildScheduleList = <ScheduleBuildEntry>[];

  void _onDebugOnRebuildDirtyWidget(Element e, bool builtOnce) {
    _buildList.add(BuildEntry(timestamp: DateTime.now().millisecondsSinceEpoch, widget: e.debugGetCreatorChain(10)));
  }

  void _onDebugOnScheduleBuildFor(Element e) {
    var chain = Chain.current();
    final setStateIndex =
        chain.traces.first.frames.lastIndexWhere((_) => {'State.setState', 'Element.markNeedsBuild', 'HookState.setState'}.contains(_.member));
    if (setStateIndex > 0) {
      chain = Chain.current(setStateIndex);
    }
    _buildScheduleList.add(ScheduleBuildEntry(
        timestamp: DateTime.now().millisecondsSinceEpoch,
        widget: e.debugGetCreatorChain(10),
        stack: chain.terse.traces.expand((t) => t.frames).map((f) => '${f.member},${f.location}').toBuiltList()));
  }

  void _frameCallback(Duration _) {
    _frameCallbackScheduled = false;

    final frame = BuildFrame(number: _number++, built: BuiltList(_buildList), buildScheduled: BuiltList(_buildScheduleList));
    _buildList.clear();
    _buildScheduleList.clear();

    onBuildFrame?.call(frame);

    if (printBuildFrame) {
      doPrintBuildFrame(frame);
    }

    if (_enabled && !_frameCallbackScheduled) {
      _frameCallbackScheduled = true;
      WidgetsBinding.instance!.addPostFrameCallback(_frameCallback);
    }
  }

  ///
  /// Print markdown-formatted stats.
  ///
  void doPrintBuildFrame(BuildFrame frame) {
    debugPrint('# BuildTracker frame #${frame.number}');
    debugPrint('');

    if (frame.built.isNotEmpty) {
      debugPrint('## Widgets that were built');
      debugPrint('');
      for (final e in frame.built) {
        debugPrint('- `${e.widget}`');
      }
      debugPrint('');
    }

    if (frame.buildScheduled.isNotEmpty) {
      debugPrint('## Widgets that were marked dirty (build roots)');
      debugPrint('');
      for (final e in frame.buildScheduled) {
        debugPrint('### ${e.widget}:');
        debugPrint('');
        debugPrint('```');
        for (final frame in e.stack.map((_) => _.split(','))) {
          final member = frame[0];
          final location = frame[1];
          final isCore = {'dart:', 'package:flutter/', 'package:flutter_test/'}.any((_) => location.startsWith(_));
          debugPrint('${isCore ? ' ' : '*'} ${member.padRight(40)} $location');
        }
        debugPrint('```');
      }
    }

    debugPrint('# END of BuildTracker frame #${frame.number}');
  }
}
