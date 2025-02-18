import 'package:first_start/screens/list_view_detail.dart';
import 'package:first_start/screens/list_view_screen.dart';
import 'package:first_start/screens/row_column.dart'; 
import 'package:flutter/material.dart';

class HelloWorld extends StatefulWidget {
  const HelloWorld({super.key});

  @override
  State<HelloWorld> createState() => _HelloWorldState();
}

class _HelloWorldState extends State<HelloWorld> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World',
      home: RowColumn(), 
    );
  }
}