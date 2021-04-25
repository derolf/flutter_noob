import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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
