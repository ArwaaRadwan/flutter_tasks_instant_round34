import 'dart:convert';
import 'package:grocery_app/core/api/api.dart';
import 'package:grocery_app/core/utils/pastebin%20dart%20api/usecases/show_paste.dart';
import 'package:grocery_app/data/product_model.dart';
import 'package:grocery_app/entities/product_entity.dart';


abstract class DataRepository {
  Future<List<ProductEntity>> getAllProducts();
  List<ProductEntity> searchProduct({required String name, String catigory});

}

class Data extends DataRepository {

  @override
  Future<List<ProductEntity>> getAllProducts() async {
      List<ProductEntity> products = [];

      //! Data Fetching
      //show paste (تمثل  عمليه HTTP Request عشان تجيب بيانات من الserver)
    String response = await showPaste(pasteKey: Api.storeAPI);

//لتحويل(String) المخزنة في response إلى هيكل بيانات يمكن لـ (Dart)
    List<dynamic> json = jsonDecode(response);
    for (var element in json) {
      products.add(ProductModel.fromJson(element));
    }

    return products;
  }

  @override
  List<ProductEntity> searchProduct({required String name, String? catigory}) {
    throw UnimplementedError();
  }

}
