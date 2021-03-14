// Promo repository
// Author: openflutterproject@gmail.com
// Date: 2020-05-09

import 'package:swishapp/data/model/promo.dart';

abstract class PromoRepository {
  Future<List<Promo>> getPromoList();
}
