import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_login_register_php/login.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController username = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  final _key = GlobalKey<FormState>();
  void register() async {
    if (_key.currentState.validate()) {
      var url = Uri.parse("https://gsmguide2.000webhostapp.com/test/file.php");
      final response = await http.post(url, body: {
        "user": username.text,
        "age": age.text,
        "pass": password.text
      });

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data["statut"]);
      }
    }
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
                      'images/adduser.png',
                    ),
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: username,
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
                        labelText: "nom d'utilisateur",
                        hintText: "nom d'utilisateur"),
                    keyboardType: TextInputType.text,
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: age,
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
                        labelText: "Age",
                        hintText: "Votre age "),
                    keyboardType: TextInputType.text,
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: password,
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
                        hintText: "Mot de passe"),
                    keyboardType: TextInputType.text,
                    obscureText: true,
                  ),
                ),
                Card(
                  child: TextFormField(
                    controller: confirmpassword,
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
                        labelText: "Password confirm",
                        hintText: "Mot de passe"),
                    keyboardType: TextInputType.text,
                    obscureText: true,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black, onPrimary: Colors.white),
                    onPressed: register,
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
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
