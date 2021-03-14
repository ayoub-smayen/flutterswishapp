import 'package:flutter/material.dart';
class Carousel1 extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return
      Container(
        height: 40.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Strem(
              image_location: 'assets/img/carosel2.jpg',
            ),

          ],
        ),

      );




  }

}
class Strem extends StatelessWidget {
  final String image_location;
  Strem({this.image_location});

  @override
  Widget build(BuildContext context) {
   return Padding(padding: const EdgeInsets.all(2.0),
   child: InkWell(onTap:(){},
     child:Container(
     child: ListTile(
    title:Image.asset(image_location,),
   ),
   ),
   ),
   );

  }

}