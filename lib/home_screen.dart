import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '쿠니 수달 처음 만난날',
            style: TextStyle(
                color: Colors.white, fontFamily: 'gaegu', fontSize: 30),
          ),
          Text(
            '${myDate.selectedDate.year}.${myDate.selectedDate.month}.${myDate.selectedDate.day}',
            style: TextStyle(
                color: Colors.white, fontFamily: 'gaegu', fontSize: 20),
          ),
          IconButton(
            onPressed: () {
              showCustomDialog(context);
            },
            icon: Icon(
              Icons.favorite,
              color: Colors.redAccent,
            ),
            iconSize: 30,
          ),
          Text(
            'D+${myDate.dDay}',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'gaegu',
              fontSize: 50,
              fontWeight: FontWeight.w700,
            ),
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
