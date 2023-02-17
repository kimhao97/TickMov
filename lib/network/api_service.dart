import 'package:move_ticketing/network/entity/data_entity.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:move_ticketing/utils/constants/api_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: APIConstants.BASE_URL)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('${APIConstants.POPULAR_URL}?api_key=${APIConstants.API_KEY}')
  Future<HttpResponse<DataEntity>> getPopuplarMovies();

  @GET('${APIConstants.NOW_PLAYING_URL}?api_key=${APIConstants.API_KEY}')
  Future<HttpResponse<DataEntity>> getNowPlayingMovies();

  @GET('/${APIConstants.SEARCH_URL}?api_key=${APIConstants.API_KEY}&query={queries}&page=1')
  Future<HttpResponse<DataEntity>> searchMovies(@Path("queries") String queries);
}