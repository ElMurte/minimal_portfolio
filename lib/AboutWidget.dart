import 'package:flutter/material.dart';

class ImageWithMisalignedSquareEffect extends StatefulWidget {
  @override
  _ImageWithMisalignedSquareEffectState createState() =>
      _ImageWithMisalignedSquareEffectState();
}

class _ImageWithMisalignedSquareEffectState
    extends State<ImageWithMisalignedSquareEffect> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Wrapper for Image and Square
          Container(
            width: 220.0, // 10% larger than the image
            height: 220.0, // 10% larger than the image
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Misaligned Square with Transition
                Positioned(
                  right: 20.0, // 10% from the right of the wrapper
                  top: 20.0, // 10% from the top of the wrapper
                  child: AnimatedContainer(
                    duration: const Duration(
                        milliseconds: 300), // Adjust the duration
                    transform: isHovered
                        ? Matrix4.translationValues(10.0, 0.0, 0.0)
                        : Matrix4.translationValues(0.0, 0.0, 0.0),
                    width: 200.0, // Same size as the wrapper
                    height: 200.0, // Same size as the wrapper
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                        width: 2.0, // Adjust the border width
                      ),
                    ),
                  ),
                ),
                // Image with Hover Effect and Positioning
                Container(
                  color: (!isHovered) ? Colors.blue : Colors.transparent,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    transform: isHovered
                        ? Matrix4.translationValues(-10.0, -10.0, 0.0)
                        : Matrix4.translationValues(0.0, 0.0, 0.0),
                    width: 200.0,
                    height: 200.0,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: isHovered ? 1 : 0.5, // Adjust the opacity
                      child: Image.network(
                        'https://avatars.githubusercontent.com/u/32709092',
                        fit: BoxFit.cover,
                        width: 200.0,
                        height: 200.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AboutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Key _projectsKey = GlobalKey();
    double padding_size = MediaQuery.of(context).size.width > 600
        ? MediaQuery.of(context).size.width * 0.1
        : 40.0;
    double margin_size = MediaQuery.of(context).size.width > 600
        ? MediaQuery.of(context).size.width * 0.12
        : 0.0;

    return Container(
      padding: EdgeInsets.all(padding_size),
      margin: EdgeInsets.only(left: margin_size, right: margin_size),
      child: Column(
        key: _projectsKey,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Row(children: <Widget>[
            Text(
              'About',
              style: TextStyle(fontSize: 32),
            ),
            SizedBox(width: 16),
          ]),
          Row(
            children: <Widget>[
              // Left side: Description
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'Hi again, I\'m Elvis Murtezan, an Associate Software Developer.\n My journey in software development born in my childhood from the passion for videogames, now is driven by my genuine passion for problem-solving and technology.I approach every challenge with solid determination, whether it\'s an individual problem I\'m tackling or a collaborative effort within a team.',
                        style: TextStyle(
                          fontSize: 19.0,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Currently, I\'m contributing in the dynamic field of air transport. Here are some of the most recent technologies I\'ve worked with:',
                        style: TextStyle(
                          fontSize: 19.0,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        ' List the technologies here.',
                        style: TextStyle(
                          fontSize: 19.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Right side: Image
              Container(
                child: ImageWithMisalignedSquareEffect(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
