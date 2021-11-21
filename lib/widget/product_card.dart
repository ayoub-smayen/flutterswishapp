import 'package:flutter/material.dart';

import 'package:swishapp/model/photo.dart';
import 'package:swishapp/themes/light_color.dart';
import 'package:swishapp/widget/title_text.dart';
import 'package:swishapp/widget/extensins.dart';
/*
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
}
*/

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
                      Image.asset(photo.photo)
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
