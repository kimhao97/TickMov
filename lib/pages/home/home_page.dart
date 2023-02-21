import 'package:flutter/material.dart';
import 'package:move_ticketing/app_define/app_color.dart';
import 'package:move_ticketing/bloc/bloc_provider.dart';
import 'package:move_ticketing/pages/home/home_bloc.dart';
import 'package:move_ticketing/pages/home/item/promo_item.dart';
import '../../network/entity/movie_entity.dart';
import 'item/movie_item.dart';
import 'package:move_ticketing/app_define/app_style.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc _bloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkGunmetal,
      appBar: AppBar(
        leading: ElevatedButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                return AppColors.darkGunmetal;
              },
            ),
          ),
          child: const Icon(
              Icons.menu,
            color: AppColors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.darkGunmetal,
        title: const Text('Discover'),
      ),
      body: ListView(
        children: [
          _buildPopularMovies(_bloc),
          _buildNowPlayingMovies(_bloc),
          PromoItem(),
          SizedBox(height: 40.0),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _bloc = CustomBlocProvider.of<HomeBloc>(context);
    _bloc.getPopularMovies();
    _bloc.getNowPlayingMovies();
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }

  Widget _buildPopularMovies(HomeBloc bloc) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: 33,
                margin: const EdgeInsets.only(left: 16.0, top: 8.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Popular",
                  style: mediumTextStyle(25, color: Colors.white, fontFamily: 'Niramit'),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 8.0, top: 8.0),
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "See All >",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        StreamBuilder<List<MovieEntity>>(
          stream: bloc.popularMovies,
          builder: (context, AsyncSnapshot<List<MovieEntity>> snapshot) {
            if (snapshot.hasData) {
              final movies = snapshot.data!;
              return SizedBox(
                height: 261,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      final movie = movies[index];
                      return MovieItem(movie: movie);
                    }
                ),
              );
            }
            return Container();
          },
        ),
      ],
    );
  }

  Widget _buildNowPlayingMovies(HomeBloc bloc) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: 33,
                margin: const EdgeInsets.only(left: 16.0, top: 8.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Now playing",
                  style: mediumTextStyle(25, color: Colors.white, fontFamily: 'Niramit'),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 8.0, top: 8.0),
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "See All >",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        StreamBuilder(
          stream: bloc.nowPlayingMovies,
          builder: (context, AsyncSnapshot<List<MovieEntity>> snapshot) {
            if (snapshot.hasData) {
              final movies = snapshot.data!;
              return SizedBox(
                height: 261,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      final movie = movies[index];
                      return MovieItem(movie: movie);
                    }
                ),
              );
            }
            return Container();
          },
        ),
      ],
    );
  }
}