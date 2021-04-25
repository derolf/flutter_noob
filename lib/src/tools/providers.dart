import 'package:built_collection/built_collection.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:noob/noob.dart';

///
/// Track the last [PointerEvent] of active pointers.
///
class LastPointerEventProviderStateNotifier extends StateNotifier<BuiltMap<int, PointerEvent>> {
  LastPointerEventProviderStateNotifier() : super(BuiltMap()) {
    WidgetsBinding.instance!.pointerRouter.addGlobalRoute(_handler);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.pointerRouter.removeGlobalRoute(_handler);
    super.dispose();
  }

  void _handler(PointerEvent ev) {
    switch (ev.runtimeType) {
      case PointerDownEvent:
      case PointerMoveEvent:
        state = state.rebuild((_) => _[ev.pointer] = ev);
        break;
      case PointerUpEvent:
      case PointerCancelEvent:
        state = state.rebuild((_) => _.remove(ev.pointer));
        break;
      default:
        return;
    }
  }
}

///
/// A provider to track the last [PointerEvent]s of active pointers.
///
final lastPointerEventProvider = StateNotifierProvider.autoDispose<LastPointerEventProviderStateNotifier, BuiltMap<int, PointerEvent>>(
  (ref) => LastPointerEventProviderStateNotifier(),
);

///
/// Track the global position of a [BuildContext]'s [RenderBox].
///
class GlobalPositionStateNotifier extends StateNotifier<Rect?> {
  GlobalPositionStateNotifier(this.context) : super(null) {
    WidgetsBinding.instance!.addPostFrameCallback(_callback);
  }

  final BuildContext context;

  void _callback(Duration _) {
    if (mounted) {
      final renderBox = context.findRenderObject() as RenderBox?;
      final rect = renderBox?.let((_) => _.localToGlobal(Offset.zero) & _.size);
      if (state != rect) {
        state = rect;
      }
      WidgetsBinding.instance!.addPostFrameCallback(_callback);
    }
  }
}

///
/// A provider to track the global position of a [BuildContext]'s [RenderBox].
///
/// Usage:
/// ```dart
/// Consumer(
///   builder: (context, watch, _) {
///     final rect = watch(globalPositionProvider(context));
///     return Text(rect.toString());
///   },
/// );
/// ```
final globalPositionProvider = StateNotifierProvider.autoDispose.family<GlobalPositionStateNotifier, Rect?, BuildContext>(
  (ref, context) => GlobalPositionStateNotifier(context),
);
