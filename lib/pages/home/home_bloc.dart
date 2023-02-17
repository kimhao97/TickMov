import 'package:move_ticketing/data/movies/movie_repository_impl.dart';
import 'package:move_ticketing/data/movies/state.dart';
import 'package:move_ticketing/network/entity/movie_entity.dart';
import 'package:move_ticketing/pages/home/home_state.dart';
import 'package:rxdart/rxdart.dart';
import '../../bloc/bloc_provider.dart';

class HomeBloc implements BaseBloc {
    final _movieRepository = MovieRepositoryImpl();
    final popularMovies = BehaviorSubject<List<MovieEntity>>.seeded([]);
    final nowPlayingMovies = BehaviorSubject<List<MovieEntity>>.seeded([]);

    // final ValueStream<HomeState> _state;
    //
    // HomeBloc({required this._state});
    // factory HomeBloc() {
    //     final getMovies = PublishSubject<List<MovieEntity>>();
    //     // final popularMovies = await _movieRepository.getPopularMovies();
    //
    //     return HomeBloc._(_state: );
    // }

    @override
    void dispose() {
        popularMovies.close();
    }

    void getPopularMovies() async {
        final state = await _movieRepository.getPopularMovies();
        if (state is SuccessState) {
            popularMovies.sink.add(state.value);
        }
        // _state.value.movies.addAll(movies);
    }

    void getNowPlayingMovies() async {
        final state = await _movieRepository.getNowPlayingMovies();
        if (state is SuccessState) {
            nowPlayingMovies.sink.add(state.value);
        }
    }
}