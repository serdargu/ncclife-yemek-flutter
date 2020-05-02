import 'package:ncclifeyemek/models/dininghall_menu.dart';

import 'restaurant.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

part 'dininghall_response.g.dart';

@JsonSerializable()
class DiningHallResponse {
  final String cacheVersion;

  @JsonKey(name: 'dininghallMenus')
  final List<DiningHallMenu> dininghallMenus;

  DiningHallResponse(this.cacheVersion, this.dininghallMenus);

  String getCacheVersion() {
    return this.cacheVersion;
  }

  List<DiningHallMenu> getMenus() {
    return this.dininghallMenus;
  }

  factory DiningHallResponse.fromJson(Map<String, dynamic> json) =>
      _$DiningHallResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DiningHallResponseToJson(this);
}
