import 'package:flutter/material.dart';

class SkillsList extends StatelessWidget {
  final List<String> skills;

  const SkillsList(this.skills, {super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    int numberOfColumns;
    double columnSpacing = 8.0; // Adjust the spacing between columns
    double itemSpacing = 4.0; // Adjust the spacing between list items

    if (screenWidth >= 600) {
      numberOfColumns = 3; // For larger screens, display 3 columns
    } else {
      numberOfColumns =
          1; // For smaller screens (e.g., mobile), display 1 column
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List<Widget>.generate(
        (skills.length / numberOfColumns).ceil(),
        (int columnIndex) {
          final int startIndex = columnIndex * numberOfColumns;
          final int endIndex = (columnIndex + 1) * numberOfColumns;
          return Row(
            children: skills
                .sublist(startIndex, endIndex)
                .map((skill) => Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(0), // Adjust item spacing
                        child: ListTile(
                          leading: const Icon(Icons.brightness_1,
                              size: 8), // Bullet point icon
                          title: Text(
                            skill,
                            style: const TextStyle(
                              fontSize: 19.0,
                            ),
                          ),
                        ),
                      ),
                    ))
                .toList(),
          );
        },
      ),
    );
  }
}
