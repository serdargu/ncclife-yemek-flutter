// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Food _$FoodFromJson(Map<String, dynamic> json) {
  return Food(
    json['name'] as String,
    json['desc'] as String,
    json['price'] as String,
  );
}

Map<String, dynamic> _$FoodToJson(Food instance) => <String, dynamic>{
      'name': instance.name,
      'desc': instance.desc,
      'price': instance.price,
    };
