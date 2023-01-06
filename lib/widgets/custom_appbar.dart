import 'package:flutter/material.dart';
import 'package:move_ticketing/app_define/app_assets.dart';
import 'package:move_ticketing/app_define/app_route.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListTile(
          leading: IconButton(
            icon: Image.asset(AppAssets.origin().icBack),
            onPressed: ( () =>
                Navigator.pop(context)
            ),
          ),
        ),
    );
  }
}
