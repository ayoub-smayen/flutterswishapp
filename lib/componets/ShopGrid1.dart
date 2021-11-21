import 'package:flutter/material.dart';

/*void main() {
  runApp(MyApp());
}*/

import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
//import 'package:swishapp/pages/product_detail_page.dart';

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

class ShopGridHome extends StatelessWidget {
  final String title;

  ShopGridHome({Key key, this.title}) : super(key: key);

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
              ? GridShop1(photos: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class GridShop1 extends StatelessWidget {
  final List<Photo> photos;
  GridShop1({Key key, this.photos}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final title = 'Grid List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(photos.length, (index) {
            return Center(
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 40,
                      ),

                      child: Card(
                        elevation: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Item' + photos[index].title,
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            Text(
                              'Item ' + photos[index].slug,
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            Text(
                              'Item ' + photos[index].price.toString(),
                              style: Theme.of(context).textTheme.headline5,
                            ),
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
                          ],
                        ),
                      ),

                      /* SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 40,
                      ),
                      child:

                          Text(
                'Item $index',
                style: Theme.of(context).textTheme.headline5,
              ),
*/

                      // )
                      // )
                    )));
          }),
        ),
      ),
    );
  }
}
