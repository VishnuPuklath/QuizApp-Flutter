import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.green),
            onPressed: () {},
            child: Text('TRUE'),
          ),ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.red),
            onPressed: () {},
            child: Text('TRUE'),
          ),
        ]),
      ),
    );
  }
}
