// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dininghall_menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiningHallMenu _$DiningHallMenuFromJson(Map<String, dynamic> json) {
  return DiningHallMenu(
    json['type'] as int,
    json['date'] as String,
    json['soup'] as String,
    json['main_dinner'] as String,
    json['third_kind'] as String,
    json['fourth_kind'] as String,
    json['fifth_kind'] as String,
  );
}

Map<String, dynamic> _$DiningHallMenuToJson(DiningHallMenu instance) =>
    <String, dynamic>{
      'type': instance.type,
      'date': instance.date,
      'soup': instance.soup,
      'main_dinner': instance.main_dinner,
      'third_kind': instance.third_kind,
      'fourth_kind': instance.fourth_kind,
      'fifth_kind': instance.fifth_kind,
    };
