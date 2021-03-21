import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class UserListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: UserListBody(),
    );
  }
}

class UserListBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UserListBodyState();
  }
}

class UserListBodyState extends State<UserListBody> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.hasData) {
              List<String> data = snapshot.data;

             /* List<Text> textViews = [];

              for (String name in data) {
                textViews.add(Text(name));
              }*/

              return ListView.builder(
                itemBuilder: (_, index) => Text(data[index]),
                itemCount: data.length,
              );
/*
              return ListView(
                children: textViews,
              );*/
            } else {
              return Text("No Data");
            }
          }
        });
  }
}

Future<List<String>> getUsers() {
  return Future.delayed(Duration(seconds: 3), () => ["apple", "orange"]);
}
