import 'package:flutter/material.dart';

class RowColumn extends StatefulWidget {
  const RowColumn({super.key});

  @override
  State<RowColumn> createState() => _RowColumnState();
}

class _RowColumnState extends State<RowColumn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(child: Image.asset("assets/crazybitch.png")),
          Expanded(child: Image.asset("assets/pic1.jpg")),
          Expanded(child: Image.asset("assets/pic2.png")),
        ],
      )
    );
  }
}