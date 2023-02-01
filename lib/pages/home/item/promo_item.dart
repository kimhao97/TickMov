import 'package:flutter/material.dart';
import 'package:move_ticketing/app_define/app_assets.dart';
import 'package:move_ticketing/app_define/app_color.dart';

class PromoItem extends StatefulWidget {
  const PromoItem({Key? key}) : super(key: key);

  @override
  State<PromoItem> createState() => _PromoItemState();
}

class _PromoItemState extends State<PromoItem> {
  List<String> pageList = ['PageView1', 'PageView2', 'PageView3', 'PageView4', 'PageView5'];
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                height: 33,
                // width: double.infinity,
                margin: const EdgeInsets.only(left: 16.0, top: 42.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Promo",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          height: 161.0,
          width: double.infinity,
          margin: EdgeInsets.only(left: 16, right: 16, top: 16),
          color: Colors.red,
          child: Stack(
            children: [
              PageView.builder(
                onPageChanged: (int index) {
                  setState(() {
                    _currentPageIndex = index % (pageList.length);
                  });
                },
                itemCount: 10000,
                itemBuilder: (context, index) {
                    return _buildPageViewItem(pageList[index % (pageList.length)]);
                },
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(pageList.length, (i) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentPageIndex == i
                              ? AppColors.neonBlue
                              : Colors.white),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _buildPageViewItem(String txt) {
    return Container(
      child: FittedBox(
        child: Image.asset(
            AppAssets.origin().imgPromo,
        ),
        fit: BoxFit.fill,
      ),
    );
  }
}
