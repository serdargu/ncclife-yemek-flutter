// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dininghall_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiningHallResponse _$DiningHallResponseFromJson(Map<String, dynamic> json) {
  return DiningHallResponse(
    json['cacheVersion'] as String,
    (json['dininghallMenus'] as List)
        ?.map((e) => e == null
            ? null
            : DiningHallMenu.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DiningHallResponseToJson(DiningHallResponse instance) =>
    <String, dynamic>{
      'cacheVersion': instance.cacheVersion,
      'dininghallMenus': instance.dininghallMenus,
    };
