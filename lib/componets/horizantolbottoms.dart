import 'package:flutter/material.dart';

class HorizontalBottoms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 30.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          SizedBox(
            width: 10.0,
          ),
          Container(
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(20.0),
                side: BorderSide(color: Colors.black),
              ),
              onPressed: () => {},
              child: new Text('WOMEN'),
              color: Colors.white,
              textColor: Colors.black,
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Container(
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(20.0),
                side: BorderSide(color: Colors.black),
              ),
              onPressed: () => {},
              child: new Text('MEN'),
              color: Colors.white,
              textColor: Colors.black,
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Container(
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(20.0),
                side: BorderSide(color: Colors.black),
              ),
              onPressed: () => {},
              child: new Text('KIDS'),
              color: Colors.white,
              textColor: Colors.black,
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Container(
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(20.0),
                side: BorderSide(color: Colors.black),
              ),
              onPressed: () => {},
              child: new Text('BRANDS'),
              color: Colors.white,
              textColor: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
