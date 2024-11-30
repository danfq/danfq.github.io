import 'package:flutter/material.dart';
import 'package:portfolio/util/widgets/menu.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    //Circle Size
    final circleSize = (MediaQuery.of(context).size.height - 100) / 2;

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 50,
            top: (MediaQuery.of(context).size.height - circleSize) / 2,
            child: Container(
              width: circleSize,
              height: circleSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFE91E63).withOpacity(0.8),
              ),
            ),
          ),
          Positioned(
            left: 250,
            top: (MediaQuery.of(context).size.height - circleSize) / 2,
            child: Container(
              width: circleSize,
              height: circleSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFE91E63).withOpacity(0.5),
              ),
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Hello
              Text(
                "Hi! I'm Dan!",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),

              //Spacing
              SizedBox(height: 20),

              //Flutter Developer
              Text(
                "I'm a Flutter Developer.",
                style: TextStyle(fontSize: 20),
              ),

              //Spacing
              SizedBox(height: 40),

              //Menu
              Menu(),
            ],
          ),
        ],
      ),
    );
  }
}
