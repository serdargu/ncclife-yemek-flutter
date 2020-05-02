// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantResponse _$RestaurantResponseFromJson(Map<String, dynamic> json) {
  return RestaurantResponse(
    json['cacheVersion'] as String,
    (json['restaurants'] as List)
        ?.map((e) =>
            e == null ? null : Restaurant.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RestaurantResponseToJson(RestaurantResponse instance) =>
    <String, dynamic>{
      'cacheVersion': instance.cacheVersion,
      'restaurants': instance.restaurants,
    };
