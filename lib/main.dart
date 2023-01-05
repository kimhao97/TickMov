import 'package:flutter/material.dart';
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
            // appBar: AppBar(
            //   elevation: 20,
            //   title: const Text(
            //       "Home",
            //   ),
            //   backgroundColor: AppColors.darkGunmetal,
            // ),
            bottomNavigationBar: Container(
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                  child: GNav(
                    gap: 8,
                    activeColor: AppColors.white,
                    color: AppColors.grey.withOpacity(0.5),
                    iconSize: 24.sp,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    tabBackgroundColor: AppColors.arsenic,
                    backgroundColor: AppColors.arsenic,
                    tabBorderRadius: 33,
                    tabs: [
                      GButton(
                        icon: Icons.home,
                        text: 'Home',
                      ),
                      GButton(
                        icon: Icons.filter_frames,
                        text: 'Likes',
                      ),
                      GButton(
                        icon: Icons.airplane_ticket,
                        text: 'Search',
                      )
                    ],
                    selectedIndex: _selectedIndex,
                    onTabChange: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                  ),
                ),
              ),
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


