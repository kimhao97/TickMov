import 'package:flutter/material.dart';
import 'package:move_ticketing/app_define/app_color.dart';
import 'package:move_ticketing/bloc/bloc_provider.dart';
import 'package:move_ticketing/pages/search/search_bloc.dart';
import 'package:move_ticketing/pages/search/search_page.dart';
import 'package:move_ticketing/utils/other/navi.dart' as navi;

class TicketPage extends StatefulWidget {
  const TicketPage({Key? key}) : super(key: key);

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Search'),
              backgroundColor: AppColors.arsenic,
              actions: [
                IconButton(
                    onPressed: (() => navi.newScreen(
                        newScreen: () => CustomBlocProvider<SearchBloc>(blocSupplier: SearchBloc(), child: SearchPage()),
                        context: context)
                    ),
                    icon: const Icon(Icons.search))
              ],
            ),
            body: Container(
              color: AppColors.darkGunmetal,
            ),
          );
        }
    );
  }
}
