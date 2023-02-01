import 'package:move_ticketing/network/entity/movie_entity.dart';
import 'package:move_ticketing/utils/other/notifier_safety.dart';
import '../../domain/movie.dart';
import '../api_service.dart';
import 'package:dio/dio.dart' as dio;

// class MovieProvider extends ChangeNotifierSafety {
//   ApiService apiService = ApiService(dio.Dio());
//   List<MovieEntity> movies = [];
//
//   Future<void> getPopularMovies() async {
//     final data = await apiService.getPopuplarMovies();
//     movies = data.movies;
//     notifyListeners();
//   }
//
//   @override
//   void resetState() {
//     // TODO: implement resetState
//   }
// }