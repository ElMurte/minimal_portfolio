// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:minimal_portfolio/skilllist.dart';

class ImageWithMisalignedSquareEffect extends StatefulWidget {
  const ImageWithMisalignedSquareEffect({super.key});

  @override
  ImageWithMisalignedSquareEffectState createState() =>
      ImageWithMisalignedSquareEffectState();
}

class ImageWithMisalignedSquareEffectState
    extends State<ImageWithMisalignedSquareEffect> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    double imagesizeandsquare = MediaQuery.of(context).size.width > 600
        ? MediaQuery.of(context).size.width * 0.15
        : MediaQuery.of(context).size.width * 0.5;
    double wrappersize = MediaQuery.of(context).size.width > 600
        ? MediaQuery.of(context).size.width * 0.15 +
            ((MediaQuery.of(context).size.width * 0.15) * 0.3)
        : MediaQuery.of(context).size.width * 0.5 +
            ((MediaQuery.of(context).size.width * 0.5) * 0.3);
    double squarepositiontop = imagesizeandsquare * 0.1;
    double squarepositionright = imagesizeandsquare * 0.1;
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
          SizedBox(
            width: wrappersize, // 10% larger than the image
            height: wrappersize, // 10% larger than the image
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Misaligned Square with Transition
                Positioned(
                  right:
                      squarepositionright, // 10% from the right of the wrapper
                  top: squarepositiontop, // 10% from the top of the wrapper
                  child: AnimatedContainer(
                    duration: const Duration(
                        milliseconds: 300), // Adjust the duration
                    transform: isHovered
                        ? Matrix4.translationValues(10.0, 0.0, 0.0)
                        : Matrix4.translationValues(0.0, 0.0, 0.0),
                    width: imagesizeandsquare, // Same size as the wrapper
                    height: imagesizeandsquare, // Same size as the wrapper
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
                  color: (MediaQuery.of(context).size.width > 1100)
                      ? !isHovered
                          ? Colors.blue
                          : Colors.transparent
                      : Colors.transparent,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    transform: isHovered
                        ? Matrix4.translationValues(-20.0, -20.0, 0.0)
                        : Matrix4.translationValues(0.0, 0.0, 0.0),
                    width: imagesizeandsquare,
                    height: imagesizeandsquare,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: isHovered
                          ? 1
                          : MediaQuery.of(context).size.width > 1100
                              ? 0.5
                              : 1, // Adjust the opacity
                      child: Image.network(
                        'https://avatars.githubusercontent.com/u/32709092',
                        fit: BoxFit.cover,
                        width: imagesizeandsquare,
                        height: imagesizeandsquare,
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
  const AboutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double paddingSize = MediaQuery.of(context).size.width > 600
        ? MediaQuery.of(context).size.width * 0.1
        : 40.0;
    double marginSize = MediaQuery.of(context).size.width > 600
        ? MediaQuery.of(context).size.width * 0.12
        : 0.0;

    return RepaintBoundary(
      child: SelectionArea(
        child: Container(
          margin: EdgeInsets.all(marginSize),
          padding: EdgeInsets.only(left: paddingSize, right: paddingSize),
          child: Column(
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
                  const Flexible(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'I am Elvis Murtezan, a Software Developer.\nMy journey in software development born in my childhood from the passion for videogames, now is driven by my genuine passion for problem-solving and technology.\n\nI approach every challenge with solid determination, whether it\'s an individual problem I\'m tackling or a collaborative effort within a team.',
                            style: TextStyle(
                              fontSize: 19.0,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Currently, I\'m contributing in the dynamic field of air transport.\nHere are some of the most recent technologies I\'ve worked with:',
                            style: TextStyle(
                              fontSize: 19.0,
                            ),
                          ),
                          SizedBox(height: 16),
                          SkillsList([
                            'Azure',
                            'Python',
                            'Kubernetes',
                            'Containers',
                            'Flutter',
                            'SQL',
                          ])
                        ],
                      ),
                    ),
                  ),
                  // Right side: Image
                  if (MediaQuery.of(context).size.width > 600)
                    const ImageWithMisalignedSquareEffect(),
                ],
              ),
              if (MediaQuery.of(context).size.width < 600)
                const ImageWithMisalignedSquareEffect(),
            ],
          ),
        ),
      ),
    );
  }
}
