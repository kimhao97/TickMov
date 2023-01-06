import 'package:flutter/material.dart';
import 'package:move_ticketing/app_define/app_assets.dart';
import 'package:move_ticketing/app_define/app_color.dart';

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({Key? key}) : super(key: key);

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
        bottom: null,
      ),
      body: Container(
        color: AppColors.darkGunmetal,
        alignment: Alignment.center,
        child: Text(
          'Movie Detail',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
