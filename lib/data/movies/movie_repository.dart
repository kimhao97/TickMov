import 'package:move_ticketing/data/movies/state.dart';

abstract class MovieRepository {
  Future<State> getPopularMovies();
  Future<State> getNowPlayingMovies();
  Future<State> getMoviesByName(String queries);
}