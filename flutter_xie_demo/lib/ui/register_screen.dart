import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xie_demo/ui/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: RegisterScreenBody(),
    );
  }
}

class RegisterScreenBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegisterScreenBodyState();
  }
}

class RegisterScreenBodyState extends State<RegisterScreenBody> {
  TextEditingController usernameCont;
  TextEditingController passwordCont;

  @override
  void initState() {
    usernameCont = TextEditingController();
    passwordCont = TextEditingController();
    super.initState();
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
          ElevatedButton(
            onPressed: _register,
            child: Text("Create Account"),
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
              onPrimary: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  void _register() {
    Navigator.pushNamed(
      context,
      "/",
      arguments: LoginScreenArguments(usernameCont.text, passwordCont.text),
    );
  }
}
