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
      appBar: AppBar(
        title: Center(child: Text('Insta')),
      ),
      backgroundColor: Colors.grey[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Image.asset("assets/crazybitch.png", height: 179, fit: BoxFit.contain,),
                  Text("Hello World"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      Row(
                        children: [
                          Icon(Icons.comment, color: Colors.blue),
                          Text("comments", style: TextStyle(color: Colors.blue),)
                        ],
                      ),
                      Icon(Icons.thumb_up, color: Colors.blue),
                    ],
                  )
                ],
              ),
            )
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Image.asset("assets/pic1.jpg", height: 179, fit: BoxFit.contain,),
                  Text("Hello World"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      Row(
                        children: [
                          Icon(Icons.comment, color: Colors.blue),
                          Text("comments", style: TextStyle(color: Colors.blue),)
                        ],
                      ),
                      Icon(Icons.thumb_up, color: Colors.blue),
                    ],
                  )
                ],
              ),
            )
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Image.asset("assets/pic2.png", height: 179, fit: BoxFit.contain,),
                  Text("Hello World"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      Row(
                        children: [
                          Icon(Icons.comment, color: Colors.blue),
                          Text("comments", style: TextStyle(color: Colors.blue),)
                        ],
                      ),
                      Icon(Icons.thumb_up, color: Colors.blue),
                    ],
                  )
                ],
              ),
            )
          ),
        ],
      )
    );
  }
}
