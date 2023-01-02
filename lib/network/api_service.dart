import 'package:move_ticketing/network/entity/data_entity.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:move_ticketing/utils/constants/api_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: APIConstants.MOVIE_URL)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('/popular?api_key=${APIConstants.API_KEY}')
  Future<DataEntity> getPopuplarMovies();
}