import 'package:r34_01/entities/product_entity.dart';
//  الكلاس ده هو model اللي بتجيلنا من الإنترنت (API)، وبيورث الأساسيات من ProductEntity.
class ProductModel extends ProductEntity {
  // 🇪🇬 ده مفتاح عمل استمارة منتج جديدة، ولازم نمرر له كل البيانات دي.
   ProductModel({
    required super.id,
    required super.title,
    required super.description,
    required super.price,
    required super.image,
    required super.category,
  });
//  دي "ماكينة الترجمة"، وظيفتها تحول البيانات اللي جاية من الإنترنت (JSON/Map) إلى استمارة ProductModel منظمة.
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      //  هات الـ"id" واضمن إنه يكون نص (String).
      id: json["id"].toString(),
      //  هات العنوان، ولو مش موجود حط بداله نص فاضي ("").
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      price: json["price"].toString(),
      image: json["image"] ?? "",
      category: json["category"] ?? "",
    );
  }
//  دي دالة بتعمل العكس: بتحول ProductModel إلى (Map) عشان نبعتها تاني للـServer لو احتاجنا.
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "price": price,
      "image": image,
      "category":category
    };
  }
}
