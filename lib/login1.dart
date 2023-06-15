import 'package:flutter/material.dart';

import 'home.dart';

class Login01 extends StatefulWidget {
  Login01({Key? key}) : super(key: key);

  @override
  State<Login01> createState() => _Login01State();
}

class _Login01State extends State<Login01> {
  String? _email = "";
  String? _password = "";
  late TextEditingController _emailTextEditCtr;
  late TextEditingController _passwordTextEditctr;

  var globalKeyForEmail = GlobalKey<FormState>();
  var globalKeyForPassword = GlobalKey<FormState>();

  @override
  void initState() {
    _emailTextEditCtr = TextEditingController();
    _passwordTextEditctr = TextEditingController();
    print("initState()");
  }

  @override
  Widget build(BuildContext context) {
    print("build()");

    return Scaffold(
        body: Center(
            child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Login Page",
            style: TextStyle(
                color: Colors.red, fontWeight: FontWeight.bold, fontSize: 40),
          ),
          SizedBox(
            height: 35,
          ),
          Form(
            key: globalKeyForEmail,
            child: TextFormField(
              controller: _emailTextEditCtr,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.mail),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: "Email Address",
              ),
              onChanged: (value) {
                globalKeyForEmail.currentState!.validate(); //mins
              },
              validator: (value) {
                bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value!);

                if (emailValid) {
                  return null;
                } else {
                  return "please enter valid email";
                }
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Form(
            key: globalKeyForPassword,
            child: TextFormField(
              controller: _passwordTextEditctr,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.security),
                  suffixIcon: Icon(Icons.lock_open),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "Password"),
              onChanged: (value) {
                globalKeyForPassword.currentState!.validate();
              },
              validator: (value) {
                bool passwordValid = RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                    .hasMatch(value!);

                if (passwordValid) {
                  return null;
                } else {
                  return "should contain upper,lower,digit and Special character and min 8 Char..";
                }
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          MaterialButton(
            onPressed: () {
              if (globalKeyForEmail.currentState!.validate() &&
                  globalKeyForPassword.currentState!.validate()) {
                String email = _emailTextEditCtr.text;
                String password = _passwordTextEditctr.text;

                if (email == "admin@gmail.com" && password == "Admin@123") {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Home()));
                } else {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("Login failed")));
                }
              }
            },
            child: Text(
              "Login",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            color: Colors.red,
            height: 50,
            minWidth: 500,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
          SizedBox(
            height: 20,
          ),
          MaterialButton(
            onPressed: () {
              _emailTextEditCtr.clear();
              _passwordTextEditctr.clear();
            },
            child: Text(
              "Clear",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            color: Colors.red,
            height: 50,
            minWidth: 500,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
          Text(_email!),
          Text(_password!),
        ],
      ),
    )));
  }

  @override
  void dispose() {
    _passwordTextEditctr.dispose();
    _emailTextEditCtr.dispose();
  }
}
