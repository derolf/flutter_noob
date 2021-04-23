// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'build_tracker.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RebuildDirtyWidgetTearOff {
  const _$RebuildDirtyWidgetTearOff();

  _RebuildDirtyWidget call({required int timestamp, required String widget}) {
    return _RebuildDirtyWidget(
      timestamp: timestamp,
      widget: widget,
    );
  }
}

/// @nodoc
const $RebuildDirtyWidget = _$RebuildDirtyWidgetTearOff();

/// @nodoc
mixin _$RebuildDirtyWidget {
  int get timestamp => throw _privateConstructorUsedError;
  String get widget => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RebuildDirtyWidgetCopyWith<RebuildDirtyWidget> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RebuildDirtyWidgetCopyWith<$Res> {
  factory $RebuildDirtyWidgetCopyWith(
          RebuildDirtyWidget value, $Res Function(RebuildDirtyWidget) then) =
      _$RebuildDirtyWidgetCopyWithImpl<$Res>;
  $Res call({int timestamp, String widget});
}

/// @nodoc
class _$RebuildDirtyWidgetCopyWithImpl<$Res>
    implements $RebuildDirtyWidgetCopyWith<$Res> {
  _$RebuildDirtyWidgetCopyWithImpl(this._value, this._then);

  final RebuildDirtyWidget _value;
  // ignore: unused_field
  final $Res Function(RebuildDirtyWidget) _then;

  @override
  $Res call({
    Object? timestamp = freezed,
    Object? widget = freezed,
  }) {
    return _then(_value.copyWith(
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      widget: widget == freezed
          ? _value.widget
          : widget // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$RebuildDirtyWidgetCopyWith<$Res>
    implements $RebuildDirtyWidgetCopyWith<$Res> {
  factory _$RebuildDirtyWidgetCopyWith(
          _RebuildDirtyWidget value, $Res Function(_RebuildDirtyWidget) then) =
      __$RebuildDirtyWidgetCopyWithImpl<$Res>;
  @override
  $Res call({int timestamp, String widget});
}

/// @nodoc
class __$RebuildDirtyWidgetCopyWithImpl<$Res>
    extends _$RebuildDirtyWidgetCopyWithImpl<$Res>
    implements _$RebuildDirtyWidgetCopyWith<$Res> {
  __$RebuildDirtyWidgetCopyWithImpl(
      _RebuildDirtyWidget _value, $Res Function(_RebuildDirtyWidget) _then)
      : super(_value, (v) => _then(v as _RebuildDirtyWidget));

  @override
  _RebuildDirtyWidget get _value => super._value as _RebuildDirtyWidget;

  @override
  $Res call({
    Object? timestamp = freezed,
    Object? widget = freezed,
  }) {
    return _then(_RebuildDirtyWidget(
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      widget: widget == freezed
          ? _value.widget
          : widget // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RebuildDirtyWidget implements _RebuildDirtyWidget {
  _$_RebuildDirtyWidget({required this.timestamp, required this.widget});

  @override
  final int timestamp;
  @override
  final String widget;

  @override
  String toString() {
    return 'RebuildDirtyWidget(timestamp: $timestamp, widget: $widget)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RebuildDirtyWidget &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)) &&
            (identical(other.widget, widget) ||
                const DeepCollectionEquality().equals(other.widget, widget)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(timestamp) ^
      const DeepCollectionEquality().hash(widget);

  @JsonKey(ignore: true)
  @override
  _$RebuildDirtyWidgetCopyWith<_RebuildDirtyWidget> get copyWith =>
      __$RebuildDirtyWidgetCopyWithImpl<_RebuildDirtyWidget>(this, _$identity);
}

abstract class _RebuildDirtyWidget implements RebuildDirtyWidget {
  factory _RebuildDirtyWidget(
      {required int timestamp, required String widget}) = _$_RebuildDirtyWidget;

  @override
  int get timestamp => throw _privateConstructorUsedError;
  @override
  String get widget => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RebuildDirtyWidgetCopyWith<_RebuildDirtyWidget> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ScheduleBuildForTearOff {
  const _$ScheduleBuildForTearOff();

  _ScheduleBuildFor call(
      {required int timestamp,
      required String widget,
      required BuiltList<String> stack}) {
    return _ScheduleBuildFor(
      timestamp: timestamp,
      widget: widget,
      stack: stack,
    );
  }
}

/// @nodoc
const $ScheduleBuildFor = _$ScheduleBuildForTearOff();

/// @nodoc
mixin _$ScheduleBuildFor {
  int get timestamp => throw _privateConstructorUsedError;
  String get widget => throw _privateConstructorUsedError;
  BuiltList<String> get stack => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScheduleBuildForCopyWith<ScheduleBuildFor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleBuildForCopyWith<$Res> {
  factory $ScheduleBuildForCopyWith(
          ScheduleBuildFor value, $Res Function(ScheduleBuildFor) then) =
      _$ScheduleBuildForCopyWithImpl<$Res>;
  $Res call({int timestamp, String widget, BuiltList<String> stack});
}

/// @nodoc
class _$ScheduleBuildForCopyWithImpl<$Res>
    implements $ScheduleBuildForCopyWith<$Res> {
  _$ScheduleBuildForCopyWithImpl(this._value, this._then);

  final ScheduleBuildFor _value;
  // ignore: unused_field
  final $Res Function(ScheduleBuildFor) _then;

  @override
  $Res call({
    Object? timestamp = freezed,
    Object? widget = freezed,
    Object? stack = freezed,
  }) {
    return _then(_value.copyWith(
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      widget: widget == freezed
          ? _value.widget
          : widget // ignore: cast_nullable_to_non_nullable
              as String,
      stack: stack == freezed
          ? _value.stack
          : stack // ignore: cast_nullable_to_non_nullable
              as BuiltList<String>,
    ));
  }
}

/// @nodoc
abstract class _$ScheduleBuildForCopyWith<$Res>
    implements $ScheduleBuildForCopyWith<$Res> {
  factory _$ScheduleBuildForCopyWith(
          _ScheduleBuildFor value, $Res Function(_ScheduleBuildFor) then) =
      __$ScheduleBuildForCopyWithImpl<$Res>;
  @override
  $Res call({int timestamp, String widget, BuiltList<String> stack});
}

/// @nodoc
class __$ScheduleBuildForCopyWithImpl<$Res>
    extends _$ScheduleBuildForCopyWithImpl<$Res>
    implements _$ScheduleBuildForCopyWith<$Res> {
  __$ScheduleBuildForCopyWithImpl(
      _ScheduleBuildFor _value, $Res Function(_ScheduleBuildFor) _then)
      : super(_value, (v) => _then(v as _ScheduleBuildFor));

  @override
  _ScheduleBuildFor get _value => super._value as _ScheduleBuildFor;

  @override
  $Res call({
    Object? timestamp = freezed,
    Object? widget = freezed,
    Object? stack = freezed,
  }) {
    return _then(_ScheduleBuildFor(
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      widget: widget == freezed
          ? _value.widget
          : widget // ignore: cast_nullable_to_non_nullable
              as String,
      stack: stack == freezed
          ? _value.stack
          : stack // ignore: cast_nullable_to_non_nullable
              as BuiltList<String>,
    ));
  }
}

/// @nodoc

class _$_ScheduleBuildFor implements _ScheduleBuildFor {
  _$_ScheduleBuildFor(
      {required this.timestamp, required this.widget, required this.stack});

  @override
  final int timestamp;
  @override
  final String widget;
  @override
  final BuiltList<String> stack;

  @override
  String toString() {
    return 'ScheduleBuildFor(timestamp: $timestamp, widget: $widget, stack: $stack)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ScheduleBuildFor &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)) &&
            (identical(other.widget, widget) ||
                const DeepCollectionEquality().equals(other.widget, widget)) &&
            (identical(other.stack, stack) ||
                const DeepCollectionEquality().equals(other.stack, stack)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(timestamp) ^
      const DeepCollectionEquality().hash(widget) ^
      const DeepCollectionEquality().hash(stack);

  @JsonKey(ignore: true)
  @override
  _$ScheduleBuildForCopyWith<_ScheduleBuildFor> get copyWith =>
      __$ScheduleBuildForCopyWithImpl<_ScheduleBuildFor>(this, _$identity);
}

abstract class _ScheduleBuildFor implements ScheduleBuildFor {
  factory _ScheduleBuildFor(
      {required int timestamp,
      required String widget,
      required BuiltList<String> stack}) = _$_ScheduleBuildFor;

  @override
  int get timestamp => throw _privateConstructorUsedError;
  @override
  String get widget => throw _privateConstructorUsedError;
  @override
  BuiltList<String> get stack => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ScheduleBuildForCopyWith<_ScheduleBuildFor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$BuildFrameTearOff {
  const _$BuildFrameTearOff();

  _BuildFrame call(
      {required int number,
      required BuiltList<RebuildDirtyWidget> rebuildDirtyWidgets,
      required BuiltList<ScheduleBuildFor> schedueBuildFors}) {
    return _BuildFrame(
      number: number,
      rebuildDirtyWidgets: rebuildDirtyWidgets,
      schedueBuildFors: schedueBuildFors,
    );
  }
}

/// @nodoc
const $BuildFrame = _$BuildFrameTearOff();

/// @nodoc
mixin _$BuildFrame {
  int get number => throw _privateConstructorUsedError;
  BuiltList<RebuildDirtyWidget> get rebuildDirtyWidgets =>
      throw _privateConstructorUsedError;
  BuiltList<ScheduleBuildFor> get schedueBuildFors =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BuildFrameCopyWith<BuildFrame> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BuildFrameCopyWith<$Res> {
  factory $BuildFrameCopyWith(
          BuildFrame value, $Res Function(BuildFrame) then) =
      _$BuildFrameCopyWithImpl<$Res>;
  $Res call(
      {int number,
      BuiltList<RebuildDirtyWidget> rebuildDirtyWidgets,
      BuiltList<ScheduleBuildFor> schedueBuildFors});
}

/// @nodoc
class _$BuildFrameCopyWithImpl<$Res> implements $BuildFrameCopyWith<$Res> {
  _$BuildFrameCopyWithImpl(this._value, this._then);

  final BuildFrame _value;
  // ignore: unused_field
  final $Res Function(BuildFrame) _then;

  @override
  $Res call({
    Object? number = freezed,
    Object? rebuildDirtyWidgets = freezed,
    Object? schedueBuildFors = freezed,
  }) {
    return _then(_value.copyWith(
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      rebuildDirtyWidgets: rebuildDirtyWidgets == freezed
          ? _value.rebuildDirtyWidgets
          : rebuildDirtyWidgets // ignore: cast_nullable_to_non_nullable
              as BuiltList<RebuildDirtyWidget>,
      schedueBuildFors: schedueBuildFors == freezed
          ? _value.schedueBuildFors
          : schedueBuildFors // ignore: cast_nullable_to_non_nullable
              as BuiltList<ScheduleBuildFor>,
    ));
  }
}

/// @nodoc
abstract class _$BuildFrameCopyWith<$Res> implements $BuildFrameCopyWith<$Res> {
  factory _$BuildFrameCopyWith(
          _BuildFrame value, $Res Function(_BuildFrame) then) =
      __$BuildFrameCopyWithImpl<$Res>;
  @override
  $Res call(
      {int number,
      BuiltList<RebuildDirtyWidget> rebuildDirtyWidgets,
      BuiltList<ScheduleBuildFor> schedueBuildFors});
}

/// @nodoc
class __$BuildFrameCopyWithImpl<$Res> extends _$BuildFrameCopyWithImpl<$Res>
    implements _$BuildFrameCopyWith<$Res> {
  __$BuildFrameCopyWithImpl(
      _BuildFrame _value, $Res Function(_BuildFrame) _then)
      : super(_value, (v) => _then(v as _BuildFrame));

  @override
  _BuildFrame get _value => super._value as _BuildFrame;

  @override
  $Res call({
    Object? number = freezed,
    Object? rebuildDirtyWidgets = freezed,
    Object? schedueBuildFors = freezed,
  }) {
    return _then(_BuildFrame(
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      rebuildDirtyWidgets: rebuildDirtyWidgets == freezed
          ? _value.rebuildDirtyWidgets
          : rebuildDirtyWidgets // ignore: cast_nullable_to_non_nullable
              as BuiltList<RebuildDirtyWidget>,
      schedueBuildFors: schedueBuildFors == freezed
          ? _value.schedueBuildFors
          : schedueBuildFors // ignore: cast_nullable_to_non_nullable
              as BuiltList<ScheduleBuildFor>,
    ));
  }
}

/// @nodoc

class _$_BuildFrame implements _BuildFrame {
  _$_BuildFrame(
      {required this.number,
      required this.rebuildDirtyWidgets,
      required this.schedueBuildFors});

  @override
  final int number;
  @override
  final BuiltList<RebuildDirtyWidget> rebuildDirtyWidgets;
  @override
  final BuiltList<ScheduleBuildFor> schedueBuildFors;

  @override
  String toString() {
    return 'BuildFrame(number: $number, rebuildDirtyWidgets: $rebuildDirtyWidgets, schedueBuildFors: $schedueBuildFors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BuildFrame &&
            (identical(other.number, number) ||
                const DeepCollectionEquality().equals(other.number, number)) &&
            (identical(other.rebuildDirtyWidgets, rebuildDirtyWidgets) ||
                const DeepCollectionEquality()
                    .equals(other.rebuildDirtyWidgets, rebuildDirtyWidgets)) &&
            (identical(other.schedueBuildFors, schedueBuildFors) ||
                const DeepCollectionEquality()
                    .equals(other.schedueBuildFors, schedueBuildFors)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(number) ^
      const DeepCollectionEquality().hash(rebuildDirtyWidgets) ^
      const DeepCollectionEquality().hash(schedueBuildFors);

  @JsonKey(ignore: true)
  @override
  _$BuildFrameCopyWith<_BuildFrame> get copyWith =>
      __$BuildFrameCopyWithImpl<_BuildFrame>(this, _$identity);
}

abstract class _BuildFrame implements BuildFrame {
  factory _BuildFrame(
      {required int number,
      required BuiltList<RebuildDirtyWidget> rebuildDirtyWidgets,
      required BuiltList<ScheduleBuildFor> schedueBuildFors}) = _$_BuildFrame;

  @override
  int get number => throw _privateConstructorUsedError;
  @override
  BuiltList<RebuildDirtyWidget> get rebuildDirtyWidgets =>
      throw _privateConstructorUsedError;
  @override
  BuiltList<ScheduleBuildFor> get schedueBuildFors =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BuildFrameCopyWith<_BuildFrame> get copyWith =>
      throw _privateConstructorUsedError;
}
