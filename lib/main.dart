import 'package:flutter/material.dart';
import 'package:move_ticketing/bloc/bloc_provider.dart';
import 'package:move_ticketing/pages/login/email_login_bloc.dart';
import 'package:move_ticketing/pages/login/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return Directionality(textDirection: TextDirection.ltr, child: child!);
      },
      title: 'GNav',
      theme: ThemeData(
        primaryColor: Colors.grey[800],
      ),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: CustomBlocProvider(
        blocSupplier: EmailLoginBloc(),
        child: LoginPage(),
      )));
}





