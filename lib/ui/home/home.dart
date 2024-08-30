import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  final List<String> imagesPath = const [
    'assets/images/bob1.jfif',
    'assets/images/bob2.jfif',
    'assets/images/bob4.jfif',
    'assets/images/bob5.jfif',
    'assets/images/bob3.jfif',
    'assets/images/bob4.jfif',
  ];
  Future<void> _handleRefresh() async {
    return await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LiquidPullToRefresh(
      color: Colors.blueGrey,
      height: 150,
      animSpeedFactor: 3,
      // showChildOpacityTransition: ture,
      backgroundColor: Colors.yellow,
      onRefresh: _handleRefresh,
      child: ListView.builder(
        itemCount: imagesPath.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Container(
              height: 200,
              child: Image.asset(
                imagesPath[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    ));
  }
}
