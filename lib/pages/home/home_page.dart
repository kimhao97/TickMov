import 'package:flutter/material.dart';
import 'package:move_ticketing/network/providers/movie_provider.dart';
import 'package:move_ticketing/pages/home/cell/promo_cell.dart';
import 'cell/movie_cell.dart';
import 'package:provider/provider.dart';
import 'package:move_ticketing/app_define/app_style.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late MovieProvider movieProvider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      movieProvider = Provider.of<MovieProvider>(context, listen: false);
      await movieProvider.getPopularMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieProvider>(
      builder: (BuildContext context, MovieProvider provider, _) {
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
            Container(
              height: 261.0,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movieProvider.movies.length,
                  itemBuilder: (context, index) {
                    final movie = movieProvider.movies[index];
                    return MovieCell(index, movie);
                  }),
            ),
            // DescriptionCell(),
            PromoCell(),
            SizedBox(height: 40.0),
          ],
        );
      },
    );
  }
}