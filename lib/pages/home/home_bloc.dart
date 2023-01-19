import 'dart:async';
import 'package:move_ticketing/data/movies/movie_repository.dart';
import 'package:move_ticketing/data/movies/movie_repository_impl.dart';
import 'package:move_ticketing/network/entity/movie_entity.dart';
import 'package:move_ticketing/pages/home/home_state.dart';
import 'package:rxdart/rxdart.dart';
import '../../bloc/bloc_provider.dart';

class HomeBloc implements BaseBloc {
    // final _state = BehaviorSubject<HomeState>.seeded(HomeState(movies: []));
    final popularMovies = BehaviorSubject<List<MovieEntity>>.seeded([]);
    // Stream<bool> get isLoaded => false;

    final _movieRepository = MovieRepositoryImpl();

    HomeBloc() {
        getPopularMovies();
    }

    void dispose() {
        // _actions.close();
        // _state.close();
    }

    void getPopularMovies() async {
        final movies = await _movieRepository.getPopularMovies();
        popularMovies.add(movies);
    }
}