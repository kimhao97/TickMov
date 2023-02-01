import 'package:flutter/material.dart';
import 'package:move_ticketing/network/entity/movie_entity.dart';
import '../../../app_define/app_assets.dart';
import '../../../utils/constants/api_constants.dart';

class SearchMovieItem extends StatelessWidget {
  final MovieEntity movie;

  SearchMovieItem({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Container(
            height: double.infinity,
            width: 120,
            color: Colors.white,
            child: Image.network(
              "${APIConstants.IAMGE_URL}${movie.imageUrl}",
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0, bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${movie.title}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 1,
                  ),
                  const SizedBox(height: 8.0,),
                  Row(
                    children: [
                      Image.asset(AppAssets.origin().icStar),
                      const SizedBox(width: 8.0),
                      Text(
                        '${movie.rating}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 1,
                      )
                    ],
                  ),
                  const SizedBox(height: 8.0,),
                  Text(
                    '${movie.overview}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 3,
                  ),
                ],
              ),
            ),
          ),
        ]
    );
  }
}
