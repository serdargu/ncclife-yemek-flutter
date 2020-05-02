import 'restaurant.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

part 'restaurant_response.g.dart';

@JsonSerializable()
class RestaurantResponse {
  final String cacheVersion;
  final List<Restaurant> restaurants;
  RestaurantResponse(this.cacheVersion, this.restaurants);

  String getCacheVersion() {
    return this.cacheVersion;
  }

  List<Restaurant> getRestaurants() {
    return this.restaurants;
  }

  factory RestaurantResponse.fromJson(Map<String, dynamic> json) =>
      _$RestaurantResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RestaurantResponseToJson(this);
}
