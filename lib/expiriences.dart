import 'package:flutter/material.dart';
import 'package:minimal_portfolio/experiencecard.dart';

class ExperienceWidget extends StatefulWidget {
  const ExperienceWidget({Key? key}) : super(key: key);

  @override
  ExperienceWidgetState createState() => ExperienceWidgetState();
}

class ExperienceWidgetState extends State<ExperienceWidget> {
  int selectedTabIndex = 0; // Track the selected tab index

  @override
  Widget build(BuildContext context) {
    final isWideScreen = MediaQuery.of(context).size.width > 600;
    double paddingSize = MediaQuery.of(context).size.width > 600
        ? MediaQuery.of(context).size.width * 0.1
        : 40.0;
    double marginSize = MediaQuery.of(context).size.width > 600
        ? MediaQuery.of(context).size.width * 0.12
        : 0.0;
    return Container(
      height: MediaQuery.of(context).size.width * 0.3,
      margin: EdgeInsets.only(left: marginSize, right: marginSize),
      padding: EdgeInsets.all(paddingSize * 0.3),
      child: isWideScreen
          ? Row(
              children: [
                // Menu (Left side on web)
                Container(
                  width: 160, // Set the fixed width for the menu
                  child: ListView(
                    // Use ListView for fixed menu
                    // Your menu items go here
                    children: [
                      // Menu item 1
                      ListTile(
                        title: const Text('SITA'),
                        onTap: () {
                          // Handle menu item 1 click
                          setState(() {
                            selectedTabIndex = 0;
                          });
                        },
                        selected: selectedTabIndex == 0,
                      ),
                      // Menu item 2
                      ListTile(
                        title: const Text('Methode Srl'),
                        onTap: () {
                          // Handle menu item 2 click
                          setState(() {
                            selectedTabIndex = 1;
                          });
                        },
                        selected: selectedTabIndex == 1,
                      ),
                      // Add more menu items as needed
                    ],
                  ),
                ),
                // Content (Right side on web)
                Container(
                  width: 300,
                  child: Expanded(
                    child: SingleChildScrollView(
                      // Use SingleChildScrollView for fixed content
                      child: Column(
                        // Your content goes here
                        children: [
                          // Content section 1
                          if (selectedTabIndex == 0)
                            ExperienceCard(
                              experience: Experience(
                                role: "Web Developer",
                                date: '2022 - Present',
                                description: 'Developing web applications...',
                              ),
                            ),
                          // Content section 2
                          if (selectedTabIndex == 1)
                            ExperienceCard(
                              experience: Experience(
                                role: "Mobile Developer",
                                date: '2020 - 2022',
                                description:
                                    'Creating mobile apps...\n\n\n\n\n\n\n\sdad',
                              ),
                            ),
                          // Add more content sections as needed
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Column(
              children: [
                // Menu (Top on mobile)
                Container(
                  // Set the fixed height for the menu
                  height: 80,
                  child: Row(
                    // Your mobile menu items go here
                    children: [
                      // Mobile menu item 1
                      IconButton(
                        icon: const Icon(Icons.home),
                        onPressed: () {
                          // Handle menu item 1 click
                          setState(() {
                            selectedTabIndex = 0;
                          });
                        },
                        color: selectedTabIndex == 0
                            ? Colors.blue // Highlight the selected tab
                            : Colors.black,
                      ),
                      // Mobile menu item 2
                      IconButton(
                        icon: const Icon(Icons.work),
                        onPressed: () {
                          // Handle menu item 2 click
                          setState(() {
                            selectedTabIndex = 1;
                          });
                        },
                        color: selectedTabIndex == 1
                            ? Colors.blue // Highlight the selected tab
                            : Colors.black,
                      ),
                      // Add more mobile menu items as needed
                    ],
                  ),
                ),
                // Content (Under the menu on mobile)
                SingleChildScrollView(
                  // Use SingleChildScrollView for fixed content
                  child: Column(
                    // Your content goes here
                    children: [
                      // Content section 1
                      if (selectedTabIndex == 0)
                        ExperienceCard(
                          experience: Experience(
                            role: 'Web Developer',
                            date: '2022 - Present',
                            description: 'Developing web applications...',
                          ),
                        ),
                      // Content section 2
                      if (selectedTabIndex == 1)
                        ExperienceCard(
                          experience: Experience(
                            role: 'Mobile Developer',
                            date: '2020 - 2022',
                            description: 'Creating mobile apps...',
                          ),
                        ),
                      // Add more content sections as needed
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
