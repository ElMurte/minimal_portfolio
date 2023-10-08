import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HoverTextWidget extends StatefulWidget {
  String child;

  HoverTextWidget(this.child, {super.key});
  @override
  HoverTextWidgetState createState() => HoverTextWidgetState();
}

class HoverTextWidgetState extends State<HoverTextWidget> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    Color textColor = isHovered ? Colors.blue : Colors.white;

    return InkWell(
      onTap: () {
        launchUrl(Uri.parse("https://github.com/ElMurte"));
      },
      onHover: (hover) {
        setState(() {
          // Update the hover state
          isHovered = hover;
        });
      },
      child: Text(
        widget.child,
        style: TextStyle(
          color: textColor,
          fontSize: 16,
        ),
      ),
    );
  }
}
