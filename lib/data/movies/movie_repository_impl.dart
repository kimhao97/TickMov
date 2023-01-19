import 'package:move_ticketing/data/movies/movie_repository.dart';
import 'package:move_ticketing/network/entity/movie_entity.dart';

import '../../network/api_service.dart';
import 'package:dio/dio.dart' as dio;

class MovieRepositoryImpl implements MovieRepository {
  final ApiService apiService = ApiService(dio.Dio());

  @override
  Future<List<MovieEntity>> getPopularMovies() async {
    final data = await apiService.getPopuplarMovies();
    return data.movies;
  }

}