import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/bottom_navigation_bar.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
class WelcomeForm extends StatefulWidget {
  @override
  _WelcomeFormState createState() => _WelcomeFormState();
}

class _WelcomeFormState extends State<WelcomeForm> {
int _selectedIndex=0;
List<Widget> _WidgetOptions= [

];
void OnItemTap(int index){
  setState(()
  { _selectedIndex=index;

  }
  );
}

  @override
  Widget build(BuildContext context) {

   return
    BottomNavigationBar(

      currentIndex: _selectedIndex,
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.white,
    iconSize: 30,
    items: [
    BottomNavigationBarItem(icon:Icon (Icons.home),
    title: Text('Home'),

    backgroundColor: Colors.black
    ),
    BottomNavigationBarItem(icon:Icon (Icons.drag_indicator_sharp),
    title: Text('Categories'),
    backgroundColor: Colors.white
    ),
    BottomNavigationBarItem(icon:Icon (Icons.video_call_outlined),
        title: Text(''),
    backgroundColor: Colors.white

    ),
    BottomNavigationBarItem(icon:Icon (Icons.theaters_outlined),
    title: Text('Watch'),
    backgroundColor: Colors.white
    ),
    BottomNavigationBarItem(icon:Icon (Icons.person),
    title: Text('Account'),
    backgroundColor: Colors.white
    ),
    ],

    );
  }
}
