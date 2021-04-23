// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'build_tracker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BuildEntry _$_$_BuildEntryFromJson(Map json) {
  return _$_BuildEntry(
    timestamp: json['timestamp'] as int,
    widget: json['widget'] as String,
  );
}

Map<String, dynamic> _$_$_BuildEntryToJson(_$_BuildEntry instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'widget': instance.widget,
    };

_$_ScheduleBuildEntry _$_$_ScheduleBuildEntryFromJson(Map json) {
  return _$_ScheduleBuildEntry(
    timestamp: json['timestamp'] as int,
    widget: json['widget'] as String,
    stack: ((json['stack'] as List).map((e) => e as String)).toBuiltList(),
  );
}

Map<String, dynamic> _$_$_ScheduleBuildEntryToJson(
        _$_ScheduleBuildEntry instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'widget': instance.widget,
      'stack': instance.stack.toList(),
    };

_$_BuildFrame _$_$_BuildFrameFromJson(Map json) {
  return _$_BuildFrame(
    number: json['number'] as int,
    built: ((json['built'] as List).map(
            (e) => BuildEntry.fromJson(Map<String, dynamic>.from(e as Map))))
        .toBuiltList(),
    buildScheduled: ((json['buildScheduled'] as List).map((e) =>
            ScheduleBuildEntry.fromJson(Map<String, dynamic>.from(e as Map))))
        .toBuiltList(),
  );
}

Map<String, dynamic> _$_$_BuildFrameToJson(_$_BuildFrame instance) =>
    <String, dynamic>{
      'number': instance.number,
      'built': instance.built.map((e) => e.toJson()).toList(),
      'buildScheduled': instance.buildScheduled.map((e) => e.toJson()).toList(),
    };
