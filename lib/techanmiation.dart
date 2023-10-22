import 'dart:math';
import 'package:flutter/material.dart';

class RotatingClockCircular3DImages extends StatefulWidget {
  const RotatingClockCircular3DImages({super.key});

  @override
  RotatingClockCircular3DImagesState createState() =>
      RotatingClockCircular3DImagesState();
}

class RotatingClockCircular3DImagesState
    extends State<RotatingClockCircular3DImages> with TickerProviderStateMixin {
  late AnimationController _rotationController;
  List<Image> icons = [
    Image.network(
      "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Python-logo-notext.svg/1280px-Python-logo-notext.svg.png",
      width: 45,
      height: 45.0, // Limit the height to 50 pixels.
    ),
    Image.network(
      "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Microsoft_Azure.svg/1200px-Microsoft_Azure.svg.png",
      width: 45,
      height: 45.0, // Limit the height to 50 pixels.
    ),
    Image.network(
      "https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/Kubernetes_logo_without_workmark.svg/168px-Kubernetes_logo_without_workmark.svg.png",
      width: 45,
      height: 45.0, // Limit the height to 50 pixels.
    ),
    Image.network(
      "https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png",
      width: 45,
      height: 45.0, // Limit the height to 50 pixels.
    ),
    Image.network(
      "https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/ISO_C%2B%2B_Logo.svg/1280px-ISO_C%2B%2B_Logo.svg.png",
      width: 45,
      height: 45.0, // Limit the height to 50 pixels.
    ),
    Image.network(
      "https://upload.wikimedia.org/wikipedia/commons/3/3b/Javascript_Logo.png",
      width: 45,
      height: 45.0, // Limit the height to 50 pixels.
    ),
  ];

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10), // Adjust duration as needed
    )..repeat();
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _rotationController,
      builder: (context, child) {
        return Stack(
          children: [
            for (int i = 0; i < icons.length; i++)
              Positioned(
                top: MediaQuery.of(context).size.height / 4 -
                    45.0 / 2 -
                    100.0 *
                        sin(i * pi / 3 - _rotationController.value * 2 * pi),
                right: MediaQuery.of(context).size.width / 4 -
                    45.0 / 2 +
                    100.0 * cos(i * pi / 3),
                child: Transform.rotate(
                  angle: _rotationController.value * 2 * pi,
                  child: Transform.rotate(
                    angle: i * pi / 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: icons[i],
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
