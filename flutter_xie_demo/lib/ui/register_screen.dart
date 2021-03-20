import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xie_demo/ui/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register"),),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Login"),
        ),
      ),
    );
  }
}
