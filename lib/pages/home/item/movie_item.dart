import 'package:flutter/material.dart';
import 'package:move_ticketing/app_define/app_assets.dart';
import 'package:move_ticketing/app_define/app_color.dart';
import 'package:move_ticketing/pages/detail/movie_detail_page.dart';
import 'package:move_ticketing/utils/constants/api_constants.dart';
import '../../../network/entity/movie_entity.dart';
import 'package:move_ticketing/utils/other/navi.dart' as navi;

class MovieItem extends StatelessWidget {
  final MovieEntity movie;
  MovieItem({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 261.0,
      width: 180.0,
      margin: EdgeInsets.only(left: 8.0, right: 8.0),
      color: AppColors.arsenic,
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 170.0,
                width: double.infinity,
                color: Colors.white,
                child: Image.network(
                  "${APIConstants.IAMGE_URL}${movie.imageUrl}",
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 8.0, right: 16.0, bottom: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${movie.title}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                      ),
                      SizedBox(height: 4.0,),
                      Row(
                        children: [
                          Image.asset(AppAssets.origin().icStar),
                          SizedBox(width: 8.0),
                          Text(
                            '${movie.rating}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w300,
                            ),
                            maxLines: 1,
                          )
                        ],
                      ),
                      SizedBox(height: 4.0,),
                      Text(
                        '${movie.overview}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w300,
                        ),
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.transparent),
              ),
              child: Container(
                width: double.infinity,
                height: double.infinity,
              ),
              onPressed: (() => navi.newScreen(
                  newScreen: () => MovieDetailPage(),
                  context: context)
              ),
            ),
          )
          // Container(
          //   color: Colors.red,
          //   margin: EdgeInsets.symmetric(vertical: 0.0),
          //   // alignment: Alignment.topCenter,
          //   child: ElevatedButton(
          //     style: ButtonStyle(
          //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          //           RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(18.0),
          //             side: BorderSide(color: AppColors.darkGreen),
          //           )
          //       ),
          //       backgroundColor: MaterialStateProperty.all(AppColors.darkGreen),
          //     ),
          //     onPressed: () {},
          //     child: Text("XII"),
          //   ),
          // )
        ],
      ),
    );
  }
}
