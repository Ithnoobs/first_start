import 'package:first_start/screens/list_view_screen.dart';
import 'package:first_start/screens/row_column.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.brown,
              ),
              child: Text(
                'Navigation Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.view_column),
              title: Text('Insta'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RowColumn()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('List View'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListViewScreen()),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text('Hello My Friends', style: TextStyle(color: Colors.white),),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {},
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
          title: Text("Hello"),
          content: Text("This is a popup message."),
          actions: [
            TextButton(
              child: Text("Very nice!"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
              );
            },
          );
        },
        child: const Icon(Icons.star, color: Colors.yellow,),
      ),
      body: Container(
        child: Column(
          children: [
            Image.asset('assets/wallhaven_carlotta.png'),
            Text('Hello World', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
            Text('Welcome to a simple app!', style: TextStyle(fontSize: 18),),
          ]
        ),
      )
    );
  }
}