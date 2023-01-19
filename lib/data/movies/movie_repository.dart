import 'package:move_ticketing/network/entity/movie_entity.dart';

abstract class MovieRepository {
  Future<List<MovieEntity>> getPopularMovies();
}