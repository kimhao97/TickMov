import 'package:flutter/material.dart';

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
          return Container(
            alignment: Alignment.center,
            child: Text(
              "Ticket page",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          );
        }
    );
  }
}
