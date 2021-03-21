import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xie_demo/ui/login_screen.dart';

class SignupScreen extends StatelessWidget {
  static final String route = "/signup";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignUp"),
      ),
      body: SignupView(),
    );
  }
}

class SignupView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignupViewState();
  }
}

class SignupViewState extends State<SignupView> {
  TextEditingController usernameCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();
  TextEditingController confirmPasswordCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: usernameCont,
            decoration: InputDecoration(labelText: "Username"),
          ),
          SizedBox(
            height: 16,
          ),
          TextFormField(
            obscureText: true,
            controller: passwordCont,
            decoration: InputDecoration(labelText: "Password"),
          ),
          SizedBox(
            height: 16,
          ),
          TextFormField(
            obscureText: true,
            controller: confirmPasswordCont,
            decoration: InputDecoration(labelText: "Confirm Password"),
          ),
          SizedBox(
            height: 16,
          ),

          SizedBox(
            height: 8,
          ),
          ElevatedButton(
            onPressed: _signUp,
            child: Text("Sign Up"),
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
              onPrimary: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  void _signUp() {
    var username = usernameCont.text;
    var password = passwordCont.text;

    Navigator.pushNamed(context, LoginScreen.route,arguments: LoginScreenData(username, password));
  }
}
