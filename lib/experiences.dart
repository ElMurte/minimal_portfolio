import 'package:flutter/material.dart';
import 'package:minimal_portfolio/experiencecard.dart';

class ExperienceWidget extends StatefulWidget {
  const ExperienceWidget({super.key});

  @override
  ExperienceWidgetState createState() => ExperienceWidgetState();
}

class ExperienceWidgetState extends State<ExperienceWidget> {
  int selectedTabIndex = 0; // Track the selected tab index
  ExperienceCard? experienceCardsita0 = ExperienceCard(
      experience: Experience(
          role: 'Associate Software Developer',
          date: 'November 2023 - now',
          description:
              '''Contributing to the Passenger portfolio:\n• as a BI dev: engage in data engineering, analysis, modeling, development, and test
ing. I contribute to our insights solutions(Passenger Intelligent Insights),from data warehouse to reports, and dashboards. Working together with the team, we ensure our product remains adaptable to the evolving needs of airport stakeholders, consistently delivering valuable solutions.
 • as a Frontend dev: develop and maintain a Flutter-based app(Passenger validation)''',
          skills: [
        'SQL',
        'Python',
        'Azure',
        'Power BI',
        'Data Factory',
        'ETL',
        'Agile',
        'Flutter',
        'Containers',
      ]));
  ExperienceCard? experienceCardsita1 = ExperienceCard(
      experience: Experience(
          role: 'Junior Software engineer',
          date: 'November 2022 - November 2023',
          description:
              'Contributing with many different technologies(frontend/backend), within an Agile environment using:\n Azure, Power Apps, Flutter, Power BI, Containers, Python, ETL(data factory)',
          skills: [
        'SQL',
        'Python',
        'Azure',
        'Power BI',
        'Data Factory',
        'ETL',
        'Agile'
      ]));
  ExperienceCard? experienceCardmethode0 = ExperienceCard(
      experience: Experience(
          role: 'Intern Software Developer',
          date: 'June 2021 - August 2021',
          description:
              'I have worked in an Agile environment and given my contribution as a Full-stack developer for a total of 320 hours, working on:\n• frontend: development of UI components during short sprints(Scrum) with React.js and Redux as a state management\n• backend: development of REST API and data entry services with Azure platform following using Typescript and third-party libraries selected from the npm register'));
  @override
  Widget build(BuildContext context) {
    final isWideScreen = MediaQuery.of(context).size.width > 1100;
    //final isTablet = MediaQuery.of(context).size.width > 650 &&
    //  MediaQuery.of(context).size.width <= 1100;
    //final isMobile = MediaQuery.of(context).size.width < 650;
    double paddingSize =
        isWideScreen ? MediaQuery.of(context).size.width * 0.1 : 20.0;
    double marginSize =
        isWideScreen ? MediaQuery.of(context).size.width * 0.1 : 0.0;

    Widget experiencesmenu = SizedBox(
      width: MediaQuery.of(context).size.width > 1100
          ? MediaQuery.of(context).size.width * 0.5
          : MediaQuery.of(context).size.width * 0.8,
      height: 100,
      // Set the fixed width for the menu
      child: ListView(
        prototypeItem: const ListTile(),
        // Use ListView for fixed menu
        // Your menu items go here
        children: [
          // Menu item 1
          Container(
            color: selectedTabIndex == 0
                ? Theme.of(context).secondaryHeaderColor
                : Theme.of(context).scaffoldBackgroundColor,
            child: ListTile(
              title: const Text('SITA'),
              onTap: () {
                // Handle menu item 1 click
                setState(() {
                  selectedTabIndex = 0;
                });
              },
              selected: selectedTabIndex == 0,
            ),
          ),
          // Menu item 2
          Container(
            color: selectedTabIndex == 1
                ? Theme.of(context).secondaryHeaderColor
                : Theme.of(context).scaffoldBackgroundColor,
            child: ListTile(
              title: const Text('Methode Srl'),
              onTap: () {
                // Handle menu item 2 click
                setState(() {
                  selectedTabIndex = 1;
                });
              },
              selected: selectedTabIndex == 1,
            ),
          ),
          // Add more menu items as needed
        ],
      ),
    );
    Widget expcontents = SelectionArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width > 1100
            ? 540
            : MediaQuery.of(context).size.width < 380
                ? 680
                : 520,
        margin: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            // Your content goes here
            children: [
              // Content section 1
              if (selectedTabIndex == 0)
                Column(
                  children: [
                    experienceCardsita0!,
                    Divider(
                      color: Theme.of(context).secondaryHeaderColor,
                      thickness: 2,
                    ),
                    experienceCardsita1!,
                  ],
                ),
              // Content section 2
              if (selectedTabIndex == 1)
                Column(
                  children: [
                    experienceCardmethode0!,
                  ],
                ),
              // Add more content sections as needed
            ],
          ),
        ),
      ),
    );
    return Container(
        margin: EdgeInsets.only(
            left: marginSize,
            right: marginSize,
            top: marginSize * 0.5,
            bottom: !isWideScreen ? marginSize : marginSize * 0.05),
        padding: EdgeInsets.only(
          left: paddingSize,
          right: paddingSize,
          top: isWideScreen ? paddingSize * 0.05 : 0,
          bottom: isWideScreen ? paddingSize * 0.05 : paddingSize * 0.05,
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Experience",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                  )),
              const SizedBox(height: 5),
              LayoutBuilder(
                builder: (context, constraints) => constraints.maxWidth > 600
                    ? Row(
                        children: [experiencesmenu],
                      )
                    : Column(children: [
                        experiencesmenu,
                      ]),
              ),
              expcontents
            ]));
  }
}
