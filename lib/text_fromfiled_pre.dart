import 'package:flutter/material.dart';
import 'package:text_controler/home_page.dart';

class demo extends StatefulWidget {
  const demo({Key? key}) : super(key: key);

  @override
  State<demo> createState() => _demoState();
}

class _demoState extends State<demo> {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();

  var emailgloablekey = GlobalKey<FormState>();
  var passwordgloablekey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "User Login",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Form(
                key: emailgloablekey,
                child: TextFormField(
                  controller: _emailcontroller,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                    hintText: "Enter Email",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  onChanged: (value) {
                    emailgloablekey.currentState!.validate();
                  },
                  validator: (value) {
                    bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value!);

                    if (emailValid) {
                      return null;
                    } else {
                      return "Please enter valid email address";
                    }
                  },
                )),
            SizedBox(
              height: 20,
            ),
            Form(
                key: passwordgloablekey,
                child: TextFormField(
                  controller: _passwordcontroller,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.security,
                      color: Colors.black,
                    ),
                    hintText: "Enter Password",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                if (emailgloablekey.currentState!.validate() &&
                    passwordgloablekey.currentState!.validate()) {
                  String email = _emailcontroller.text;
                  String password = _passwordcontroller.text;
                  if (email == "Zeelsojitra00@gmail.com" &&
                      password == "Zeel@123") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => home_page(),
                        ));
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("Login success")));
                  } else {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("Login Failed")));
                  }
                }
                print(_emailcontroller.text);
                print(_passwordcontroller.text);
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Text("Login"),
              elevation: 10,
              color: Colors.yellow,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            )
          ],
        ),
      ),
    );
  }
}
