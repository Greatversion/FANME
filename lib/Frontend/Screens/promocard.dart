import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:image_card/image_card.dart';

class PromoCard extends StatelessWidget {
  const PromoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = [
      const CustomCard(
        imageUrl: "assets/commm.png",
        title: "Build Communities",
        desc: "Build and Join Communities all over the world",
      ),
      const CustomCard(
        imageUrl: "assets/logo.png",
        title: "Focus Tools",
        desc: "Use Custom Focus tools",
      ),
      const CustomCard(
        imageUrl: "assets/distraction.png",
        title: "Collaborate and Help Each other",
        desc: "Develop collaborative approach and grow together",
      ),
    ]; // Generate 5 dummy items
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: CarouselSlider(
        items: items,
        options: CarouselOptions(
          height: 200,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          onPageChanged: (index, reason) {
            // Handle page change
          },
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String desc;

  const CustomCard(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TransparentImageCard(
      // color: const Color.fromARGB(255, 69, 69, 69),
      width: 400,
      borderRadius: 10,
      // heightImage: 100,
      imageProvider: AssetImage(imageUrl),
      title: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
      ),
      description: Text(
        desc,
        style: const TextStyle(color: Colors.white, fontSize: 10),
      ),
    );
  }
}
