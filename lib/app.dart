import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_ticketing/app_define/app_assets.dart';
import 'package:move_ticketing/app_define/app_color.dart';
import 'package:move_ticketing/bloc/bloc_provider.dart';
import 'package:move_ticketing/data/movies/movie_repository_impl.dart';
import 'package:move_ticketing/dependency_injection.dart';
import 'package:move_ticketing/pages/frame/frame_page.dart';
import 'package:move_ticketing/pages/home/home_bloc.dart';
import 'package:move_ticketing/pages/home/home_page.dart';
import 'package:move_ticketing/pages/login/login_page.dart';
import 'package:move_ticketing/pages/search/search_bloc.dart';
import 'package:move_ticketing/pages/sideMenu/side_menu_page.dart';
import 'package:move_ticketing/pages/ticket/TicketPage.dart';
import 'package:move_ticketing/bloc/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Widget> _widgetOptions = <Widget>[
    CustomBlocProvider<HomeBloc>(
      blocSupplier: HomeBloc(),
      child: HomePage(),
    ),
    FramePage(),
    TicketPage(),
  ];

  final movieRepository = MovieRepositoryImpl();

  //change debug/release mode
  final debug = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BottomNavigationBloc>(
        create: (context) => BottomNavigationBloc()..add(AppStarted()),
        child: Injector(
            movieRepository: movieRepository,
            debug: debug,
            child: Sizer(
              builder: (context, orientation, deviceType) {
                return Scaffold(
                  drawer: SideMenuPage(),
                  backgroundColor: AppColors.darkGunmetal,
                  body: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
                    builder: (BuildContext context, BottomNavigationState state) {
                      if (state is PageLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if(state is LoginPageLoaded) {
                        return const LoginPage();
                      }

                      if (state is HomePageLoaded) {
                        return _widgetOptions.elementAt(0);
                      }
                      if (state is FramePageLoaded) {
                        return _widgetOptions.elementAt(1);
                      }
                      if(state is TicketPageLoaded) {
                        return _widgetOptions.elementAt(2);
                      }
                      return Container();
                    },
                  ),
                  bottomNavigationBar:
                  BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
                      builder: (BuildContext context, BottomNavigationState state) {
                        return BottomNavigationBar(
                          currentIndex:
                          context.select((BottomNavigationBloc bloc) => bloc.currentIndex),
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
                          type: BottomNavigationBarType.fixed,
                          selectedItemColor: AppColors.white,
                          unselectedItemColor: AppColors.grey,
                          showUnselectedLabels: false,
                          backgroundColor: AppColors.arsenic,
                          onTap: (index) => context
                              .read<BottomNavigationBloc>()
                              .add(PageTapped(index: index)),
                        );
                      }),
                );
              },
            )
        )
    );
  }
}