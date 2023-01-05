import 'package:flutter/material.dart';
import 'package:move_ticketing/app_define/app_assets.dart';
import 'package:move_ticketing/app_define/app_color.dart';
import 'package:move_ticketing/network/providers/movie_provider.dart';
import 'package:move_ticketing/pages/frame/frame_page.dart';
import 'package:move_ticketing/pages/home/home_page.dart';
import 'package:move_ticketing/pages/ticket/TicketPage.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() => runApp(MaterialApp(
    builder: (context, child) {
      return Directionality(textDirection: TextDirection.ltr, child: child!);
    },
    title: 'GNav',
    theme: ThemeData(
      primaryColor: Colors.grey[800],
    ),
    home: MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    FramePage(),
    TicketPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> MovieProvider()),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return Scaffold(
            backgroundColor: AppColors.darkGunmetal,
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                    icon: Image.asset(AppAssets.origin().icJamHome),
                    label: "Home",
                    backgroundColor: AppColors.arsenic
                ),
                BottomNavigationBarItem(
                    icon: Image.asset(AppAssets.origin().icFrame),
                    label: "Likes",
                    backgroundColor: AppColors.arsenic
                ),
                BottomNavigationBarItem(
                    icon: Image.asset(AppAssets.origin().icTicket),
                    label: "Search",
                    backgroundColor: AppColors.arsenic
                ),
              ],
              type: BottomNavigationBarType.shifting,
              currentIndex: _selectedIndex,
              selectedItemColor: AppColors.white,
              backgroundColor: AppColors.arsenic,
              onTap: _onItemTapped,
            ),
            body: Container(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
          );
        },
      ),
    );
  }
}


