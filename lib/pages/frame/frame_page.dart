import 'package:flutter/material.dart';

class FramePage extends StatefulWidget {
  const FramePage({Key? key}) : super(key: key);

  @override
  State<FramePage> createState() => _FramePageState();
}

class _FramePageState extends State<FramePage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
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
    );
  }
}
