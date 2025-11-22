import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:r34_01/screens/home_page.dart';


class EntryPointUi extends StatefulWidget {
  const EntryPointUi({super.key});

  @override
  State<EntryPointUi> createState() => _EntryPointUiState();
}

class _EntryPointUiState extends State<EntryPointUi> {
  int _selectedIndex = 0;

  // صفحات التطبيق
  final List<Widget> _pages = [
    const HomePage(),
    // const SavePage(),
    // const CartPage(),
    // const ProfilePage(),
    // const MenuPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: ConvexAppBar(
        height: 46,
        backgroundColor: Colors.green,
        color: Colors.white,
        activeColor: Colors.white,
        style: TabStyle.fixed,
        initialActiveIndex: _selectedIndex,
        items: const [
          TabItem(icon: Icons.home_outlined, title: 'Home'),
          TabItem(icon: Icons.favorite_border, title: 'Save'),
          TabItem(icon: Icons.shopping_cart, title: 'Cart'),
          TabItem(icon: Icons.person_outline, title: 'Profile'),
          TabItem(icon: Icons.menu, title: 'Menu'),
        ],
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
