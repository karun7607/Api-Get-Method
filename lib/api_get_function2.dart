import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'api_datas/api_datas2.dart';

class ApiGetPage2 extends StatefulWidget {
  const ApiGetPage2({Key? key}) : super(key: key);

  @override
  State<ApiGetPage2> createState() => _ApiGetPage2State();
}

class _ApiGetPage2State extends State<ApiGetPage2> {
  List<ApiDatasNew> userData = [];
  Future<void> getuserdata() async {
    // final responseone =
    //     await http.get(Uri.https('jsonplaceholder.typicode.com', 'posts'));
    final response = await http
        .get(Uri.parse("https://api.androidhive.info/json/movies.json"));
    print(response.statusCode);
    if (response.statusCode == 200) {
      List<dynamic> getDataFromApi = jsonDecode(response.body);
      setState(() {
        userData =
            getDataFromApi.map((index) => ApiDatasNew.fromJson(index)).toList();
        print(userData.length);
      });
    } else {
      print("Error");
    }
  }

  @override
  void initState() {
    getuserdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Datas"),
        ),
        body: ListView.builder(
            itemCount: userData.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(userData[index].title.toString()),
                subtitle: Text(userData[index].releaseYear.toString()),
              );
            }));
  }
}
