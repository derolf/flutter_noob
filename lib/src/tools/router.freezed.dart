// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'router.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PageParamsTearOff {
  const _$PageParamsTearOff();

  _PageParams call(
      {required Map<String, String> pathParams, required Uri uri}) {
    return _PageParams(
      pathParams: pathParams,
      uri: uri,
    );
  }
}

/// @nodoc
const $PageParams = _$PageParamsTearOff();

/// @nodoc
mixin _$PageParams {
  Map<String, String> get pathParams => throw _privateConstructorUsedError;
  Uri get uri => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PageParamsCopyWith<PageParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageParamsCopyWith<$Res> {
  factory $PageParamsCopyWith(
          PageParams value, $Res Function(PageParams) then) =
      _$PageParamsCopyWithImpl<$Res>;
  $Res call({Map<String, String> pathParams, Uri uri});
}

/// @nodoc
class _$PageParamsCopyWithImpl<$Res> implements $PageParamsCopyWith<$Res> {
  _$PageParamsCopyWithImpl(this._value, this._then);

  final PageParams _value;
  // ignore: unused_field
  final $Res Function(PageParams) _then;

  @override
  $Res call({
    Object? pathParams = freezed,
    Object? uri = freezed,
  }) {
    return _then(_value.copyWith(
      pathParams: pathParams == freezed
          ? _value.pathParams
          : pathParams // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      uri: uri == freezed
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as Uri,
    ));
  }
}

/// @nodoc
abstract class _$PageParamsCopyWith<$Res> implements $PageParamsCopyWith<$Res> {
  factory _$PageParamsCopyWith(
          _PageParams value, $Res Function(_PageParams) then) =
      __$PageParamsCopyWithImpl<$Res>;
  @override
  $Res call({Map<String, String> pathParams, Uri uri});
}

/// @nodoc
class __$PageParamsCopyWithImpl<$Res> extends _$PageParamsCopyWithImpl<$Res>
    implements _$PageParamsCopyWith<$Res> {
  __$PageParamsCopyWithImpl(
      _PageParams _value, $Res Function(_PageParams) _then)
      : super(_value, (v) => _then(v as _PageParams));

  @override
  _PageParams get _value => super._value as _PageParams;

  @override
  $Res call({
    Object? pathParams = freezed,
    Object? uri = freezed,
  }) {
    return _then(_PageParams(
      pathParams: pathParams == freezed
          ? _value.pathParams
          : pathParams // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      uri: uri == freezed
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as Uri,
    ));
  }
}

/// @nodoc

class _$_PageParams extends _PageParams {
  _$_PageParams({required this.pathParams, required this.uri}) : super._();

  @override
  final Map<String, String> pathParams;
  @override
  final Uri uri;

  @override
  String toString() {
    return 'PageParams(pathParams: $pathParams, uri: $uri)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PageParams &&
            const DeepCollectionEquality()
                .equals(other.pathParams, pathParams) &&
            const DeepCollectionEquality().equals(other.uri, uri));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(pathParams),
      const DeepCollectionEquality().hash(uri));

  @JsonKey(ignore: true)
  @override
  _$PageParamsCopyWith<_PageParams> get copyWith =>
      __$PageParamsCopyWithImpl<_PageParams>(this, _$identity);
}

abstract class _PageParams extends PageParams {
  factory _PageParams(
      {required Map<String, String> pathParams,
      required Uri uri}) = _$_PageParams;
  _PageParams._() : super._();

