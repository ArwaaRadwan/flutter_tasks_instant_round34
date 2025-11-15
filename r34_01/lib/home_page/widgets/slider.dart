import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:r34_01/home_page/widgets/container_home.dart';

class SliderContainer extends StatefulWidget {
  const SliderContainer({super.key});

  @override
  State<SliderContainer> createState() => _SliderContainerState();
}

class _SliderContainerState extends State<SliderContainer> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        ContainerHome(
          title: "Up to 30% offer",
          subtitle: "Enjoy our big offer",
          image: "assets/images/image 3.png",
          buttomColor: Colors.green,
          containerColor: Color(0xffCFF6CD),
          titleColor: Colors.black,
          subTitleColor: Colors.green,
          textButtomColor: Colors.white,
        ),
        ContainerHome(
          title: "Up to 25% offer",
          subtitle: "On first buyers",
          image: "assets/images/image 4.png",
          buttomColor: Colors.white,
          containerColor: Colors.green,
          titleColor: Colors.white,
          subTitleColor: Colors.white,
          textButtomColor: Colors.black,
        ),
        ContainerHome(
          title: "Get Same Day Deliver",
          subtitle: "On orders above \$20",
          image: "assets/images/image 5.png",
          buttomColor: Colors.white,
          containerColor: Color(0xffF6D323),
          titleColor: Colors.black,
          subTitleColor: Colors.black,
          textButtomColor: Colors.black,
        ),

      ],

      options: CarouselOptions(
        height: 120,
        aspectRatio: 1,
        viewportFraction: 0.75,
        autoPlay: true,
        autoPlayAnimationDuration: Duration(seconds: 5),
        autoPlayInterval: Duration(seconds: 5),
        enlargeCenterPage: true,
        autoPlayCurve: Curves.linear,
      ),
    );
  }
}
