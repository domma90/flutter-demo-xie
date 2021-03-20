import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xie_demo/ui/register_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: LoginBody(),
    );
  }
}

class LoginBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginBodyState();
  }
}

class LoginBodyState extends State<LoginBody> {
  TextEditingController usernameCont;
  TextEditingController passwordCont;

  @override
  void initState() {
    super.initState();
    usernameCont = TextEditingController();
    passwordCont = TextEditingController();
  }

  @override
  void dispose() {
    usernameCont.dispose();
    passwordCont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: usernameCont,
            decoration: InputDecoration(
              labelText: "username",
              prefixIcon: Icon(Icons.email),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          TextFormField(
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            controller: passwordCont,
            decoration: InputDecoration(
              labelText: "password",
              prefixIcon: Icon(Icons.lock),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          ElevatedButton(onPressed: _login, child: Text("Login")),
          ElevatedButton(
            onPressed: _register,
            child: Text("Register"),
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
              onPrimary: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  void _login() {
    String username = usernameCont.text;
    String password = passwordCont.text;

    if (username.isEmpty) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text("Error !"),
          content: Text("Please enter a valid username"),
        ),
      );
    } else if (password.isEmpty) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text("Error !"),
          content: Text("Please enter a valid password"),
        ),
      );
    } else {}
  }

  void _register() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterScreen()),
    );
  }
}
