import 'package:flutter/material.dart';

class snackbar extends StatefulWidget {
  const snackbar({Key? key}) : super(key: key);

  @override
  State<snackbar> createState() => _snackbarState();
}

class _snackbarState extends State<snackbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Row(
                        children: [
                          Icon(Icons.email),
                          SizedBox(
                            width: 20,
                          ),
                          Text("login success"),
                        ],
                      ),
                    ),
                  );
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                color: Colors.yellow,
                elevation: 10,
                child: Text(
                  "Login",
                ),
                splashColor: Colors.orange,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
