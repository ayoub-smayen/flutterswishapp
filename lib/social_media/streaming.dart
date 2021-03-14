import 'package:flutter/material.dart';

class Strem1 extends StatefulWidget {
  @override
  _Strem1State createState() => _Strem1State();
}

class _Strem1State extends State<Strem1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/blonde.jpg"),
          ),
        ),
      ),
    );
  }
}
