import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:u_and_i/date_provider.dart';

import 'home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => MyDate(),
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'gaegu',
          textTheme: TextTheme(
            headline1: TextStyle(
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.w700,
            ), //D+46
            headline2: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ), //우리처음 만난날
            headline3: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ), //2022.11.8
          ),
        ),
        home: HomeScreen(),
      ),
    ),
  );
}
