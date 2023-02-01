import 'package:move_ticketing/data/movies/state.dart';
import 'package:move_ticketing/network/entity/movie_entity.dart';

abstract class MovieRepository {
  Future<State> getPopularMovies();
  Future<State> getMoviesByName(String queries);
}