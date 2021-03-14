import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:swishapp/pages/product.dart';

import '../login/login.dart';
import '../social_media/followers.dart';

class Nav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(
            width: 25.0,
          ),
          Ink(
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              iconSize: 30.0,
              onPressed: () {},
            ),
          ),
          SizedBox(
            width: 30.0,
          ),
          Ink(
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.drag_indicator_sharp,
                color: Colors.black,
              ),
              iconSize: 30.0,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Product()));
              },
            ),
          ),
          SizedBox(
            width: 30.0,
          ),
          Ink(
            decoration: ShapeDecoration(
              color: Colors.red,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.video_call_outlined,
                color: Colors.white,
              ),
              iconSize: 30.0,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
          ),
          SizedBox(
            width: 30.0,
          ),
          Ink(
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.theaters_outlined,
                color: Colors.black,
              ),
              iconSize: 30.0,
              onPressed: () {},
            ),
          ),
          SizedBox(
            width: 30.0,
          ),
          Ink(
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              iconSize: 30.0,
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
