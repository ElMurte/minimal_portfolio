import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatefulWidget {
  final String title;
  final String numberOfPersons;
  final String context;
  final String timeframe;
  final String technology;
  final String mainUrlImage;
  final String description;

  static const defaulttitle = "Placeholder";
  static const defaultdescription = "Placeholder";
  static const defaultimage = "Placeholder";
  static const defaultlink = "Placeholder";
  static const defaulttechnology = "Placeholder";
  static const defaultcontext = "Placeholder";
  static const defaultnumberofpersons = "Placeholder";
  static const defaulttimeframe = "Placeholder";

  const ProjectCard({
    super.key,
    this.title = defaulttitle,
    this.numberOfPersons = defaultnumberofpersons,
    this.context = defaultcontext,
    this.timeframe = defaulttimeframe,
    this.technology = defaulttechnology,
    this.mainUrlImage = defaultimage,
    this.description = defaultdescription,
  });

  @override
  ProjectCardState createState() => ProjectCardState();
}

Future<void> _launchUrl() async {
  final Uri url = Uri.parse('https://flutter.dev');

  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw Exception('Could not launch $url');
  }
}

class ProjectCardState extends State<ProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      child: Card(
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
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
                  //open another browser page with the link
                  await _launchUrl();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.27,
                  height: MediaQuery.of(context).size.height * 0.4,
                  color: Colors.blue,
                  child: AnimatedOpacity(
                    duration: const Duration(
                        milliseconds: 300), // Set your desired duration
                    opacity: isHovered ? 1 : 0.4, // Adjust opacity values
                    child: Image.network(
                      widget.mainUrlImage,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Number of persons: ${widget.numberOfPersons}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  'Context: ${widget.context}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  'Timeframe: ${widget.timeframe}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.network(
                      'https://cdn.iconscout.com/icon/free/png-256/flutter-2038877-1720090.png',
                      height: 24,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      widget.technology,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}