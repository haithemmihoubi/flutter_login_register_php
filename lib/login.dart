import 'package:flutter/material.dart';
import 'package:flutter_login_register_php/register.dart';
//import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final _key = GlobalKey<FormState>();
  void login() {
    if (_key.currentState.validate()) {
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.only(top: 120),
          child: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Image.asset(
                      'images/icon.png',
                    ),
                  ),
                ),
                Card(
                  child: TextFormField(
                    validator: (e) =>
                        e.isEmpty ? "veillez specifier ce champ" : null,
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
                    validator: (e) =>
                        e.isEmpty ? "veillez specifier ce champ" : null,
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
                    onPressed: login,
                    child: Text(
                      'login',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Avez vous un compte",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()));
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ))
                  ],
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
