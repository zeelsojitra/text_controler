import 'package:flutter/material.dart';
import 'package:text_controler/home_page.dart';

class textfromfiled extends StatefulWidget {
  @override
  State<textfromfiled> createState() => _textfromfiledState();
}

class _textfromfiledState extends State<textfromfiled> {
  TextEditingController _emailEditingController = TextEditingController();
  TextEditingController _passEditingController = TextEditingController();

  var gloablekeyemail = GlobalKey<FormState>();
  var gloablekeypassword = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "User Login",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Form(
                  key: gloablekeyemail,
                  child: TextFormField(
                    controller: _emailEditingController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
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
                      gloablekeyemail.currentState!.validate();
                    },
                    validator: (value) {
                      final bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!);

                      if (emailValid) {
                        return null;
                      } else {
                        return "Please enter valid Email Id";
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Form(
                  key: gloablekeypassword,
                  child: TextFormField(
                    obscureText: true,
                    controller: _passEditingController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      hintText: "Enter password",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    onChanged: (value) {
                      gloablekeypassword.currentState!.validate();
                    },
                    validator: (value) {
                      final bool passwordValid = RegExp(
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
                  splashColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onPressed: () {
                    if (gloablekeyemail.currentState!.validate() &&
                        gloablekeypassword.currentState!.validate()) {
                      String email = _emailEditingController.text;
                      String password = _passEditingController.text;

                      if (email == "admin@gmail.com" &&
                          password == "Admin@123") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => home_page(),
                            ));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Login Failed")));
                      }
                    }
                    print("Email :${_emailEditingController.text}");
                    print("Password :${_passEditingController.text}");
                    FocusManager.instance.primaryFocus?.unfocus();

                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(
                    //     content: Row(
                    //       children: [
                    //         Icon(
                    //           Icons.ac_unit,
                    //           color: Colors.white,
                    //         ),
                    //         SizedBox(width: 20),
                    //         Text("Login Success"),
                    //       ],
                    //     ),
                    //   ),
                    // );
                  },
                  color: Colors.yellow,
                  elevation: 10,
                  child: Text("Login"),
                ),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  splashColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onPressed: () {
                    _passEditingController.clear();
                    _emailEditingController.clear();
                  },
                  color: Colors.yellow,
                  elevation: 10,
                  child: Text("Clear"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
