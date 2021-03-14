import 'package:flutter/material.dart';
import 'package:swishapp/data/repositories/abstract/category_repository.dart';
import 'package:swishapp/data/model/category.dart';
import 'package:swishapp/data/error/exceptions.dart';
import 'package:swishapp/data/woocommerce/models/product_category_model.dart';
import 'package:swishapp/data/woocommerce/repositories/woocommerce_wrapper.dart';

class RemoteCategoryRepository extends CategoryRepository {
  final WoocommercWrapperAbstract woocommerce;

  RemoteCategoryRepository({@required this.woocommerce});

  @override
  Future<List<ProductCategory>> getCategories(
      {int parentCategoryId = 0}) async {
    try {
      List<dynamic> categoriesData =
          await woocommerce.getCategoryList(parentId: parentCategoryId);
      List<ProductCategory> categories = [];
      for (int i = 0; i < categoriesData.length; i++) {
        categories.add(ProductCategory.fromEntity(
            ProductCategoryModel.fromJson(categoriesData[i])));
      }
      return categories;
    } on HttpRequestException {
      throw RemoteServerException();
    }
  }

  @override
  Future<ProductCategory> getCategoryDetails(int categoryId) {
    // TODO: implement getCategoryDetails
    return null;
  }
}
