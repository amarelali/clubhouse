import 'package:clubhouse_ui/Constance.dart';
import 'package:clubhouse_ui/screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clubhouse UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: kBackgroudColor,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        scaffoldBackgroundColor: kBackgroudColor,
        primaryColor: Colors.white,
          colorScheme:  Theme.of(context).colorScheme.copyWith(secondary: kAccentColorGreen),
        iconTheme: IconThemeData(color: Colors.black),
        fontFamily: GoogleFonts.montserrat().fontFamily,
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      home: HomeSreen(),
    );
  }
}