  @override
  Map<String, String> get pathParams;
  @override
  Uri get uri;
  @override
  @JsonKey(ignore: true)
  _$PageParamsCopyWith<_PageParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$UriRouteTearOff {
  const _$UriRouteTearOff();

  _UriRoute call(
      {required String path,
      required PageBuilder pageBuilder,
      RouteBuilder? routeBuilder}) {
    return _UriRoute(
      path: path,
      pageBuilder: pageBuilder,
      routeBuilder: routeBuilder,
    );
  }
}

/// @nodoc
const $UriRoute = _$UriRouteTearOff();

/// @nodoc
mixin _$UriRoute {
  String get path => throw _privateConstructorUsedError;
  PageBuilder get pageBuilder => throw _privateConstructorUsedError;
  RouteBuilder? get routeBuilder => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UriRouteCopyWith<UriRoute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UriRouteCopyWith<$Res> {
  factory $UriRouteCopyWith(UriRoute value, $Res Function(UriRoute) then) =
      _$UriRouteCopyWithImpl<$Res>;
  $Res call({String path, PageBuilder pageBuilder, RouteBuilder? routeBuilder});
}

/// @nodoc
class _$UriRouteCopyWithImpl<$Res> implements $UriRouteCopyWith<$Res> {
  _$UriRouteCopyWithImpl(this._value, this._then);

  final UriRoute _value;
  // ignore: unused_field
  final $Res Function(UriRoute) _then;

  @override
  $Res call({
    Object? path = freezed,
    Object? pageBuilder = freezed,
    Object? routeBuilder = freezed,
  }) {
    return _then(_value.copyWith(
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      pageBuilder: pageBuilder == freezed
          ? _value.pageBuilder
          : pageBuilder // ignore: cast_nullable_to_non_nullable
              as PageBuilder,
      routeBuilder: routeBuilder == freezed
          ? _value.routeBuilder
          : routeBuilder // ignore: cast_nullable_to_non_nullable
              as RouteBuilder?,
    ));
  }
}

/// @nodoc
abstract class _$UriRouteCopyWith<$Res> implements $UriRouteCopyWith<$Res> {
  factory _$UriRouteCopyWith(_UriRoute value, $Res Function(_UriRoute) then) =
      __$UriRouteCopyWithImpl<$Res>;
  @override
  $Res call({String path, PageBuilder pageBuilder, RouteBuilder? routeBuilder});
}

/// @nodoc
class __$UriRouteCopyWithImpl<$Res> extends _$UriRouteCopyWithImpl<$Res>
    implements _$UriRouteCopyWith<$Res> {
  __$UriRouteCopyWithImpl(_UriRoute _value, $Res Function(_UriRoute) _then)
      : super(_value, (v) => _then(v as _UriRoute));

  @override
  _UriRoute get _value => super._value as _UriRoute;

  @override
  $Res call({
    Object? path = freezed,
    Object? pageBuilder = freezed,
    Object? routeBuilder = freezed,
  }) {
    return _then(_UriRoute(
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      pageBuilder: pageBuilder == freezed
          ? _value.pageBuilder
          : pageBuilder // ignore: cast_nullable_to_non_nullable
              as PageBuilder,
      routeBuilder: routeBuilder == freezed
          ? _value.routeBuilder
          : routeBuilder // ignore: cast_nullable_to_non_nullable
              as RouteBuilder?,
    ));
  }
}

/// @nodoc

class _$_UriRoute extends _UriRoute {
  _$_UriRoute(
      {required this.path, required this.pageBuilder, this.routeBuilder})
      : super._();

  @override
  final String path;
  @override
  final PageBuilder pageBuilder;
  @override
  final RouteBuilder? routeBuilder;

  @override
  String toString() {
    return 'UriRoute(path: $path, pageBuilder: $pageBuilder, routeBuilder: $routeBuilder)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UriRoute &&
            const DeepCollectionEquality().equals(other.path, path) &&
            (identical(other.pageBuilder, pageBuilder) ||
                other.pageBuilder == pageBuilder) &&
            (identical(other.routeBuilder, routeBuilder) ||
                other.routeBuilder == routeBuilder));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(path), pageBuilder, routeBuilder);

  @JsonKey(ignore: true)
  @override
  _$UriRouteCopyWith<_UriRoute> get copyWith =>
      __$UriRouteCopyWithImpl<_UriRoute>(this, _$identity);
}

abstract class _UriRoute extends UriRoute {
  factory _UriRoute(
      {required String path,
      required PageBuilder pageBuilder,
      RouteBuilder? routeBuilder}) = _$_UriRoute;
  _UriRoute._() : super._();

  @override
  String get path;
  @override
  PageBuilder get pageBuilder;
  @override
  RouteBuilder? get routeBuilder;
  @override
  @JsonKey(ignore: true)
  _$UriRouteCopyWith<_UriRoute> get copyWith =>
      throw _privateConstructorUsedError;
}
