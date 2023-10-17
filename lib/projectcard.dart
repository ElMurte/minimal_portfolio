import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatefulWidget {
  final String title;
  final String numberOfPersons;
  final String context;
  final String timeframe;
  final List<String> technologies;
  final String mainUrlImage;
  final String description;
  final String repourl;
  final String externalurl;
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
    this.technologies = const [],
    this.mainUrlImage = defaultimage,
    this.description = defaultdescription,
    this.repourl = defaultlink,
    this.externalurl = defaultlink,
  });

  @override
  ProjectCardState createState() => ProjectCardState();
}

class ProjectCardState extends State<ProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isWideScreen = MediaQuery.of(context).size.width > 1100;
    final isTablet = MediaQuery.of(context).size.width > 650 &&
        MediaQuery.of(context).size.width <= 1100;
    final isMobile = MediaQuery.of(context).size.width < 650;
    final double screenwidth = MediaQuery.of(context).size.width;
    List<Widget> descriptions = [
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
      Text(
        widget.description,
        style: const TextStyle(fontSize: 16),
      ),
      const SizedBox(height: 8),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(Icons.code),
          const SizedBox(width: 8),
          Positioned(
            bottom: 0,
            right: 0,
            child: Text(
              widget.technologies.join(", "),
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      const SizedBox(height: 8),
    ];
    List<Widget> imagehovered = [
      Container(
        height: isWideScreen
            ? screenwidth * 0.25
            : isTablet
                ? screenwidth * 0.3
                : screenwidth * 0.3,
        width: isWideScreen ? screenwidth * 0.28 : double.infinity,
        color: Colors.blue,
        child: AnimatedOpacity(
          duration:
              const Duration(milliseconds: 300), // Set your desired duration
          opacity: isHovered ? 1 : 0.4, // Adjust opacity values
          child: Image.network(
            widget.mainUrlImage,
            fit: BoxFit.fill,
          ),
        ),
      ),
      const SizedBox(
        height: 8,
        width: 20,
      ),
    ];

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
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
            onTap: () async {
              //open another browser page with the link
              await launchUrl(Uri.parse(widget.repourl));
            },
            child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(left: 0, bottom: 16),
                child: Card(
                    elevation: 30.0,
                    shadowColor: isHovered
                        ? Colors.blue
                        : Colors.grey.shade500, // Change shadow color on hover
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: isWideScreen
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: isWideScreen
                                ? Row(
                                    children: [
                                      Column(
                                        children: imagehovered,
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: descriptions,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                : Column(
                                    children: [
                                      Column(
                                        children: imagehovered,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: descriptions,
                                      )
                                    ],
                                  ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(children: [
                              Column(
                                children: imagehovered,
                              ),
                              Column(
                                children: descriptions,
                              )
                            ]),
                          )))));
  }
}
