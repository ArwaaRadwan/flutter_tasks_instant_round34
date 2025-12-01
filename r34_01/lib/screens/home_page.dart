import 'package:flutter/material.dart';
import 'package:r34_01/data/data.dart';
import 'package:r34_01/widgets/home_page/drawer.dart';
import 'package:r34_01/widgets/home_page/home_category.dart';
import 'package:r34_01/widgets/home_page/slider.dart';
import 'package:r34_01/widgets/name_style.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SliderContainer(),
            ),

            FutureBuilder(
              future: Data().getAllProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  final products = snapshot.data!;

                  if (products.isNotEmpty) {
                    return HomeCategory(products: products, categoryLabel: "Popular Package");
                  }
                }
                return Center(child: Text("Sorry We Are out of goods. 😊"));
              },
            ),
            FutureBuilder(
              future: Data().getAllProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  final products = snapshot.data!;

                  if (products.isNotEmpty) {
                    return HomeCategory(products: products, categoryLabel: "Popular Package");
                  }
                }
                return Center(child: Text("Sorry We Are out of goods. 😊"));
              },
            ),
          ],
        ),
      ),
    );
  }
}

