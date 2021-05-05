import 'package:hooks_riverpod/hooks_riverpod.dart';

export 'constants.dart';
export 'empty_built_collections.dart';
export 'hooks.dart';
export 'listenable.dart';
export 'providers.dart';
export 'router.dart';

extension ObjectExt<T> on T {
  R let<R>(R Function(T that) op) => op(this);
  T? get $ => this;
}

extension AsyncValueExt<T> on AsyncValue<T> {
  ///
  /// Handy variant of [when] with mapping:
  ///
  /// - `AsyncData(data)` to `dataOrLoading(data)`
  /// - `AsyncLoading()` to `dataOrLoading(null)`
  /// - `AsyncError(error, stackTrace)` to `error(error, stackTrace)`
  ///
  R when2<R>(
    R Function(Object error, StackTrace? stackTrace) error,
    R Function(T? value) dataOrLoading,
  ) =>
      when(
        error: error,
        data: dataOrLoading,
        loading: () => dataOrLoading(null),
      );
}
