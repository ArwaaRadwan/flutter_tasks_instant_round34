import 'package:flutter/material.dart';
import 'package:grocery_app/entities/product_entity.dart';
import 'package:grocery_app/widgets/home_page/box_elements.dart';


class HomeCategory extends StatelessWidget {
  final String categoryLabel;
  final List<ProductEntity> products;

  const HomeCategory({
    super.key,
    required this.categoryLabel,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                categoryLabel,
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "View All",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(
          height: 237,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return BoxElements(product: products[index]);
            },
          ),
        ),
      ],
    );
  }
}
