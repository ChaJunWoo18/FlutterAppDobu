import 'package:flutter/material.dart';
import 'package:prob/widgets/home_body.dart';
import 'package:prob/widgets/home_header.dart';
import 'package:prob/widgets/total_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeHeader(),
            SizedBox(
              height: 15,
            ),
            TotalCard(),
            SizedBox(
              height: 25,
            ),
            HomeBody(),
          ],
        ),
      ),
    );
  }
}
