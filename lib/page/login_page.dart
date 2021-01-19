import 'package:flutter/material.dart';
import 'package:flutter_bloc/bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBLoC loginBLoC = new LoginBLoC();
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StreamBuilder(
                stream: loginBLoC.usernameStream,
                builder: (context, snapshot) {
                  return TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      errorText: snapshot.hasError?snapshot.error:null,
                      hintText: "Username",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent)
                      )
                    ),
                  );
                }
              ),
              SizedBox(height: 20,),
              StreamBuilder(
                stream: loginBLoC.passwordStream,
                builder: (context, snapshot) {
                  return TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent)
                      ),
                      hintText: "Password",
                      errorText: snapshot.hasError?snapshot.error:null,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueAccent)
                      )
                    ),
                  );
                }
              ),
              SizedBox(height: 30,),
              RaisedButton(
                onPressed: (){
                  print("Login now");
                  loginBLoC.isDataValid(_usernameController.text, _passwordController.text);
                },
                color: Colors.blue,
                child: Text("Login"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
