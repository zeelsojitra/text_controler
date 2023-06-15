import 'package:flutter/material.dart';
import 'package:text_controler/snackbar.dart';
import 'package:text_controler/text_controler.dart';
import 'package:text_controler/text_fromfiled_pre.dart';
import 'package:text_controler/textfromfiled.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: snackbar(),
      debugShowCheckedModeBanner: false,
    );
  }
}
