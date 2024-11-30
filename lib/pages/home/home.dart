import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:portfolio/util/widgets/menu.dart';
import 'dart:ui' as ui;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final List<CircleData> circles = [];
  final Random random = Random();
  Timer? timer;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    //Controller
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );

    //Animation
    _animation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: 0.0, end: 1.0),
        weight: 15.0,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 1.0, end: 1.0),
        weight: 70.0,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 1.0, end: 0.0),
        weight: 15.0,
      ),
    ]).animate(_controller);

    //Create First Circle
    _addCircle();

    //Create Second Circle
    Future.delayed(
      Duration(milliseconds: Random().nextInt(500) + 1000),
      _addCircle,
    );

    //Create Third Circle
    Future.delayed(
      Duration(milliseconds: Random().nextInt(500) + 2000),
      _addCircle,
    );

    //Restart Sequence Every 4 Seconds
    timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (circles.length < 3) {
        _addCircle();
      }
    });
  }

  @override
  void dispose() {
    //Dispose Timer & Controller
    timer?.cancel();
    _controller.dispose();

    super.dispose();
  }

  ///Add Circle
  void _addCircle() {
    setState(() {
      circles.add(CircleData(
        left: random.nextDouble(),
        top: random.nextDouble(),
        opacity: 0.6,
        size: random.nextDouble() * 100 + 200,
      ));
    });

    ///Reset & Forward Animation
    _controller
      ..reset()
      ..forward().then((_) {
        setState(() {
          if (circles.isNotEmpty) {
            circles.removeAt(0);
          }
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Animated circles
          ...circles.map((circle) => Positioned(
                left: circle.left *
                    (MediaQuery.of(context).size.width - circle.size),
                top: circle.top *
                    (MediaQuery.of(context).size.height - circle.size),
                child: AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) => Opacity(
                    opacity: _animation.value * circle.opacity,
                    child: ImageFiltered(
                      imageFilter: ui.ImageFilter.blur(
                        sigmaX: 50,
                        sigmaY: 50,
                      ),
                      child: child,
                    ),
                  ),
                  child: Container(
                    width: circle.size,
                    height: circle.size,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          const Color(0xFFE91E63).withOpacity(circle.opacity),
                    ),
                  ),
                ),
              )),

          // Existing text column
          const Positioned(
            right: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Hi! I'm Dan!",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "I'm a Flutter Developer.",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 40),
                Menu(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Add this class at the end of the file
class CircleData {
  final double left;
  final double top;
  final double opacity;
  final double size;

  CircleData({
    required this.left,
    required this.top,
    required this.opacity,
    required this.size,
  });
}
