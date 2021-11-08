import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'router.freezed.dart';

///
/// See [UriRoute].
///
typedef PageBuilder = Widget Function(BuildContext context, PageParams params);

///
/// See [UriRoute].
///
typedef RouteBuilder = Route<dynamic> Function(RouteSettings settings, WidgetBuilder builder);

///
/// See [UriRoute].
///
@freezed
class PageParams with _$PageParams {
  factory PageParams({
    required Map<String, String> pathParams,
    required Uri uri,
  }) = _PageParams;

  PageParams._();

  Map<String, String> get queryParams => uri.queryParameters;
}

///
/// A simple and flexible [Uri]-based page router.
///
/// Example:
///
/// ```dart
/// class BooksPage extends StatelessWidget {
///   static final route = UriRoute(
///     path: '/books/:id',
///     pageBuilder: (context, params) => BooksPage(id: params.pathParams['id']!),
///   );
///
///   static String path(String id) => route.build(pathParams: <String, String>{'id': id});
/// ...
/// }
///
/// final router = UriRouter([
///   BooksPage.route,
/// ]);
///
/// runApp(MaterialApp(onGenerateRoute: router.generateRoute));
///
/// Navigator.pushNamed(context, BooksPage.path('42'));
/// ```
///
/// See:
/// - [addRoute]
/// - [generateRoute]
///
class UriRouter {
  UriRouter({
    this.defaultRouteBuilder = materialPageRouteBuilder,
    this.defaultRoute,
    List<UriRoute> routes = const [],
  }) {
    _routes.addAll(routes);
  }

  ///
  /// [RouteBuilder] to be used if `routeBuilder` is omitted in an added [UriRoute].
  ///
  final RouteBuilder defaultRouteBuilder;

  ///
  /// Route that is used if the requested route couldn't be found.
  ///
  final UriRoute? defaultRoute;

  ///
  /// Add the [UriRoute] `route`.
  ///
  /// If `routeBuilder` is omitted, [defaultRouteBuilder] is used.
  ///
  void addRoute(UriRoute route) => _routes.add(route);

  ///
  /// Add the [UriRoute] `routes`.
  ///
  /// See [addRoute].
  ///
  void addRoutes(Iterable<UriRoute> routes) => routes.forEach(addRoute);

  ///
  /// Pass this function to [WidgetsApp.onGenerateRoute]/[MaterialApp.onGenerateRoute].
  ///
  Route<dynamic>? generateRoute(RouteSettings settings) {
    final uri = Uri.parse(settings.name!);
    final pathSegments = uri.pathSegments;
    for (final route in _routes) {
      if (route.pathSegments.length != pathSegments.length) {
        continue;
      }
      bool failed = false;
      for (var i = 0; !failed && i < pathSegments.length; i++) {
        failed = !route.pathSegmentIsKey[i] && pathSegments[i] != route.pathSegments[i];
      }
      if (failed) {
        continue;
      }
      final pathParams = <String, String>{};
      for (var i = 0; i < pathSegments.length; i++) {
        if (route.pathSegmentIsKey[i]) {
          pathParams[route.pathSegments[i]] = pathSegments[i];
        }
      }
      final pageParams = PageParams(pathParams: pathParams, uri: uri);
      return (route.routeBuilder ?? defaultRouteBuilder)(settings, (context) => route.pageBuilder(context, pageParams));
    }
    if (defaultRoute == null) {
      return null;
    }
    return (defaultRoute!.routeBuilder ?? defaultRouteBuilder)(
      settings,
      (context) => defaultRoute!.pageBuilder(
        context,
        PageParams(pathParams: <String, String>{}, uri: uri),
      ),
    );
  }

  static Route<dynamic> materialPageRouteBuilder(RouteSettings settings, WidgetBuilder builder) => MaterialPageRoute<dynamic>(
        settings: settings,
        builder: builder,
      );

  final _routes = <UriRoute>[];
}

///
/// A route to be used in [UriRouter.addRoute].
///
@freezed
class UriRoute with _$UriRoute {
  ///
  /// Use `:key` to allow matching of parts of the route to keys.
  ///
  factory UriRoute({
    required String path,
    required PageBuilder pageBuilder,
    RouteBuilder? routeBuilder,
  }) = _UriRoute;

  ///
  /// Use `:key` to allow matching of parts of the route to keys.
  ///
  /// Convenience variant if you just have a [Widget] without any arguments.
  ///
  factory UriRoute.widget({
    required String path,
    required Widget child,
    RouteBuilder? routeBuilder,
  }) =>
      UriRoute(
        path: path,
        pageBuilder: (_, __) => child,
        routeBuilder: routeBuilder,
      );

  UriRoute._();

  ///
  /// Path segments with the leading `:` of keys being stripped.
  ///
  late final List<String> pathSegments = Uri.parse(path).pathSegments.mapIndexed((i, _) => pathSegmentIsKey[i] ? _.substring(1) : _).toList();

  ///
  /// Tell whether the given segment is a key (has a leading `:` in [path]).
  ///
  late final List<bool> pathSegmentIsKey = Uri.parse(path).pathSegments.map((_) => _.startsWith(':')).toList();

  ///
  /// Build the `path` with the given arguments.
  ///
  /// Pass the result to [Navigator.pushNamed].
  ///
  String build({
    Map<String, String>? queryParams,
    Map<String, String>? pathParams,
  }) {
    final pathSegments = this.pathSegments.toList(); // create copy
    final pathSegmentIsKey = this.pathSegmentIsKey.toList(); // create copy
    if (pathParams != null) {
      for (final e in pathParams.entries) {
        var i = 0;
        for (i = 0; i < pathSegments.length; i++) {
          if (pathSegmentIsKey[i] && pathSegments[i] == e.key) {
            break;
          }
        }
        if (i == pathSegments.length) {
          throw ArgumentError.value(
            pathParams,
            'pathParams',
            'Key ${e.key} is not a segment key in path "$path"',
          );
        }
        pathSegments[i] = e.value;
        pathSegmentIsKey[i] = false;
      }
    }
    final i = pathSegmentIsKey.indexOf(true);
    if (i >= 0) {
      throw ArgumentError.value(
        pathParams,
        'pathParams',
        'Missing a value for segment key ${pathSegments[i]} in path "$path"',
      );
    }
    return Uri(
      pathSegments: ['', ...pathSegments],
      queryParameters: queryParams,
    ).toString();
  }
}
