import 'package:fanme/Frontend/Reusable-frontEnd/card.dart';
import 'package:flutter/material.dart';

class CardListView extends StatelessWidget {
  const CardListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, bottom: 15.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.23,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: const [
            HorizontalCard("Sumit", "assets/dummy.png", "2 connections"),
            HorizontalCard("Ashish ", "assets/dummy.png", "11 connections"),
            HorizontalCard("Arjun ", "assets/dummy.png", "7 connections"),
            HorizontalCard("Ayushii ", "assets/dummy.png", "8 connections"),
            HorizontalCard("Jyoti", "assets/dummy.png", "14 connections"),
            HorizontalCard("Arti", "assets/dummy.png", "4 connections"),
          ],
        ),
      ),
    );
  }
}

class CardListView2 extends StatelessWidget {
  const CardListView2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
      // ignore: sized_box_for_whitespace
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 200,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: const [
            VerticalCard("UrbanCommunity", "assets/crowd.png", "40 members"),
            VerticalCard("TurboGroup", "assets/crowd.png", "8 members"),
            VerticalCard("TurboGroup", "assets/crowd.png", "8 members"),
            VerticalCard("TurboGroup", "assets/crowd.png", "8 members"),

            // VerticalCard("SLearnings", "assets/crowd.png", "100 members"),
          ],
        ),
      ),
    );
  }
}
