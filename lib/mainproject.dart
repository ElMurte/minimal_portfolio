import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MainProjectWidget extends StatefulWidget {
  final String imageUrl;
  final String playStoreUrl;
  final String bookDescription;
  final String appDescription;

  const MainProjectWidget({
    super.key,
    required this.imageUrl,
    required this.playStoreUrl,
    required this.bookDescription,
    required this.appDescription,
  });

  @override
  MainProjectWidgetState createState() => MainProjectWidgetState();
}

class MainProjectWidgetState extends State<MainProjectWidget> {
  bool isHovered = false;
  String cppurl = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Card(
        elevation: isHovered ? 8 : 2, // Apply elevation on hover
        child: Stack(
          children: [
            MouseRegion(
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
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () async {
                  // Open another browser page with the link
                  await _launchUrl();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.5,
                  color: !isHovered ? Colors.blue : Colors.grey[300],

                  // Apply hover effect

                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: isHovered
                        ? 1
                        : MediaQuery.of(context).size.width > 1100
                            ? 0.7
                            : 1,
                    child: ClipRect(
                      child: Image.network(
                        widget.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    /*Text(
                      widget.bookDescription,
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.visible, // Allow text to overflow
                    ),*/
                    const SizedBox(height: 8),
                    Text(
                      widget.appDescription,
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.visible, // Allow text to overflow
                    ),
                    const SizedBox(height: 8),
                    /*SizedBox(
                      width: 75,
                      height: 75,
                      child: Image.network(
                        widget.playStoreUrl,
                        fit: BoxFit.cover,
                      ),
                    ),*/
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _launchUrl() async {
  final Uri url = Uri.parse('https://www.flutter.dev');

  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw Exception('Could not launch $url');
  }
}
