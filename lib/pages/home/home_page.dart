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
        StreamBuilder(
          stream: bloc.popularMovies,
          builder: (context, snapshot) {
            return SizedBox(
              height: 261,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: bloc.popularMovies.value.length,
                  itemBuilder: (context, index) {
                    final movie = bloc.popularMovies.value[index];
                    return MovieItem(movie: movie);
                  }
              ),
            );
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
          builder: (context, snapshot) {
            return SizedBox(
              height: 261,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: bloc.nowPlayingMovies.value.length,
                  itemBuilder: (context, index) {
                    final movie = bloc.nowPlayingMovies.value[index];
                    return MovieItem(movie: movie);
                  }
              ),
            );
          },
        ),
      ],
    );
  }
}