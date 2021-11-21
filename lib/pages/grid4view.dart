import 'package:flutter/material.dart';
import 'package:swishapp/config/routes.dart';
import 'package:swishapp/main.dart';
//import 'package:swishapp/pages/product.dart';
import 'package:swishapp/presentation/features/categories/categories.dart';
import 'package:swishapp/presentation/features/home/home.dart';
import 'package:swishapp/presentation/widgets/data_driven/product_list_view.dart';
import 'package:swishapp/presentation/widgets/independent/block_header.dart';
import 'package:swishapp/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swishapp/config/routes.dart';
import 'package:swishapp/config/theme.dart';
import 'package:swishapp/data/model/product.dart';
import 'package:swishapp/presentation/features/categories/categories.dart';
import 'package:swishapp/presentation/features/home/home_bloc.dart';
import 'package:swishapp/presentation/features/home/home_event.dart';
import 'package:swishapp/presentation/features/wrapper.dart';
import 'package:swishapp/presentation/widgets/widgets.dart';

class Grid4View extends StatefulWidget {
  final Function changeView;
  final List<Product> salesProducts;
  final List<Product> newProducts;

  const Grid4View(
      {Key key, this.changeView, this.salesProducts, this.newProducts})
      : super(key: key);

  @override
  _Main2ViewState2 createState() => _Main2ViewState2();
}

class _Main2ViewState2 extends State<Grid4View> {
  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    var width = MediaQuery.of(context).size.width;
    var widgetWidth = width - AppSizes.sidePadding * 2;
    return SingleChildScrollView(
        child: Column(children: <Widget>[
      Container(
          height: width * 0.52,
          width: width,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/splash/topbanner.png'),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(left: AppSizes.sidePadding),
                  width: width,
                  child: Text('Street clothes',
                      style: _theme.textTheme.headline.copyWith(fontSize: 34)))
            ],
          )),
      OpenFlutterBlockHeader(
        width: widgetWidth,
        title: 'Sale',
        linkText: 'View All',
        onLinkTap: () => {
          Navigator.of(context).pushNamed(OpenFlutterEcommerceRoutes.shop,
              arguments: CategoriesParameters(2))
        },
        description: 'Super summer sale',
      ),
      OpenFlutterProductListView(
          width: widgetWidth,
          products: widget.salesProducts,
          onFavoritesTap: ((Product product) => {
                BlocProvider.of<HomeBloc>(context).add(HomeAddToFavoriteEvent(
                    isFavorite: !product.isFavorite, product: product))
              })),
      Padding(padding: EdgeInsets.only(top: AppSizes.sidePadding)),
      OpenFlutterBlockHeader(
        width: widgetWidth,
        title: 'New',
        linkText: 'View All',
        onLinkTap: () => {
          Navigator.of(context).pushNamed(OpenFlutterEcommerceRoutes.shop,
              arguments: CategoriesParameters(3))
        },
        description: 'You’ve never seen it before!',
      ),
      OpenFlutterProductListView(
        width: widgetWidth,
        products: widget.newProducts,
        onFavoritesTap: ((Product product) => {
              BlocProvider.of<HomeBloc>(context).add(HomeAddToFavoriteEvent(
                  isFavorite: !product.isFavorite, product: product))
            }),
      ),
      OpenFlutterButton(
        title: 'Next Home Page',
        width: 160,
        height: 48,
        onPressed: (() =>
            widget.changeView(changeType: ViewChangeType.Forward)),
      )
    ]));
  }
}

class Gird4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var widgetWidth = width - AppSizes.sidePadding * 2;
    return Container(
      color: Colors.black12,
      height: 300.0,
      child: GridView.count(
        scrollDirection: Axis.vertical,
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 4,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                    image: AssetImage("assets/gird4/dress.jpg"),
                    fit: BoxFit.cover)),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                    image: AssetImage("assets/gird4/shoes.jpg"),
                    fit: BoxFit.cover)),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                    image: AssetImage("assets/gird4/makeup.jpg"),
                    fit: BoxFit.cover)),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                    image: AssetImage("assets/gird4/bags.jpg"),
                    fit: BoxFit.cover)),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                    image: AssetImage("assets/gird4/skincare.jpg"),
                    fit: BoxFit.cover)),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                    image: AssetImage("assets/gird4/lingerie.png"),
                    fit: BoxFit.cover)),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                    image: AssetImage("assets/gird4/coats.jpg"),
                    fit: BoxFit.cover)),
            child: Text(
              'Categories',
              //style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                    image: AssetImage("assets/gird4/watchs.png"),
                    fit: BoxFit.cover)),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                    image: AssetImage("assets/gird4/jewellery.jpg"),
                    fit: BoxFit.cover)),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                    image: AssetImage("assets/gird4/glasses.jpg"),
                    fit: BoxFit.cover)),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                    image: AssetImage("assets/gird4/sport.jpg"),
                    fit: BoxFit.cover)),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                    image: AssetImage("assets/gird4/maternity.jpg"),
                    fit: BoxFit.cover)),
          ),
          /* OpenFlutterBlockHeader(
            width: widgetWidth,
            title: 'New',
            linkText: 'View All',
            onLinkTap: () => {
              Navigator.of(context).pushNamed(OpenFlutterEcommerceRoutes.shop,
                  arguments: CategoriesParameters(0))
            },
            description: 'You’ve never seen it before!',
          ),
          OpenFlutterProductListView(
            width: widgetWidth,
            // products: widget.newProducts,
          ),*/
          //HomeScreen(),
        ],
      ),
    );
  }
}
