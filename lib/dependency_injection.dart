import 'package:flutter/cupertino.dart';
import 'package:move_ticketing/data/movies/movie_repository.dart';
import 'package:flutter/widgets.dart';

class Injector extends InheritedWidget {
  final MovieRepository movieRepository;
  final bool debug;

  const Injector({
    super.key,
    required this.movieRepository,
    required this.debug,
    required super.child,
  });

  static Injector? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Injector>();
  }

  static Injector of(BuildContext context) {
    final Injector? result = maybeOf(context);
    assert(result != null, 'No FrogColor found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(Injector oldWidget) => this != oldWidget;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Injector &&
              runtimeType == other.runtimeType &&
              movieRepository == other.movieRepository &&
              debug == other.debug;

  @override
  int get hashCode =>
      movieRepository.hashCode ^
      debug.hashCode ;
}