import 'package:flutter/material.dart';
class Navtext extends StatelessWidget {

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
              '   Home',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 20.0,
            ),

            Text(
              '   Categories',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            SizedBox(
              width: 20.0,
            ),
            Text(
              '            ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 20.0,
            ),

            Text(
              '   Watch',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 20.0,
            ),
            Text(
              '   Account',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
  }
}