import 'dart:collection';

import 'package:swishapp/data/model/product.dart';
import 'package:swishapp/data/model/product_attribute.dart';

class FavoriteProduct {
  final Product product;
  final HashMap<ProductAttribute, String> favoriteForm;

  FavoriteProduct(this.product, this.favoriteForm);
}
