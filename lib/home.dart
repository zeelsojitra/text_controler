import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController _emailTextEditCtr;

  @override
  void initState() {
    _emailTextEditCtr = TextEditingController();
    _emailTextEditCtr.text = "hello";
    print("initState()");
  }

  @override
  Widget build(BuildContext context) {
    print("Build()");

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
              onPressed: () {
                //Navigator.pushReplacement();
                Navigator.pop(context);
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Text("Home Page"),
      ),
    );
  }

  @override
  void dispose() {
    _emailTextEditCtr.dispose();
    print(_emailTextEditCtr.text);
    print("dispose()");
    super.dispose();
  }
}
