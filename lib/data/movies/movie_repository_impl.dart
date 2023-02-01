import 'package:move_ticketing/data/movies/movie_repository.dart';
import 'package:move_ticketing/data/movies/state.dart';
import 'package:move_ticketing/network/entity/movie_entity.dart';

import '../../network/api_service.dart';
import 'package:dio/dio.dart' as dio;

class MovieRepositoryImpl implements MovieRepository {
  final ApiService apiService = ApiService(dio.Dio());

  @override
  Future<State> getPopularMovies() async {
    final httpResponse = await apiService.getPopuplarMovies();
    if (httpResponse.response.statusCode == 200) {
      return State<List<MovieEntity>>.success(httpResponse.data.movies);
    }
    else {
      return State<String>.error(httpResponse.response.statusCode.toString());
    }
  }

  @override
  Future<State> getMoviesByName(String queries) async {
    final httpResponse = await apiService.searchMovies(queries);
    if (httpResponse.response.statusCode == 200) {
      return State<List<MovieEntity>>.success(httpResponse.data.movies);
    }
    else {
      return State<String>.error(httpResponse.response.statusCode.toString());
    }
  }
}