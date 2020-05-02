// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) {
  return Restaurant(
    json['id'] as int,
    json['name'] as String,
    json['desc'] as String,
    (json['phones'] as List)?.map((e) => e as String)?.toList(),
    (json['menus'] as List)
        ?.map(
            (e) => e == null ? null : Menu.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RestaurantToJson(Restaurant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'desc': instance.desc,
      'phones': instance.phones,
      'menus': instance.menus,
    };
