import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:swishapp/pages/data_json.dart';
import 'package:swishapp/pages/product_detail_page.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/foundation.dart';
//import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const primary = Color(0xFF3c4f76);
const black = Color(0xFF000000);
const white = Color(0xFFFFFFFF);

Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response =
      await client.get(Uri.parse('https://www.virstand.com/api/articles'));

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parsePhotos, response.body);
}

// A function that converts a response body into a List<Photo>.
List<Photo> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}

class Photo {
  final int price;
  final int id;
  final String title;
  final String description;
  final String slug;
  final String photo;
  final String size;
  final String brand;

  Photo(
      {this.price,
      this.id,
      this.title,
      this.slug,
      this.photo,
      this.brand,
      this.size,
      this.description});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      price: json['price'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      slug: json['slug'] as String,
      description: json['description'] as String,
      photo: json['photo'] as String,
      size: json['size'] as String,
    );
  }
}

class HomePage1 extends StatefulWidget {
  @override
  _HomePage1State createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  final List<Photo> photos;
  List menuItems = [
    "Streamer List",
    "By categories",
    "Shirt",
    "Watch",
    "Dress",
    "Skirt",
    "Pant",
    "Wallet",
    "Backpack",
    "Jean"
  ];
  _HomePage1State({this.photos});

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
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite_outline,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
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
    );
    // ignore: dead_code
    new Container(
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
    Widget() {
      var size = MediaQuery.of(context).size;
      return SafeArea(
        child: ListView(
          children: [
            Wrap(
              children: List.generate(dataItems.length, (index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ProductDetailPage(
                                  id: dataItems[index]['id'].toString(),
                                  name: dataItems[index]['name'],
                                  code: dataItems[index]['code'],
                                  img: dataItems[index]['img'],
                                  price: dataItems[index]['price'].toString(),
                                  promotionPrice: dataItems[index]
                                          ['promotionPrice']
                                      .toString(),
                                  size: dataItems[index]['size'],
                                  color: dataItems[index]['color'],
                                )));
                  },
                  child: Card(
                      elevation: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Hero(
                            tag: dataItems[index]['id'].toString(),
                            child: Container(
                              width: (size.width - 16) / 2,
                              height: (size.width - 16) / 2,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          NetworkImage(dataItems[index]['img']),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              dataItems[index]['code'],
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              dataItems[index]['price'].toString() + " USD",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      )),
                );
              }),
            )
          ],
        ),
      );
    }
  }
}
