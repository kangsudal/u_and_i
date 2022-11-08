import 'package:flutter/material.dart';

class MyDate extends ChangeNotifier {
  DateTime selectedDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  int get dDay =>
      DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
      ).difference(selectedDate).inDays +
      1; //현재날짜-기념일+1일

  void setSelectedDate(DateTime selectedDate) {
    this.selectedDate = selectedDate;
    notifyListeners();
  }
}
