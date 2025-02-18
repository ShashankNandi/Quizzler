import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final String question = 'I m groot';
  List<Icon> scoreKeeper = [];
  @override
  Widget build(BuildContext context) {
    ButtonStyle getStyle(Color color) {
      return TextButton.styleFrom(
          fixedSize: Size(225, 75),
          backgroundColor: color,
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero));
    }

    final ButtonStyle styleYes = getStyle(Colors.green);

    final ButtonStyle styleNo = getStyle(Colors.red);

    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(this.question,
                      style: TextStyle(color: Colors.white, fontSize: 25)),
                ),
                SizedBox(height: 400),
                TextButton(
                  style: styleYes,
                  onPressed: () {},
                  child: Text('Yes'),
                ),
                SizedBox(height: 30),
                TextButton(
                  style: styleNo,
                  onPressed: () {},
                  child: Text('No'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
