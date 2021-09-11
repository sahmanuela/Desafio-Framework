import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class Albums extends StatefulWidget {
  @override
  _AlbumsState createState() => _AlbumsState();
}

class _AlbumsState extends State<Albums> {
  var urlJson = "https://jsonplaceholder.typicode.com/albums";
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
        title: Text("Albums"),
      ),
      backgroundColor: Color.fromRGBO(104, 0, 219, 1),
      body: data != null
          ? ListView.builder(itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(data[index]['title']),
                  leading: Icon(Icons.photo_camera),
                ),
              );
            })
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
