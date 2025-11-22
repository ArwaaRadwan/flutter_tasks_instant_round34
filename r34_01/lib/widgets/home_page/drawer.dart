import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const DrawerList({required this.label, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 10),
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label),
            IconButton(onPressed: onPressed, icon: Icon(Icons.arrow_forward)),
          ],
        ),
      ),
    );
  }
}
