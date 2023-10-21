import 'package:flutter/material.dart';

class Experience {
  final String role;
  final String date;
  final String description;

  Experience({
    required this.role,
    required this.date,
    required this.description,
  });
}

class ExperienceCard extends StatelessWidget {
  final Experience experience;

  const ExperienceCard({super.key, required this.experience});

  @override
  Widget build(BuildContext context) {
    //final isWideScreen = MediaQuery.of(context).size.width > 1100;
    //final isTablet = MediaQuery.of(context).size.width > 650 &&
    //  MediaQuery.of(context).size.width <= 1100;
    //final isMobile = MediaQuery.of(context).size.width < 650;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              experience.role,
              style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline),
            ),
            const SizedBox(height: 8),
            Text(
              'Date: ${experience.date}',
              style: const TextStyle(
                fontSize: 18.0,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                'Description:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                experience.description,
                style: const TextStyle(
                  fontSize: 17.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
