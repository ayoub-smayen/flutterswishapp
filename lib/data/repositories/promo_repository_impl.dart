/*
 * @author Andrew Poteryahin <openflutterproject@gmail.com>
 * @copyright 2020 Open E-commerce App
 * @see promo_repository_impl.dart
 */

import 'package:swishapp/data/model/promo.dart';
import 'package:swishapp/data/repositories/abstract/promo_repository.dart';
import 'package:swishapp/data/error/exceptions.dart';
import 'package:swishapp/data/local/local_promo_repository.dart';
import 'package:swishapp/data/network/network_status.dart';
import 'package:swishapp/data/woocommerce/repositories/promo_remote_repository.dart';
import 'package:swishapp/locator.dart';

class PromoRepositoryImpl extends PromoRepository {
  static PromoDataStorage promoDataStorage = PromoDataStorage();

  @override
  Future<List<Promo>> getPromoList() async {
    try {
      NetworkStatus networkStatus = sl();
      PromoRepository promoRepository;
      if (networkStatus.isConnected != null) {
        promoRepository = RemotePromoRepository(woocommerce: sl());
      } else {
        promoRepository = LocalPromoRepository();
      }

      promoDataStorage.items = await promoRepository.getPromoList();

      return promoDataStorage.items;
    } on HttpRequestException {
      throw RemoteServerException();
    }
  }
}

class PromoDataStorage {
  List<Promo> items = [];
}
