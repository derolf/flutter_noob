// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'router.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
      _$PageParamsCopyWithImpl<$Res, PageParams>;
  @useResult
  $Res call({Map<String, String> pathParams, Uri uri});
}

/// @nodoc
class _$PageParamsCopyWithImpl<$Res, $Val extends PageParams>
    implements $PageParamsCopyWith<$Res> {
  _$PageParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pathParams = null,
    Object? uri = null,
  }) {
    return _then(_value.copyWith(
      pathParams: null == pathParams
          ? _value.pathParams
          : pathParams // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      uri: null == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as Uri,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PageParamsCopyWith<$Res>
    implements $PageParamsCopyWith<$Res> {
  factory _$$_PageParamsCopyWith(
          _$_PageParams value, $Res Function(_$_PageParams) then) =
      __$$_PageParamsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, String> pathParams, Uri uri});
}

/// @nodoc
class __$$_PageParamsCopyWithImpl<$Res>
    extends _$PageParamsCopyWithImpl<$Res, _$_PageParams>
    implements _$$_PageParamsCopyWith<$Res> {
  __$$_PageParamsCopyWithImpl(
      _$_PageParams _value, $Res Function(_$_PageParams) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pathParams = null,
    Object? uri = null,
  }) {
    return _then(_$_PageParams(
      pathParams: null == pathParams
          ? _value._pathParams
          : pathParams // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      uri: null == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as Uri,
    ));
  }
}

/// @nodoc

class _$_PageParams extends _PageParams {
  _$_PageParams(
      {required final Map<String, String> pathParams, required this.uri})
      : _pathParams = pathParams,
        super._();

  final Map<String, String> _pathParams;
  @override
  Map<String, String> get pathParams {
    if (_pathParams is EqualUnmodifiableMapView) return _pathParams;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_pathParams);
  }

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
            other is _$_PageParams &&
            const DeepCollectionEquality()
                .equals(other._pathParams, _pathParams) &&
            (identical(other.uri, uri) || other.uri == uri));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_pathParams), uri);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PageParamsCopyWith<_$_PageParams> get copyWith =>
      __$$_PageParamsCopyWithImpl<_$_PageParams>(this, _$identity);
}

abstract class _PageParams extends PageParams {
  factory _PageParams(
      {required final Map<String, String> pathParams,
      required final Uri uri}) = _$_PageParams;
  _PageParams._() : super._();

  @override
  Map<String, String> get pathParams;
  @override
  Uri get uri;
  @override
  @JsonKey(ignore: true)
  _$$_PageParamsCopyWith<_$_PageParams> get copyWith =>
      throw _privateConstructorUsedError;
}

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
      _$UriRouteCopyWithImpl<$Res, UriRoute>;
  @useResult
  $Res call({String path, PageBuilder pageBuilder, RouteBuilder? routeBuilder});
}

/// @nodoc
class _$UriRouteCopyWithImpl<$Res, $Val extends UriRoute>
    implements $UriRouteCopyWith<$Res> {
  _$UriRouteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? pageBuilder = null,
    Object? routeBuilder = freezed,
  }) {
    return _then(_value.copyWith(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      pageBuilder: null == pageBuilder
          ? _value.pageBuilder
          : pageBuilder // ignore: cast_nullable_to_non_nullable
              as PageBuilder,
      routeBuilder: freezed == routeBuilder
          ? _value.routeBuilder
          : routeBuilder // ignore: cast_nullable_to_non_nullable
              as RouteBuilder?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UriRouteCopyWith<$Res> implements $UriRouteCopyWith<$Res> {
  factory _$$_UriRouteCopyWith(
          _$_UriRoute value, $Res Function(_$_UriRoute) then) =
      __$$_UriRouteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String path, PageBuilder pageBuilder, RouteBuilder? routeBuilder});
}

/// @nodoc
class __$$_UriRouteCopyWithImpl<$Res>
    extends _$UriRouteCopyWithImpl<$Res, _$_UriRoute>
    implements _$$_UriRouteCopyWith<$Res> {
  __$$_UriRouteCopyWithImpl(
      _$_UriRoute _value, $Res Function(_$_UriRoute) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? pageBuilder = null,
    Object? routeBuilder = freezed,
  }) {
    return _then(_$_UriRoute(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      pageBuilder: null == pageBuilder
          ? _value.pageBuilder
          : pageBuilder // ignore: cast_nullable_to_non_nullable
              as PageBuilder,
      routeBuilder: freezed == routeBuilder
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
            other is _$_UriRoute &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.pageBuilder, pageBuilder) ||
                other.pageBuilder == pageBuilder) &&
            (identical(other.routeBuilder, routeBuilder) ||
                other.routeBuilder == routeBuilder));
  }

  @override
  int get hashCode => Object.hash(runtimeType, path, pageBuilder, routeBuilder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UriRouteCopyWith<_$_UriRoute> get copyWith =>
      __$$_UriRouteCopyWithImpl<_$_UriRoute>(this, _$identity);
}

abstract class _UriRoute extends UriRoute {
  factory _UriRoute(
      {required final String path,
      required final PageBuilder pageBuilder,
      final RouteBuilder? routeBuilder}) = _$_UriRoute;
  _UriRoute._() : super._();

  @override
  String get path;
  @override
  PageBuilder get pageBuilder;
  @override
  RouteBuilder? get routeBuilder;
  @override
  @JsonKey(ignore: true)
  _$$_UriRouteCopyWith<_$_UriRoute> get copyWith =>
      throw _privateConstructorUsedError;
}
