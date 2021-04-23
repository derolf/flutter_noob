// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'build_tracker.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BuildEntry _$BuildEntryFromJson(Map<String, dynamic> json) {
  return _BuildEntry.fromJson(json);
}

/// @nodoc
class _$BuildEntryTearOff {
  const _$BuildEntryTearOff();

  _BuildEntry call({required int timestamp, required String widget}) {
    return _BuildEntry(
      timestamp: timestamp,
      widget: widget,
    );
  }

  BuildEntry fromJson(Map<String, Object> json) {
    return BuildEntry.fromJson(json);
  }
}

/// @nodoc
const $BuildEntry = _$BuildEntryTearOff();

/// @nodoc
mixin _$BuildEntry {
  int get timestamp => throw _privateConstructorUsedError;
  String get widget => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BuildEntryCopyWith<BuildEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BuildEntryCopyWith<$Res> {
  factory $BuildEntryCopyWith(
          BuildEntry value, $Res Function(BuildEntry) then) =
      _$BuildEntryCopyWithImpl<$Res>;
  $Res call({int timestamp, String widget});
}

/// @nodoc
class _$BuildEntryCopyWithImpl<$Res> implements $BuildEntryCopyWith<$Res> {
  _$BuildEntryCopyWithImpl(this._value, this._then);

  final BuildEntry _value;
  // ignore: unused_field
  final $Res Function(BuildEntry) _then;

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
abstract class _$BuildEntryCopyWith<$Res> implements $BuildEntryCopyWith<$Res> {
  factory _$BuildEntryCopyWith(
          _BuildEntry value, $Res Function(_BuildEntry) then) =
      __$BuildEntryCopyWithImpl<$Res>;
  @override
  $Res call({int timestamp, String widget});
}

/// @nodoc
class __$BuildEntryCopyWithImpl<$Res> extends _$BuildEntryCopyWithImpl<$Res>
    implements _$BuildEntryCopyWith<$Res> {
  __$BuildEntryCopyWithImpl(
      _BuildEntry _value, $Res Function(_BuildEntry) _then)
      : super(_value, (v) => _then(v as _BuildEntry));

  @override
  _BuildEntry get _value => super._value as _BuildEntry;

  @override
  $Res call({
    Object? timestamp = freezed,
    Object? widget = freezed,
  }) {
    return _then(_BuildEntry(
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

@JsonSerializable()

/// @nodoc
class _$_BuildEntry implements _BuildEntry {
  _$_BuildEntry({required this.timestamp, required this.widget});

  factory _$_BuildEntry.fromJson(Map<String, dynamic> json) =>
      _$_$_BuildEntryFromJson(json);

  @override
  final int timestamp;
  @override
  final String widget;

  @override
  String toString() {
    return 'BuildEntry(timestamp: $timestamp, widget: $widget)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BuildEntry &&
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
  _$BuildEntryCopyWith<_BuildEntry> get copyWith =>
      __$BuildEntryCopyWithImpl<_BuildEntry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BuildEntryToJson(this);
  }
}

abstract class _BuildEntry implements BuildEntry {
  factory _BuildEntry({required int timestamp, required String widget}) =
      _$_BuildEntry;

  factory _BuildEntry.fromJson(Map<String, dynamic> json) =
      _$_BuildEntry.fromJson;

  @override
  int get timestamp => throw _privateConstructorUsedError;
  @override
  String get widget => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BuildEntryCopyWith<_BuildEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

ScheduleBuildEntry _$ScheduleBuildEntryFromJson(Map<String, dynamic> json) {
  return _ScheduleBuildEntry.fromJson(json);
}

/// @nodoc
class _$ScheduleBuildEntryTearOff {
  const _$ScheduleBuildEntryTearOff();

  _ScheduleBuildEntry call(
      {required int timestamp,
      required String widget,
      required BuiltList<String> stack}) {
    return _ScheduleBuildEntry(
      timestamp: timestamp,
      widget: widget,
      stack: stack,
    );
  }

  ScheduleBuildEntry fromJson(Map<String, Object> json) {
    return ScheduleBuildEntry.fromJson(json);
  }
}

/// @nodoc
const $ScheduleBuildEntry = _$ScheduleBuildEntryTearOff();

/// @nodoc
mixin _$ScheduleBuildEntry {
  int get timestamp => throw _privateConstructorUsedError;
  String get widget => throw _privateConstructorUsedError;
  BuiltList<String> get stack => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleBuildEntryCopyWith<ScheduleBuildEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleBuildEntryCopyWith<$Res> {
  factory $ScheduleBuildEntryCopyWith(
          ScheduleBuildEntry value, $Res Function(ScheduleBuildEntry) then) =
      _$ScheduleBuildEntryCopyWithImpl<$Res>;
  $Res call({int timestamp, String widget, BuiltList<String> stack});
}

/// @nodoc
class _$ScheduleBuildEntryCopyWithImpl<$Res>
    implements $ScheduleBuildEntryCopyWith<$Res> {
  _$ScheduleBuildEntryCopyWithImpl(this._value, this._then);

  final ScheduleBuildEntry _value;
  // ignore: unused_field
  final $Res Function(ScheduleBuildEntry) _then;

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
abstract class _$ScheduleBuildEntryCopyWith<$Res>
    implements $ScheduleBuildEntryCopyWith<$Res> {
  factory _$ScheduleBuildEntryCopyWith(
          _ScheduleBuildEntry value, $Res Function(_ScheduleBuildEntry) then) =
      __$ScheduleBuildEntryCopyWithImpl<$Res>;
  @override
  $Res call({int timestamp, String widget, BuiltList<String> stack});
}

/// @nodoc
class __$ScheduleBuildEntryCopyWithImpl<$Res>
    extends _$ScheduleBuildEntryCopyWithImpl<$Res>
    implements _$ScheduleBuildEntryCopyWith<$Res> {
  __$ScheduleBuildEntryCopyWithImpl(
      _ScheduleBuildEntry _value, $Res Function(_ScheduleBuildEntry) _then)
      : super(_value, (v) => _then(v as _ScheduleBuildEntry));

  @override
  _ScheduleBuildEntry get _value => super._value as _ScheduleBuildEntry;

  @override
  $Res call({
    Object? timestamp = freezed,
    Object? widget = freezed,
    Object? stack = freezed,
  }) {
    return _then(_ScheduleBuildEntry(
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

@JsonSerializable()

/// @nodoc
class _$_ScheduleBuildEntry implements _ScheduleBuildEntry {
  _$_ScheduleBuildEntry(
      {required this.timestamp, required this.widget, required this.stack});

  factory _$_ScheduleBuildEntry.fromJson(Map<String, dynamic> json) =>
      _$_$_ScheduleBuildEntryFromJson(json);

  @override
  final int timestamp;
  @override
  final String widget;
  @override
  final BuiltList<String> stack;

  @override
  String toString() {
    return 'ScheduleBuildEntry(timestamp: $timestamp, widget: $widget, stack: $stack)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ScheduleBuildEntry &&
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
  _$ScheduleBuildEntryCopyWith<_ScheduleBuildEntry> get copyWith =>
      __$ScheduleBuildEntryCopyWithImpl<_ScheduleBuildEntry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ScheduleBuildEntryToJson(this);
  }
}

abstract class _ScheduleBuildEntry implements ScheduleBuildEntry {
  factory _ScheduleBuildEntry(
      {required int timestamp,
      required String widget,
      required BuiltList<String> stack}) = _$_ScheduleBuildEntry;

  factory _ScheduleBuildEntry.fromJson(Map<String, dynamic> json) =
      _$_ScheduleBuildEntry.fromJson;

  @override
  int get timestamp => throw _privateConstructorUsedError;
  @override
  String get widget => throw _privateConstructorUsedError;
  @override
  BuiltList<String> get stack => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ScheduleBuildEntryCopyWith<_ScheduleBuildEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

BuildFrame _$BuildFrameFromJson(Map<String, dynamic> json) {
  return _BuildFrame.fromJson(json);
}

/// @nodoc
class _$BuildFrameTearOff {
  const _$BuildFrameTearOff();

  _BuildFrame call(
      {required int number,
      required BuiltList<BuildEntry> built,
      required BuiltList<ScheduleBuildEntry> buildScheduled}) {
    return _BuildFrame(
      number: number,
      built: built,
      buildScheduled: buildScheduled,
    );
  }

  BuildFrame fromJson(Map<String, Object> json) {
    return BuildFrame.fromJson(json);
  }
}

/// @nodoc
const $BuildFrame = _$BuildFrameTearOff();

/// @nodoc
mixin _$BuildFrame {
  int get number => throw _privateConstructorUsedError;
  BuiltList<BuildEntry> get built => throw _privateConstructorUsedError;
  BuiltList<ScheduleBuildEntry> get buildScheduled =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
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
      BuiltList<BuildEntry> built,
      BuiltList<ScheduleBuildEntry> buildScheduled});
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
    Object? built = freezed,
    Object? buildScheduled = freezed,
  }) {
    return _then(_value.copyWith(
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      built: built == freezed
          ? _value.built
          : built // ignore: cast_nullable_to_non_nullable
              as BuiltList<BuildEntry>,
      buildScheduled: buildScheduled == freezed
          ? _value.buildScheduled
          : buildScheduled // ignore: cast_nullable_to_non_nullable
              as BuiltList<ScheduleBuildEntry>,
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
      BuiltList<BuildEntry> built,
      BuiltList<ScheduleBuildEntry> buildScheduled});
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
    Object? built = freezed,
    Object? buildScheduled = freezed,
  }) {
    return _then(_BuildFrame(
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      built: built == freezed
          ? _value.built
          : built // ignore: cast_nullable_to_non_nullable
              as BuiltList<BuildEntry>,
      buildScheduled: buildScheduled == freezed
          ? _value.buildScheduled
          : buildScheduled // ignore: cast_nullable_to_non_nullable
              as BuiltList<ScheduleBuildEntry>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_BuildFrame implements _BuildFrame {
  _$_BuildFrame(
      {required this.number,
      required this.built,
      required this.buildScheduled});

  factory _$_BuildFrame.fromJson(Map<String, dynamic> json) =>
      _$_$_BuildFrameFromJson(json);

  @override
  final int number;
  @override
  final BuiltList<BuildEntry> built;
  @override
  final BuiltList<ScheduleBuildEntry> buildScheduled;

  @override
  String toString() {
    return 'BuildFrame(number: $number, built: $built, buildScheduled: $buildScheduled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BuildFrame &&
            (identical(other.number, number) ||
                const DeepCollectionEquality().equals(other.number, number)) &&
            (identical(other.built, built) ||
                const DeepCollectionEquality().equals(other.built, built)) &&
            (identical(other.buildScheduled, buildScheduled) ||
                const DeepCollectionEquality()
                    .equals(other.buildScheduled, buildScheduled)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(number) ^
      const DeepCollectionEquality().hash(built) ^
      const DeepCollectionEquality().hash(buildScheduled);

  @JsonKey(ignore: true)
  @override
  _$BuildFrameCopyWith<_BuildFrame> get copyWith =>
      __$BuildFrameCopyWithImpl<_BuildFrame>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BuildFrameToJson(this);
  }
}

abstract class _BuildFrame implements BuildFrame {
  factory _BuildFrame(
      {required int number,
      required BuiltList<BuildEntry> built,
      required BuiltList<ScheduleBuildEntry> buildScheduled}) = _$_BuildFrame;

  factory _BuildFrame.fromJson(Map<String, dynamic> json) =
      _$_BuildFrame.fromJson;

  @override
  int get number => throw _privateConstructorUsedError;
  @override
  BuiltList<BuildEntry> get built => throw _privateConstructorUsedError;
  @override
  BuiltList<ScheduleBuildEntry> get buildScheduled =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BuildFrameCopyWith<_BuildFrame> get copyWith =>
      throw _privateConstructorUsedError;
}
