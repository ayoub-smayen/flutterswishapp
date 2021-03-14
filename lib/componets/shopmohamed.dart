import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:swishapp/pages/product_detail_page.dart';

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

/*void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Isolate Demo';

    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}
*/
class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<List<Photo>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? PhotosList(photos: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class PhotosList extends StatelessWidget {
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

  PhotosList({Key key, this.photos}) : super(key: key);

  int activeMenu = 0;

  @override
  Widget build(BuildContext context) {
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
                    )
                    //),
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
            children: List.generate(photos.length, (index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ProductDetailPage(
                                id: photos[index].id.toString(),
                                name: photos[index].title,
                                code: photos[index].slug,
                                img: "https://www.virstand.com" +
                                    photos[index].photo.split(",").first,

                                price: photos[index].price.toString(),
                                promotionPrice: photos[index].description,
                                // size: photos[index]['size'],
                                // color: photos[index]['color'],
                              )));
                },
                child: Card(
                  elevation: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      /*GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemCount: photos.length,
                        itemBuilder: (context, index) {
                          Image.network(
                              "https://www.virstand.com" + photos[index].photo);
                        },
                      ),*/

                      Hero(
                        tag: photos[index].id.toString(),
                        child: Container(
                          //width: (size.width - 16) / 2,
                          //  height: (size.width - 16) / 2,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: NetworkImage("https://www.virstand.com" +
                                photos[index].photo.split(",").first),
                            // fit: BoxFit.cover
                          )),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Image.network(
                          "https://www.virstand.com" +
                              photos[index].photo.split(",").first,
                          fit: BoxFit.cover,
                          height: 100,
                          width: 100,
                        ),
                        //  style: TextStyle(fontSize: 16),
                        // ),
                      ),
                      SizedBox(
                        height: 5,
                        width: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          photos[index].price.toString() + " USD",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          photos[index].slug,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          photos[index].size,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          photos[index].title,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          photos[index].slug,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          photos[index].price.toString() + " USD",
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

  /*return DefaultTextStyle(
      style: Theme.of(context).textTheme.bodyText2,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: <Widget>[
                    Container(
                      // A fixed-height child.
                      color: const Color(0xffeeee00), // Yellow
                      height: 120.0,
                      alignment: Alignment.center,
                      child: const Text('Fixed Height Content'),
                    ),
                    Expanded(
                      // A flexible child that will grow to fit the viewport but
                      // still be at least as big as necessary to fit its contents.
                      child: Container(
                        color: const Color(0xffee0000), // Red
                        height: 120.0,
                        alignment: Alignment.center,
                        child: const Text('Flexible Content'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );*/
}

/*
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        //Image.network("https://www.virstand.com" + photos[index].photo);
      },
    );
  }*/
//}
