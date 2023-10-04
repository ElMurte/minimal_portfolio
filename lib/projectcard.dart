import 'package:flutter/material.dart';

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
    this.title = defaulttitle,
    this.numberOfPersons = defaultnumberofpersons,
    this.context = defaultcontext,
    this.timeframe = defaulttimeframe,
    this.technology = defaulttechnology,
    this.mainUrlImage = defaultimage,
    this.description = defaultdescription,
  });

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      child: Card(
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
              child: SizedBox(
                // 10% larger than the image

                width: MediaQuery.of(context).size.width * 0.27,
                height: MediaQuery.of(context).size.height * 0.4,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        Colors.blue.withOpacity(!isHovered ? 0.7 : 0),
                        BlendMode.modulate,
                      ),
                      child: Image.network(
                        widget.mainUrlImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
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
