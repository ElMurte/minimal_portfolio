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
  @override
  _AnimatedBackgroundState createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late BackgroundAnimation animation;

  @override
  void initState() {
    super.initState();
    animation = BackgroundAnimation(
      AnimationController(
        vsync: this,
        duration: Duration(seconds: 5), // Adjust the duration as needed
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
                  animationValue: animation.animation.value,
                  color: Theme.of(context).primaryColorDark,
                  shape: BoxShape.circle,
                ),
              ),
              Positioned(
                left: 50.0,
                top: MediaQuery.of(context).size.height * 0.6,
                child: AnimatedShape(
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
                  animationValue: animation.animation.value,
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                ),
              ),
              Positioned(
                right: 50.0,
                top: MediaQuery.of(context).size.height * 0.5,
                child: AnimatedShape(
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

  AnimatedShape({
    required this.animationValue,
    required this.color,
    required this.shape,
  });

  @override
  Widget build(BuildContext context) {
    double widthm = MediaQuery.of(context).size.width;
    double heightm = MediaQuery.of(context).size.height;
    return Transform.translate(
      offset: Offset(0,
          50 * (1 - animationValue)), // Adjust the offset for animation effect
      child: Container(
        width: widthm * 0.05,
        height: widthm * 0.05,
        decoration: BoxDecoration(
          color: color,
          shape: shape,
        ),
      ),
    );
  }
}
