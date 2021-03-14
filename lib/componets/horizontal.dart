import 'package:flutter/material.dart';
class Horizontal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return
    Container(
        child: Row(
          children: [
            SizedBox(
              width: 20.0,
            ),

            Text(
              'Categories',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 20.0,
            ),

            Text(
              'Streams',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            SizedBox(
              width: 20.0,
            ),
            Text(
              'Gifts',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 20.0,
            ),

            Text(
              'Flash Deals',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 20.0,
            ),
      Text(
        'TOP',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
              ],
        ),
            );



  }
}