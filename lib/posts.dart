import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class Posts extends StatefulWidget {
  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  var urlJson = "https://jsonplaceholder.typicode.com/posts";
  var data;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var res = await http.get(Uri.parse(urlJson));
    data = jsonDecode(res.body);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
        title: Text("Posts"),
      ),
      backgroundColor: Color.fromRGBO(104, 0, 219, 1),
      body: data != null
          ? ListView.builder(itemBuilder: (context, index) {
              return Card(
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        data[index]["title"],
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Divider(),
                      Text(
                        data[index]['body'],
                        textAlign: TextAlign.justify,
                      )
                    ],
                  ),
                ),
              );
            })
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
