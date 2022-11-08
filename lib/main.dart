import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:u_and_i/date_provider.dart';

import 'home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => MyDate(),
      child: MaterialApp(
        home: HomeScreen(),
      ),
    ),
  );
}
