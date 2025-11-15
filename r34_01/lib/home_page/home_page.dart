import 'package:flutter/material.dart';
import 'package:r34_01/home_page/widgets/box_elements.dart';
import 'package:r34_01/home_page/widgets/drawer.dart';
import 'package:r34_01/home_page/widgets/slider.dart';
import 'package:r34_01/src/core/widgets/name_style.dart';
import 'package:r34_01/src/data.dart';
import 'package:r34_01/src/features/products/domain/entities/product_entity.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Data dataRepository = Data();

  List<ProductEntity> popularProducts = [];
  List<ProductEntity> iceCreamProducts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    
      final allProducts = await dataRepository.getAllProducts();

      setState(() {
        popularProducts = allProducts
            .where((p) => p.category.toLowerCase() == 'vegetables')
            .toList();
        iceCreamProducts = allProducts
            .where((p) => p.category.toLowerCase() == 'ice cream')
            .toList();
        isLoading = false;
      });
    
  }

  Widget buildCategorySection(String title, List<ProductEntity> products) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 220,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Column(
          children: [
            const NameStyle(fontSize: 22),
            const Text(
              "Your Daily Needs",
              style: TextStyle(fontSize: 10, color: Colors.grey),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            AppBar(title: const Text("Menu", style: TextStyle(fontSize: 15))),
            DrawerList(label: "Invited Friend", onPressed: () {}),
            DrawerList(label: "About Us", onPressed: () {}),
            DrawerList(label: "FAQs", onPressed: () {}),
            DrawerList(label: "Terms & Conditions", onPressed: () {}),
            DrawerList(label: "Help Center", onPressed: () {}),
            DrawerList(label: "Rate this App", onPressed: () {}),
            DrawerList(label: "Privacy Policy", onPressed: () {}),
            DrawerList(label: "Contact Us", onPressed: () {}),
            const SizedBox(height: 30),
            DrawerList(label: "Logout", onPressed: () {}),
          ],
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SliderContainer(),
                ),
                buildCategorySection("Popular Packs", popularProducts),
                const SizedBox(height: 10),
                buildCategorySection("Popular Packs", popularProducts),
              ],
            ),
    );
  }
}
