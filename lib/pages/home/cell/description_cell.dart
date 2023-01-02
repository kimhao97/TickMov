import 'package:flutter/material.dart';
import 'package:move_ticketing/app_define/app_color.dart';

class DescriptionCell extends StatelessWidget {
  const DescriptionCell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 21),
      child: Column(
        children: [
          ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: AppColors.darkGreen),
                  )
              ),
              backgroundColor: MaterialStateProperty.all(AppColors.darkGreen),
            ),
            onPressed: () {},
            child: Text("XII"),
          ),
          Text(
            "RATU ILMU HITAM",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.0),
            child: Row(

              children: [
                Expanded(child: SizedBox()),
                Image.asset("assets/icons/star.png"),
                Text(
                    "8,9",
                  style: TextStyle(
                    color: Color(0xFF777777),
                  ),
                ),
                Expanded(child: SizedBox()),
                Text(
                    "Horror, Drama",
                  style: TextStyle(
                    color: Color(0xFF777777),
                  ),
                ),
                Expanded(child: SizedBox()),
              ],
            ),
          )
        ],
      ),
    );
  }
}
