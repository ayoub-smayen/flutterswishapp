import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//import 'package:swishapp/componets/shopmohamed.dart';

import 'package:swishapp/model/data.dart';
import 'package:swishapp/themes/light_color.dart';
import 'package:swishapp/themes/theme.dart';

import 'package:swishapp/widget/product_icon.dart';
import 'package:swishapp/widget/extensins.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'package:swishapp/themes/light_color.dart';
import 'package:swishapp/widget/title_text.dart';
import 'package:swishapp/widget/extensins.dart';
import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

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
  bool isliked;
  bool isSelected;

  Photo(
      {this.price,
      this.id,
      this.title,
      this.slug,
      this.photo,
      this.brand,
      this.size,
      this.description,
      this.isSelected = false,
      this.isliked = false});

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

class ProductCard extends StatelessWidget {
  final Photo photo;
  final ValueChanged<Photo> onSelected;
  ProductCard({Key key, this.photo, this.onSelected}) : super(key: key);

//   @override
//   _ProductCardState createState() => _ProductCardState();
// }

// class _ProductCardState extends State<ProductCard> {
//   Product product;
//   @override
//   void initState() {
//     product = widget.product;
//     super.initState();
//   }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: LightColor.background,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(color: Color(0xfff8f8f8), blurRadius: 15, spreadRadius: 10),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: !photo.isSelected ? 20 : 0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              left: 0,
              top: 0,
              child: IconButton(
                icon: Icon(
                  photo.isliked ? Icons.favorite : Icons.favorite_border,
                  color: photo.isliked ? LightColor.red : LightColor.iconColor,
                ),
                onPressed: () {},
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(height: photo.isSelected ? 15 : 0),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: LightColor.orange.withAlpha(40),
                      ),
                      Image.network("https://www.virstand.com/" +
                          photo.photo.split(",")[0])
                    ],
                  ),
                ),
                // SizedBox(height: 5),
                TitleText(
                  text: photo.title,
                  fontSize: photo.isSelected ? 16 : 14,
                ),
                TitleText(
                  text: photo.slug,
                  fontSize: photo.isSelected ? 14 : 12,
                  color: LightColor.orange,
                ),
                TitleText(
                  text: photo.price.toString(),
                  fontSize: photo.isSelected ? 18 : 16,
                ),
              ],
            ),
          ],
        ),
      ).ripple(() {
        Navigator.of(context).pushNamed('/detail');
        onSelected(photo);
      }, borderRadius: BorderRadius.all(Radius.circular(20))),
    );
  }
}

class ShopPage1 extends StatefulWidget {
  ShopPage1({Key key, this.title}) : super(key: key);

  //ShopPage1({Key key, this.title,this.photos}) : super(key: key);StatefulWidget

  //int activeMenu = 0;

  final String title;
  int ind = 0;
  final List<Photo> ming = [];

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
              ? {
                  // ming.setAll(ind, snapshot.data),
                  ming.addAll(snapshot.data),
                  print(ming.length),
                  //
                  //_ShopPage1State(photos: snapshot.data)
                }
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  @override
  _ShopPage1State createState() => _ShopPage1State(photos: ming);
}

class _ShopPage1State extends State<ShopPage1> {
  final List<Photo> photos;
  //final Photo photo;
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

  _ShopPage1State({Key key, this.photos});

  Widget _icon(IconData icon, {Color color = LightColor.iconColor}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(13)),
          color: Theme.of(context).backgroundColor,
          boxShadow: AppTheme.shadow),
      child: Icon(
        icon,
        color: color,
      ),
    ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(13)));
  }

  Widget _categoryWidget() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: AppTheme.fullWidth(context),
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: AppData.categoryList
            .map(
              (category) => ProductIcon(
                model: category,
                onSelected: (model) {
                  setState(() {
                    AppData.categoryList.forEach((item) {
                      item.isSelected = false;
                    });
                    model.isSelected = true;
                  });
                },
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _productWidget() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: AppTheme.fullWidth(context),
      height: AppTheme.fullWidth(context) * .7,
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 4 / 3,
            mainAxisSpacing: 30,
            crossAxisSpacing: 20),
        padding: EdgeInsets.only(left: 20),
        scrollDirection: Axis.horizontal,
        children:

            //AppData.productList
            photos
                .map(
                  (photo) => ProductCard(
                    photo: photo,
                    onSelected: (model) {
                      setState(() {
                        // AppData.productList

                        photos.forEach((item) {
                          item.isSelected = false;
                        });
                        model.isSelected = true;
                      });
                    },
                  ),
                )
                .toList(),
      ),
    );
  }

  Widget _search() {
    return Container(
      margin: AppTheme.padding,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: LightColor.lightGrey.withAlpha(100),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search Products",
                    hintStyle: TextStyle(fontSize: 12),
                    contentPadding:
                        EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 5),
                    prefixIcon: Icon(Icons.search, color: Colors.black54)),
              ),
            ),
          ),
          SizedBox(width: 20),
          _icon(Icons.filter_list, color: Colors.black54)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 210,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        dragStartBehavior: DragStartBehavior.down,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _search(),
            _categoryWidget(),
            _productWidget(),
          ],
        ),
      ),
    );
  }
}
