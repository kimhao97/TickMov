import 'package:flutter/material.dart';
import 'package:move_ticketing/app_define/app_color.dart';
import 'package:move_ticketing/pages/login/login_page.dart';
import 'package:move_ticketing/utils/other/navi.dart' as navi;

import '../../bloc/bloc_provider.dart';
import '../login/email_login_bloc.dart';

class SideMenuPage extends StatefulWidget {
  const SideMenuPage({Key? key}) : super(key: key);

  @override
  State<SideMenuPage> createState() => _SideMenuPageState();
}

class _SideMenuPageState extends State<SideMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.darkGunmetal,
      child: Column(
      children: [
        const UserAccountsDrawerHeader(
            accountName: Text("Mercy"),
            accountEmail: Text("mercy@gmail.com"),
          currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Icon(
                  Icons.person,
                  size: 60.0,
                ),
              ),
          ),
          decoration: BoxDecoration(
            color: Colors.blue,
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage('https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.favorite,
            color: AppColors.white,
          ),
          title: Text(
              'Favorites',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: AppColors.white
            ),
          ),
          onTap: () => null,
        ),
        ListTile(
          leading: Icon(
            Icons.person,
            color: AppColors.white,
          ),
          title: Text(
            'Persion',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: AppColors.white
            ),
          ),
          onTap: () => null,
        ),
        ListTile(
          leading: Icon(
            Icons.share,
            color: AppColors.white,
          ),
          title: Text(
            'Share',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: AppColors.white
            ),
          ),
          onTap: () => null,
        ),
        ListTile(
          leading: Icon(
            Icons.notifications,
            color: AppColors.white,
          ),
          title: Text(
            'Request',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: AppColors.white
            ),
          ),
          onTap: () => null,
        ),
        Divider(),
        ListTile(
          leading: Icon(
            Icons.settings,
            color: AppColors.white,
          ),
          title: Text(
            'Settings',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: AppColors.white
            ),
          ),
          onTap: () => null,
        ),
        ListTile(
          leading: Icon(
            Icons.description,
            color: AppColors.white,
          ),
          title: Text(
            'Policies',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: AppColors.white
            ),
          ),
          onTap: () => null,
        ),
        Divider(),
        ListTile(
          leading: Icon(
            Icons.logout,
            color: AppColors.white,
          ),
          title: Text(
            'Logout',
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: AppColors.white
            ),
          ),
          onTap: () => navi.newScreen(
              newScreen: () => CustomBlocProvider<EmailLoginBloc>(blocSupplier: EmailLoginBloc(), child: LoginPage()),
             context: context)
        ),
      ],
    ));
  }
}
