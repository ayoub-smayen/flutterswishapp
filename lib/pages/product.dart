import 'package:flutter/material.dart';
import 'package:swishapp/pages/data_json.dart';
import 'package:swishapp/pages/product_detail_page.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const primary = Color(0xffce4257);
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
  final String slug;
  final String photo;

  Photo({this.price, this.id, this.title, this.slug, this.photo});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      price: json['price'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      slug: json['slug'] as String,
      photo: json['photo'] as String,
    );
  }
}

class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  int activeMenu = 0;
  // final List<Photo> photos;
  //_ProductState({Key key, this.photos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Selection of products',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 40,
              ),
              child: Row(
                  children: List.generate(menuItems.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        activeMenu = index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: activeMenu == index
                                      ? primary
                                      : Colors.transparent,
                                  width: 2))),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: Text(
                          menuItems[index],
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                );
              })),
            ),
          ),
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 7.0),
            child: TextField(
                decoration: InputDecoration(
              hintText: 'search by name of product',
              prefixIcon: Icon(Icons.search),
            )),
          ),
          SizedBox(
            height: 10,
          ),
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
                    children: <Widget>[
                      Hero(
                        tag: dataItems[index]['id'].toString(),
                        child: Container(
                          width: (size.width - 16) / 2,
                          height: (size.width - 16) / 2,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(dataItems[index]['img']),
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
                  ),
                ),
              );
            }),
          ),
          SizedBox(
            height: 20,
          ),
          Column(children: <Widget>[
            FlatButton(
                color: primary,
                padding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 160.0),
                onPressed: () {},
                child: Text(
                  "Continue",
                  style: TextStyle(color: white),
                )),
          ]),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
