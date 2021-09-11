import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  var urlJson = "https://jsonplaceholder.typicode.com/todos";
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
        title: Text("To do List"),
      ),
      backgroundColor: Color.fromRGBO(104, 0, 219, 1),
      body: data != null
          ? ListView.builder(itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                    title: Text(data[index]['title']),
                    trailing: Icon(data[index]['completed']
                        ? Icons.check_box_outlined
                        : Icons.check_box_outline_blank)),
              );
            })
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
