import 'package:flutter/material.dart';

import 'input_screen.dart';

void main() {
  runApp(CRUDApp());
}

class CRUDApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'C.R.U.D.',
      home: HomeScreen(),
    );
  }
}