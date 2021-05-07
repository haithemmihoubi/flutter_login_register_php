import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 300,
                  height: 300,
                  child: Image.asset(
                    'images/icon.png',
                  ),
                ),
              ),
              Card(
                child: TextFormField(
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Icon(
                          Icons.person,
                          size: 30,
                        ),
                      ),
                      labelText: "Login",
                      hintText: "nom d'utilisateur"),
                  keyboardType: TextInputType.text,
                ),
              ),
              Card(
                child: TextFormField(
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Icon(
                          Icons.phone_locked_outlined,
                          size: 30,
                        ),
                      ),
                      labelText: "Password",
                      hintText: "password d'utilisateur"),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black, onPrimary: Colors.blue),
                  onPressed: () {},
                  child: Text(
                    "Forgot password",
                    style: TextStyle(color: Colors.white),
                  )),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlue, onPrimary: Colors.white),
                  onPressed: () {},
                  child: Text(
                    'login',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ))
            ],
          ),
        )),
      ),
    );
  }
}
