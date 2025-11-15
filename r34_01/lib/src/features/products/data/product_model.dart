import 'package:r34_01/src/features/products/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
   ProductModel({
    required super.id,
    required super.title,
    required super.description,
    required super.price,
    required super.image,
    required super.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"].toString(),
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      price: json["price"].toString(),
      image: json["image"] ?? "",
      
      category: json["category"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "price": price,
      "image": image,
    };
  }
}
