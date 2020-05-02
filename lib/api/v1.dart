import '../models/restaurant_response.dart';
import '../models/dininghall_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

part 'v1.g.dart';

@RestApi(baseUrl: "https://ncclife.net/api/v1")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  static RestClient create() {
    final dio = Dio();
    //dio.interceptors.add(PrettyDioLogger());
    return RestClient(dio);
  }

  @GET("/restaurants.json")
  Future<RestaurantResponse> getRestaurantResponse();

  @GET("/dininghall.json")
  Future<DiningHallResponse> getDiningHallResponse();
}
