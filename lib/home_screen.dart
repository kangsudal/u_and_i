import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:u_and_i/date_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              _TopPart(),
              _BottomPart(),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomPart extends StatelessWidget {
  const _BottomPart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Image.asset(
        'asset/img/kunisudal.jpg',
        fit: BoxFit.cover, //cover는 contain보단 좀 짤리지만 가로 너비를 꽉 채우기위해서
      ),
    );
  }
}

class _TopPart extends StatelessWidget {
  const _TopPart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myDate = context.watch<MyDate>();
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '쿠니 수달 처음 만난날',
            style: textTheme.headline2,
          ),
          Text(
            '${myDate.selectedDate.year}.${myDate.selectedDate.month}.${myDate.selectedDate.day}',
            style: textTheme.headline3,
          ),
          IconButton(
            onPressed: () {
              showCustomDialog(context).then((value) async {
                int timestamp = myDate.selectedDate.millisecondsSinceEpoch;
                print(myDate.selectedDate);
                print(timestamp);
                final prefs = await SharedPreferences.getInstance();
                prefs.setInt('myTimestampKey', timestamp);
              });
            },
            icon: Icon(
              Icons.favorite,
              color: Colors.redAccent,
            ),
            iconSize: 30,
          ),
          Text(
            'D+${myDate.dDay}',
            style: textTheme.headline1,
          ),
        ],
      ),
    );
  }

  Future showCustomDialog(BuildContext context) {
    return showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 300,
            color: Colors.white,
            child: CupertinoDatePicker(
              initialDateTime: context.watch<MyDate>().selectedDate,
              maximumDate: DateTime(
                DateTime.now().year,
                DateTime.now().month,
                DateTime.now().day,
              ),
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (DateTime value) {
                // print(value);
                context.read<MyDate>().setSelectedDate(value);
              },
            ),
          ),
        );
      },
    );
  }
}
