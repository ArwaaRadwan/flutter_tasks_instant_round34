import 'dart:convert';

import 'package:r34_01/src/core/api/api.dart';
import 'package:r34_01/src/core/utils/pastebin%20dart%20api/usecases/show_paste.dart';
import 'package:r34_01/src/features/products/data/product_model.dart';
import 'package:r34_01/src/features/products/domain/entities/product_entity.dart';


abstract class DataRepository {
  Future<List<ProductEntity>> getAllProducts();
  Future<List<ProductEntity>> searchProducts({
    required String name,
    String? catigory,
  });
}

class Data extends DataRepository {
  @override
  Future<List<ProductEntity>> getAllProducts() async {
    List<ProductEntity> products = [];
    String response = await showPaste(pasteKey: Api.storeAPI);

    List<dynamic> jsonList = jsonDecode(response);
    for (var element in jsonList) {
      products.add(ProductModel.fromJson(element));
    }
    return products;
  }

  @override
  Future<List<ProductEntity>> searchProducts({
    required String name,
    String? catigory,
  }) async {
    final all = await getAllProducts();

    return all.where((product) {
      final matchesName = product.title.toLowerCase().contains(
        name.toLowerCase(),
      );

      if (catigory != null && catigory.isNotEmpty) {
        return matchesName &&
            product.category.toLowerCase() == catigory.toLowerCase();
      }

      return matchesName;
    }).toList();
  }
}
