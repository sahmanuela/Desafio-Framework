import 'package:flutter/material.dart';
import 'package:projeto_framework/albums.dart';
import 'package:projeto_framework/posts.dart';
import 'package:projeto_framework/todo.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(104, 0, 219, 1),
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
        title: Center(child: Text("Home")),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                width: 100,
                child: Image.asset(
                  'assets/frameworkLogo.png',
                ),
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Posts()));
                },
                child: Text("Posts",
                    style: TextStyle(color: Color.fromRGBO(104, 0, 219, 1)))),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Todo()));
                },
                child: Text("To do",
                    style: TextStyle(color: Color.fromRGBO(104, 0, 219, 1)))),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.white),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Albums()));
              },
              child: Text(
                "Albums",
                style: TextStyle(color: Color.fromRGBO(104, 0, 219, 1)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
