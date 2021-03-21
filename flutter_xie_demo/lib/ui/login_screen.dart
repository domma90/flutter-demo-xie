import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xie_demo/ui/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  static final String route = "/";

  @override
  Widget build(BuildContext context) {
    LoginScreenData loginScreenData = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: loginScreenData == null
          ? LoginView()
          : LoginView(
              username: loginScreenData.username,
              password: loginScreenData.password,
            ),
    );
  }
}

class LoginView extends StatefulWidget {
  String username;
  String password;

  LoginView({this.username, this.password});

  @override
  State<StatefulWidget> createState() {
    return LoginViewState();
  }
}

class LoginViewState extends State<LoginView> {
  TextEditingController usernameCont;
  TextEditingController passwordCont;

  @override
  void dispose() {
    usernameCont.dispose();
    passwordCont.dispose();
    super.dispose();
  }

  @override
  void initState() {
    usernameCont = TextEditingController();
    passwordCont = TextEditingController();

    if (widget.username != null) {
      usernameCont.text = widget.username;
    }
    if (widget.password != null) {
      passwordCont.text = widget.password;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          verticalDirection: VerticalDirection.down,
          mainAxisSize: MainAxisSize.max,
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
            ElevatedButton(onPressed: _login, child: Text("Login")),
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
          ]),
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
    } else {
      //todo login
    }
  }

  void _signUp() {
    // Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
    Navigator.pushNamed(context, SignupScreen.route);
  }
}

class LoginScreenData {
  String username;
  String password;

  LoginScreenData(this.username, this.password);
}
