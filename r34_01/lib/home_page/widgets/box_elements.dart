import 'package:flutter/material.dart';
import 'package:r34_01/product/screens/product_details_page.dart';
import 'package:r34_01/src/features/products/domain/entities/product_entity.dart';

class BoxElements extends StatelessWidget {
  final ProductEntity product;

  const BoxElements({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailsPage(product: product),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Container(
          width: 170,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.green, width: 0.9),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 170,
                height: 134,
                child: product.image.startsWith('http')
                    ? Image.network(product.image, fit: BoxFit.contain)
                    : Image.asset(product.image, fit: BoxFit.contain),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      product.description,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                   
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            product.price,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                     
                      
                    
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
