import 'package:flutter/material.dart';

class SecondaryProjectCard extends StatefulWidget {
  const SecondaryProjectCard({Key? key}) : super(key: key);

  @override
  SecondaryProjectCardState createState() => SecondaryProjectCardState();
}

class SecondaryProjectCardState extends State<SecondaryProjectCard> {
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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: isHovered
            ? Matrix4.translationValues(0, -5, 0)
            : Matrix4.identity(),
        child: Container(
          width: MediaQuery.of(context).size.width > 600
              ? MediaQuery.of(context).size.width * 0.25
              : MediaQuery.of(context).size.width * 0.8,
          height: 360,
          padding: const EdgeInsets.all(18),
          margin: const EdgeInsets.only(bottom: 16),
          child: Card(
            elevation: 10.0,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Project Title',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: isHovered
                              ? Colors.blue
                              : Colors.grey
                                  .shade500, // Change title text color on hover
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Project Description',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Project Description',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Project Description',
                        style: TextStyle(fontSize: 19),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
