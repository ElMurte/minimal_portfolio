import 'package:flutter/material.dart';

class BackgroundAnimation {
  final AnimationController controller;
  final Animation<double> animation;

  BackgroundAnimation(this.controller)
      : animation = Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(controller);
}

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key});

  @override
  AnimatedBackgroundState createState() => AnimatedBackgroundState();
}

class AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late BackgroundAnimation animation;

  @override
  void initState() {
    super.initState();
    animation = BackgroundAnimation(
      AnimationController(
        vsync: this,
        duration: const Duration(seconds: 5), // Adjust the duration as needed
      )..repeat(reverse: true),
    );
  }

  @override
  void dispose() {
    animation.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation.animation,
      builder: (context, child) {
        return Container(
          color: Colors.transparent, // Transparent background
          child: Stack(
            children: [
              // Shapes on the left side
              Positioned(
                left: 0.0,
                top: MediaQuery.of(context).size.height * 0.3,
                child: AnimatedShape(
                  rotationSpeed: 1,
                  animationValue: animation.animation.value,
                  color: Theme.of(context).primaryColorDark,
                  shape: BoxShape.circle,
                ),
              ),
              Positioned(
                left: 50.0,
                top: MediaQuery.of(context).size.height * 0.6,
                child: AnimatedShape(
                  rotationSpeed: 1,
                  animationValue: animation.animation.value,
                  color: Colors.blue,
                  shape: BoxShape.rectangle, // Square
                ),
              ),

              // Shapes on the right side
              Positioned(
                right: 0.0,
                top: MediaQuery.of(context).size.height * 0.2,
                child: AnimatedShape(
                  rotationSpeed: 1,
                  animationValue: animation.animation.value,
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                ),
              ),
              Positioned(
                right: 50.0,
                top: MediaQuery.of(context).size.height * 0.5,
                child: AnimatedShape(
                  rotationSpeed: 0.5,
                  animationValue: animation.animation.value,
                  color: Theme.of(context).primaryColorDark,
                  shape: BoxShape.rectangle, // Square
                ),
              ),
              // Add more shapes as needed
            ],
          ),
        );
      },
    );
  }
}

class AnimatedShape extends StatelessWidget {
  final double animationValue;
  final Color color;
  final BoxShape shape;
  final double rotationSpeed; // Add a rotation speed for each shape

  const AnimatedShape({
    super.key,
    required this.animationValue,
    required this.color,
    required this.shape,
    required this.rotationSpeed,
  });

  @override
  Widget build(BuildContext context) {
    double widthm = MediaQuery.of(context).size.width;
    return Transform.translate(
      offset: Offset(0, 50 * (1 - animationValue)),
      child: Transform(
        transform: Matrix4.rotationY(2 * 3.14159265359 * animationValue) *
            Matrix4.rotationZ(
                2 * 3.14159265359 * animationValue * rotationSpeed),
        alignment: Alignment.center,
        child: Container(
          width: widthm * 0.05,
          height: widthm * 0.05,
          decoration: BoxDecoration(
            color: color,
            shape: shape,
          ),
        ),
      ),
    );
  }
}

class StaticBackground extends StatelessWidget {
  const StaticBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent, // Transparent background
      child: Stack(
        children: [
          // Shapes on the left side
          Positioned(
            left: 0.0,
            top: MediaQuery.of(context).size.height * 0.3,
            child: StaticShape(
              color: Theme.of(context).primaryColorDark,
              shape: BoxShape.circle,
            ),
          ),
          Positioned(
            left: 50.0,
            top: MediaQuery.of(context).size.height * 0.6,
            child: const StaticShape(
              color: Colors.blue,
              shape: BoxShape.rectangle, // Square
            ),
          ),

          // Shapes on the right side
          Positioned(
            right: 0.0,
            top: MediaQuery.of(context).size.height * 0.2,
            child: StaticShape(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle,
            ),
          ),
          Positioned(
            right: 50.0,
            top: MediaQuery.of(context).size.height * 0.5,
            child: StaticShape(
              color: Theme.of(context).primaryColorDark,
              shape: BoxShape.rectangle, // Square
            ),
          ),
          // Add more shapes as needed
        ],
      ),
    );
  }
}

class StaticShape extends StatelessWidget {
  final Color color;
  final BoxShape shape;

  const StaticShape({
    super.key,
    required this.color,
    required this.shape,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.05,
      height: width * 0.05,
      decoration: BoxDecoration(
        color: color,
        shape: shape,
      ),
    );
  }
}
