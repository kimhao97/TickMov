import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:move_ticketing/network/api_service.dart';
import 'package:dio/dio.dart' as dio;

class FramePage extends StatefulWidget {
  const FramePage({Key? key}) : super(key: key);

  @override
  State<FramePage> createState() => _FramePageState();
}

class _FramePageState extends State<FramePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
          "Frame page",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
