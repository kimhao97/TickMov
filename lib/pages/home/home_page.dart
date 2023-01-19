import 'package:flutter/material.dart';
import 'package:move_ticketing/bloc/bloc_provider.dart';
import 'package:move_ticketing/pages/home/home_bloc.dart';
import 'package:move_ticketing/pages/home/item/promo_item.dart';
import '../../network/entity/movie_entity.dart';
import 'home_state.dart';
import 'item/movie_item.dart';
import 'package:move_ticketing/app_define/app_style.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc _movieBloc;
  bool _isInit = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _movieBloc.popularMovies,
      builder: (BuildContext context, AsyncSnapshot<List<MovieEntity>> snapshot) {
          return ListView(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 33,
                      margin: const EdgeInsets.only(left: 16.0, top: 71.0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Playing",
                        style: mediumTextStyle(25, color: Colors.white, fontFamily: 'Niramit'),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 8.0, top: 71.0),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
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
              SizedBox(height: 8.0),
              Container(
                height: 261.0,
                child: _buildListView(_movieBloc),
              ),
              PromoItem(),
              SizedBox(height: 40.0),
            ],
          );
      });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if(_isInit == false) {
      _movieBloc = CustomBlocProvider.of<HomeBloc>(context);
      _isInit = true;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _buildListView(HomeBloc bloc) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: bloc.popularMovies.value.length,
        itemBuilder: (context, index) {
          final movie = bloc.popularMovies.value[index];
          return MovieItem(movie: movie);
        }
    );
  }
}