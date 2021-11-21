import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
//my own imports
import 'package:swishapp/componets/horizontal_listview.dart';
import 'package:swishapp/componets/horizontal.dart';
import 'package:swishapp/componets/navtext.dart';
import 'package:swishapp/componets/nav.dart';
import 'package:swishapp/componets/shopmohamed.dart';
import 'package:swishapp/pages/grid4view.dart';
import 'package:swishapp/pages/shoppage1.dart';
import 'package:swishapp/presentation/features/products/products.dart';
import 'package:swishapp/presentation/widgets/independent/bottom_menu.dart';
import 'package:swishapp/screens/screen1.dart';
import 'ShopGrid1.dart';
//import 'bottom_navigationbar.dart';
import 'horizantolbottoms.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int bottomMenuIndex;

  _HomePageState({this.bottomMenuIndex});
  int currentIndex;
  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget imageCarousel = new Container(
      height: 200,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('assets/img/carosel1.jpg'),
          AssetImage('assets/img/carosel2.jpg'),
          AssetImage('assets/img/carosel3.jpg'),
          AssetImage('assets/img/carosel4.jpg'),
        ],
        dotSize: 10.0,
        dotSpacing: 15.0,
        dotColor: Colors.black,
        indicatorBgPadding: 5.0,
        dotBgColor: Colors.red,
        borderRadius: true,
        autoplay: true,
        animationCurve: Curves.fastLinearToSlowEaseIn,
        animationDuration: Duration(microseconds: 30000),
      ),
    );
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: Text(
          'SWISH',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 20,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon: Icon(
            Icons.notification_important_outlined,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
      body: new ListView(
        children: [
          imageCarousel,
          HorizontalList(),
          Horizontal(),
          SizedBox(
            height: 10.0,
          ),
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text(
              '    Boutiques',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Screen1(),

          HorizontalBottoms(),
          //
          Gird4(),
          //  ProductsListView(),

          //Nav(),

          ShopGridHome(title: "shpgrid"),

          ShopPage1(title: "shopping"),
          /* MyHomePage(
            title: "shoppingmed",
          ),*/
          // Navtext(),
          OpenFlutterBottomMenu(1),

          //  Bottom(),
          //OpenFlutterCollapsingScaffold()
        ],
      ),
    );
  }
}
