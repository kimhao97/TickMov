import 'package:flutter/material.dart';
import 'package:move_ticketing/network/entity/movie_entity.dart';
import 'package:move_ticketing/pages/search/search_bloc.dart';
import '../../app_define/app_color.dart';
import '../../bloc/bloc_provider.dart';
import 'package:move_ticketing/pages/search/item/search_movie_item.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchTextController = TextEditingController();
  late SearchBloc _searchBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.arsenic,
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: TextField(
              controller: searchTextController,
              textInputAction: TextInputAction.search,
              // onSubmitted: (value) {
              //   _searchBloc.searchMovies(value);
              // },
              onChanged: (value) {
                _searchBloc.changeQuery(value);
              },
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _searchBloc.changeQuery('');
                      searchTextController.clear();
                    },
                  ),
                  hintText: 'Search...',
                  border: InputBorder.none),
            ),
          ),
      )),
      body: Container(
        color: AppColors.darkGunmetal,
        child: StreamBuilder(
          // initialData: _searchBloc.movieList,//searchBloc.movies.value,
          stream: _searchBloc.movieList, //_searchBloc.movies,
          builder: (context, AsyncSnapshot<List<MovieEntity>> snapshot) {
            if (snapshot.hasData) {
              final movies = snapshot.data!;
              if (movies.isEmpty) {
                return Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "Sorry! No results found.",
                      style: TextStyle(
                        color: AppColors.grey,
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                      ),
                    ));
              }
              return ListView.separated(
                padding: const EdgeInsets.all(8.0),
                itemCount: movies.length,//_searchBloc.movies.value.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 120,
                    color: AppColors.arsenic,
                    child: SearchMovieItem(movie: movies[index]),
                  );
                },
                separatorBuilder: (BuildContext context, int index) => const Divider(),
              );
            }
            return Container(
                alignment: Alignment.center,
                child: const Text(
                  "Type a words",
                  style: TextStyle(
                    color: AppColors.grey,
                    fontWeight: FontWeight.w300,
                    fontSize: 18,
                  ),
                ));
          },
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _searchBloc = CustomBlocProvider.of<SearchBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
    _searchBloc.dispose();
  }
}
