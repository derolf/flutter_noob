import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

///
/// Calling the function causes the enclosing [HookWidet] or [HookBuilder] to rebuild.
///
VoidCallback useRebuild() {
  return use(const _RebuildHook());
}

class _RebuildHook extends Hook<Function()> {
  const _RebuildHook();

  @override
  _RebuildHookState createState() => _RebuildHookState();
}

class _RebuildHookState extends HookState<VoidCallback, _RebuildHook> {
  @override
  VoidCallback build(BuildContext context) => _callback;

  void _callback() => setState(() {});

  @override
  String get debugLabel => 'useRebuild';
}

///
/// A variable. Changes to the variable will not trigger rebuilds.
///
Variable<T> useVariable<T>(T initialData) {
  return useMemoized(() => Variable(initialData));
}

///
/// A container for a variable.
///
class Variable<T> {
  Variable(this.value);
  T value;
}

///
/// Adds `callback` as listener to `listenable` and removes it again upon destruction of the hook.
/// If called multiple times with different `callback`s, the one from the most recent call will be used.
///
/// If `callInitially` is true, the callback is called immediately, otherwise the callback is called
/// when the `listenable` is notified without triggering a build of the [HookWidget].
///
/// Consider this as an alterntive to [useListenable] if you want to avoid the [HookWidget] to rebuild.
///
/// See:
///  [useValueListener]
void useListener(
  Listenable? listenable, {
  required bool callInitially,
  required VoidCallback callback,
}) {
  // store the latest version of `callback`
  final callbackHolder = useVariable(callback)..value = callback;

  useEffect(() {
    if (listenable == null) {
      return null;
    }

    void _callback() => callbackHolder.value.call();

    listenable.addListener(_callback);
    if (callInitially) {
      _callback();
    }
    return () => listenable.removeListener(_callback);
  }, [listenable]);
}

///
/// A callback receiving a single `value`.
///
typedef ValueCallback<T> = void Function(T value);

///
/// Adds `callback` as listener to `listenable` and removes it again upon destruction of the hook.
/// If called multiple times with different `callback`s, the one from the most recent call will be used.
///
/// If `callInitially` is true, the callback is called immediately, otherwise the callback is called
/// when the `listenable` is notified without triggering a build of the [HookWidget].
///
/// Consider this as an alterntive to [useValueListenable] if you want to avoid the [HookWidget] to rebuild.
///
/// See:
///  [useListener]
///
void useValueListener<T>(
  ValueListenable<T>? listenable, {
  required bool callInitially,
  required ValueCallback callback,
}) {
  // store the latest version of `callback`
  final callbackHolder = useVariable(callback)..value = callback;

  useEffect(() {
    if (listenable == null) {
      return null;
    }
    void _callback() => callbackHolder.value(listenable.value);

    listenable.addListener(_callback);
    if (callInitially) {
      callback(listenable.value);
    }
    return () => listenable.removeListener(_callback);
  }, [listenable]);
}

///
/// Initially (and whenever `keys` change), `create` will be called to create an instance of `T` that
/// will then always be returned late ron.
///
/// The created instance will be passed to `dispose` upon destruction of the hook.
///
///
T useDisposable<T extends Object>(
  T Function() create,
  ValueCallback<T> dispose, [
  List<Object> keys = const [],
]) {
  return use(_DisposableHook(create, dispose, keys: keys));
}

class _DisposableHook<T extends Object> extends Hook<T> {
  const _DisposableHook(
    this.create,
    this.dispose, {
    required List<Object> keys,
  }) : super(keys: keys);

  final T Function() create;

  final ValueCallback<T> dispose;

  @override
  _DisposableHookState<T> createState() => _DisposableHookState<T>();
}

class _DisposableHookState<T extends Object> extends HookState<T, _DisposableHook<T>> {
  late T _value;

  @override
  T build(BuildContext _context) => _value;

  @override
  void initHook() => _value = hook.create();

  @override
  void dispose() => hook.dispose(_value);
}

///
/// Turn the Future returned by `future`  into an `AsyncValue`.
///
/// The returned `future` is memoized and re-evaluated whenever `keys` change.
///
AsyncValue<T> useAsyncValue<T>(
  Future<T> Function() future, [
  List<Object?> keys = const <Object>[],
]) =>
    useFuture(
      useMemoized(() => AsyncValue.guard(future), keys),
      initialData: AsyncValue<T>.loading(),
    ).data!;

///
/// Remembers and returns the most recent valid `AsyncData` with the following logic:
///
/// - [AsyncData<T>] is remembered
/// - [AsyncError] resets to `null`.
/// - [AsyncLoading] is ignored
///
AsyncData<T>? useLastValidAsyncData<T>(AsyncValue<T> value) {
  final state = useState<AsyncData<T>?>(null);
  if (value is AsyncData<T>) {
    state.value = value;
  } else if (value is AsyncError) {
    state.value = null;
  }
  return state.value;
}

class AsyncValueCached<T> {
  AsyncValueCached({
    required this.cached,
    required this.refresh,
  });
  final AsyncValue<T> cached;
  void Function({required bool reset}) refresh;
  void hardRefresh() => refresh(reset: true);
  void softRefresh() => refresh(reset: false);
}

AsyncValueCached<T> useAsyncValueProvider<T>(RootProvider<Object?, AsyncValue<T>> provider, [List<Object?> keys = const <Object>[]]) {
  final context = useContext();
  final value = useProvider(provider);
  final cached = useState<AsyncValue<T>>(value);

  void refresh({bool reset = false}) {
    if (reset) {
      cached.value = const AsyncLoading();
    }
    context.refresh(provider);
  }

  useEffect(() {
    cached.value = value;
  }, keys);

  if (value is AsyncData<T> || value is AsyncError) {
    cached.value = value;
  }

  return AsyncValueCached<T>(
    cached: cached.value,
    refresh: refresh,
  );
}
