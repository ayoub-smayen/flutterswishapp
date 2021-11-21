import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swishapp/componets/shopmohamed.dart';

import 'package:swishapp/messenger/pages/chat.dart';
import 'package:swishapp/pages/chat_page.dart';
import 'package:swishapp/social_media/streaming.dart';
import 'package:swishapp/users/user-list.dart';
import 'package:swishapp/screens/Chatstreamscreen1.dart';
import 'bottom_navigationbar.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(
            width: 25.0,
          ),
          Ink(
            decoration: ShapeDecoration(
              color: Colors.orange,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.list,
                color: Colors.white,
              ),
              iconSize: 40.0,
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Strem1()));
              },
            ),
          ),
          SizedBox(
            width: 25.0,
          ),
          Ink(
            decoration: ShapeDecoration(
              color: Colors.orange,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_bag,
                color: Colors.white,
              ),
              iconSize: 40.0,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyHomePage(
                              title: "shopping",
                            )));
              },
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Ink(
            decoration: ShapeDecoration(
              color: Colors.orange,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.chat_rounded,
                color: Colors.white,
              ),
              iconSize: 40.0,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatPage1(),
                    ));
              },
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Ink(
            decoration: ShapeDecoration(
              color: Colors.orange,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.list,
                //Icons.wallet_giftcard_sharp,
                color: Colors.white,
              ),
              iconSize: 40.0,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UserList()));
              },
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Ink(
            decoration: ShapeDecoration(
              color: Colors.orange,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.play_arrow,
                color: Colors.white,
              ),
              iconSize: 40.0,
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Bottom()));
              },
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Ink(
            decoration: ShapeDecoration(
              color: Colors.orange,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.chat_bubble,
                color: Colors.white,
              ),
              iconSize: 40.0,
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Chat()));
              },
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Ink(
            decoration: ShapeDecoration(
              color: Colors.orange,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.chat_bubble,
                color: Colors.white,
              ),
              iconSize: 40.0,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChatStreamScreen1()));
              },
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Ink(
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.wallet_giftcard_sharp,
                color: Colors.orange,
              ),
              iconSize: 40.0,
              onPressed: () {},
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Ink(
            decoration: ShapeDecoration(
              color: Colors.orange,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.flash_on_sharp,
                color: Colors.white,
              ),
              iconSize: 40.0,
              onPressed: () {},
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Ink(
            decoration: ShapeDecoration(
              color: Colors.orange,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.flash_on_sharp,
                color: Colors.white,
              ),
              iconSize: 40.0,
              onPressed: () {},
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Ink(
            decoration: ShapeDecoration(
              color: Colors.orange,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.thumb_up,
                color: Colors.white,
              ),
              iconSize: 40.0,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
