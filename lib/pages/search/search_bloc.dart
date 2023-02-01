import 'package:move_ticketing/data/movies/movie_repository_impl.dart';
import 'package:move_ticketing/network/entity/movie_entity.dart';
import 'package:rxdart/rxdart.dart';
import '../../bloc/bloc_provider.dart';
import 'dart:async';
import '../../data/movies/state.dart';

class SearchBloc implements BaseBloc {
  static final _movieRepository = MovieRepositoryImpl();

  final movies = BehaviorSubject<List<MovieEntity>>.seeded([]);
  final _query = PublishSubject<String>();

  Stream<List<MovieEntity>> get movieList => _query.stream
      .debounceTime(const Duration(milliseconds: 300))
      .where((String value) => value.isNotEmpty)
      .distinct()
      .transform(streamTransformer);

  final streamTransformer = StreamTransformer<String, List<MovieEntity>>.fromHandlers(
    handleData: (query, sink) async {
      State state = await _movieRepository.getMoviesByName(query);
      if (state is SuccessState) {
        sink.add(state.value);
      } else {
        sink.addError((state as ErrorState).msg);
      }
    });

  Function(String) get changeQuery => _query.sink.add;

  SearchBloc() {
    _query.stream
        .listen((value) {
          if (value.isEmpty) {

          }
    });
  }

  @override
  void dispose() {
    movies.close();
    _query.close();
  }
}