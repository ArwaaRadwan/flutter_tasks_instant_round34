import 'package:flutter/material.dart';

class ContainerHome extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color containerColor;
  final Color titleColor;
  final Color subTitleColor;
  final String image;
  final Color buttomColor;
  final Color textButtomColor;
  const ContainerHome({
    super.key,
    required this.title,
    required this.subtitle,
    required this.containerColor,
    required this.titleColor,
    required this.subTitleColor,
    required this.image,
    required this.buttomColor,
    required this.textButtomColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Container(
          // width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: containerColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: titleColor,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(fontSize: 13, color: subTitleColor),
                      ),
                      SizedBox(
                        height: 30,
                        width: 97,
                        child: Card(
                          color: buttomColor,
                          child: Text(
                            "Shop Now",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: textButtomColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset(image, height: 100),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
