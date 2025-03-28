// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SecondaryProjectCard extends StatefulWidget {
  final String title;
  final List<String> maintechnologies;
  final int num_of_people;
  final String context_of_project;
  final String description;
  //final imageurl;
  final String repourl;
  //final liveurl;
  const SecondaryProjectCard(
      {super.key,
      this.title = "Title",
      this.context_of_project = "Side project",
      this.description = "",
      this.num_of_people = 1,
      this.maintechnologies = const [],
      this.repourl = ""});

  @override
  SecondaryProjectCardState createState() => SecondaryProjectCardState();
}

class SecondaryProjectCardState extends State<SecondaryProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    //final isWideScreen = MediaQuery.of(context).size.width > 1100;
    //final isTablet = MediaQuery.of(context).size.width > 650 &&
    //    MediaQuery.of(context).size.width <= 1100;
    //final isMobile = MediaQuery.of(context).size.width < 650;
    //final screenwidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        launchUrl(Uri.parse(widget.repourl));
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
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
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          transform: isHovered
              ? Matrix4.translationValues(0, -10, 0)
              : Matrix4.identity(),
          child: Container(
            width: MediaQuery.of(context).size.width > 1100
                ? MediaQuery.of(context).size.width * 0.23
                : MediaQuery.of(context).size.width * 0.95,
            height: 360,
            margin: const EdgeInsets.only(bottom: 16),
            child: Card(
              elevation: 30.0, color: Theme.of(context).scaffoldBackgroundColor,

              shadowColor: isHovered
                  ? Colors.blue
                  : Colors.grey.shade500, // Change shadow color on hover
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width > 1100
                          ? MediaQuery.of(context).size.width * 0.18
                          : MediaQuery.of(context).size.width * 0.6,
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.title,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: isHovered
                                      ? Colors.blue
                                      : Colors.grey
                                          .shade500, // Change title text color on hover
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Text(
                                    widget.num_of_people.toString(),
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Icon(Icons.people),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    widget.context_of_project,
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width >
                                                    1100
                                                ? 18
                                                : 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const Icon(Icons.topic),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                widget.description,
                                style: const TextStyle(fontSize: 19),
                              ),
                              const SizedBox(height: 16),
                            ],
                          ),
                          Positioned(
                            bottom: 0,
                            child: Row(
                              children: [
                                const Icon(Icons.code),
                                Text(
                                  // ignore: prefer_interpolation_to_compose_strings
                                  " " + widget.maintechnologies.join(", "),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          const Positioned(
                              top: 0, right: 0, child: Icon(Icons.link))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
