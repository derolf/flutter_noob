export 'constants.dart';
export 'hooks.dart';
export 'providers.dart';
export 'router.dart';

extension ObjectExt<T> on T {
  R let<R>(R Function(T that) op) => op(this);
  T? get $ => this;
}
