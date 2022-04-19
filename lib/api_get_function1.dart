import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'api_datas/api_datas1.dart';

class ApiGetPage1 extends StatefulWidget {
  const ApiGetPage1({Key? key}) : super(key: key);

  @override
  State<ApiGetPage1> createState() => ApiGetPage1State();
}

class ApiGetPage1State extends State<ApiGetPage1> {
  List<ApiDatas> userList = [];
  Future<List<ApiDatas>> getUserApi() async {
    final response = await http.get(Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));

    print(response.statusCode);
    final datas = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in datas) {
        print(i["brand"]);
        userList.add(ApiDatas.fromJson(i));
      }
      return userList;
    } else
      return userList;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getUserApi(),
        builder: (context, AsyncSnapshot<List<ApiDatas>> snapshot) {
          final users = snapshot.data;
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else
            return ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  print(snapshot.data!.length);
                  return Card(
                    child: ListTile(
                      title: Text("${snapshot.data![index].id}"),
                      subtitle: Text(" ${snapshot.data![index].name}"),
                    ),
                  );
                });
        });
  }
}

// ListView.builder(
//                 itemCount: userList.length,
//                 itemBuilder: (context, index) {
//                   return Card(
//                     child: ListTile(
//                         title: Text(
//                             "username :${snapshot.data![index].username.toString()}"),
//                         subtitle:
//                             Text("email : ${snapshot.data![index].email}"),
//                         leading: CircleAvatar(
//                           backgroundImage:
//                               NetworkImage(snapshot.data![index].urlAvatar),
//                         )),
//                   );
//                 });
//         });
//   }
// }
