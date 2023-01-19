library home_state;

import 'package:move_ticketing/network/entity/movie_entity.dart';
import 'package:built_value/built_value.dart';

part 'home_state.g.dart';

abstract class HomeState implements Built<HomeState, HomeStateBuilder> {
  List<MovieEntity>? get movies;

  HomeState._();
  factory HomeState({
    required List<MovieEntity> movies,
  }) =>
      _$HomeState._(
        movies: movies
      );
}
