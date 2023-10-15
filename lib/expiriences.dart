import 'package:flutter/material.dart';
import 'package:minimal_portfolio/experiencecard.dart';

class ExperienceWidget extends StatefulWidget {
  const ExperienceWidget({Key? key}) : super(key: key);

  @override
  ExperienceWidgetState createState() => ExperienceWidgetState();
}

class ExperienceWidgetState extends State<ExperienceWidget> {
  int selectedTabIndex = 0; // Track the selected tab index
  ExperienceCard? experienceCardsita0 = ExperienceCard(
      experience: Experience(
          role: 'Associate Software Developer',
          date: 'November 2023 - now',
          description: 'Actively contributing in the Passenger portfolio...'));
  ExperienceCard? experienceCardsita1 = ExperienceCard(
      experience: Experience(
          role: 'Junior Software engineer',
          date: 'November 2022 - October 2023',
          description:
              'I have contributing with many different technologies(frontend/backend), with Azure as the main cloud provider within an Agile environment:\n• building PoC’s: built a sample app with Power Apps, clone an existing app with Flutter, build some simple Power BI reports\n• production: automating of tasks using mainly Python and Power Platform, Data factory for ETL operations'));
  ExperienceCard? experienceCardmethode0 = ExperienceCard(
      experience: Experience(
          role: 'Intern Software Developer',
          date: 'June 2021 - August 2021',
          description:
              'I have worked in an Agile environment and given my contribution as a Full-stack developer for a total of 320 hours, working on:\n• frontend: development of UI components during short sprints(Scrum) with React.js and Redux as a state management\n• backend: development of REST API and data entry services with Azure platform following using Typescript and third-party libraries selected from the npm register'));
  @override
  Widget build(BuildContext context) {
    final isWideScreen = MediaQuery.of(context).size.width > 650;
    double paddingSize =
        isWideScreen ? MediaQuery.of(context).size.width * 0.1 : 20.0;
    double marginSize =
        isWideScreen ? MediaQuery.of(context).size.width * 0.12 : 0.0;
    double w = isWideScreen
        ? MediaQuery.of(context).size.width * 0.2
        : double.infinity;

    Widget experiencesmenu = SizedBox(
      width: w, // Set the fixed width for the menu
      child: ListView(
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
    Widget expcontents = SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        // Your content goes here
        children: [
          // Content section 1
          if (selectedTabIndex == 0)
            if (selectedTabIndex == 0)
              Column(
                children: [
                  experienceCardsita0!,
                  experienceCardsita1!,
                ],
              ),
          // Content section 2
          if (selectedTabIndex == 1) experienceCardmethode0!,
          // Add more content sections as needed
        ],
      ),
    );
    return Container(
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.only(
            left: marginSize,
            right: marginSize,
            top: marginSize * 0.05,
            bottom: !isWideScreen ? marginSize : marginSize * 0.05),
        padding: EdgeInsets.only(
          left: paddingSize,
          right: paddingSize,
          top: isWideScreen ? paddingSize * 0.5 : 0,
          bottom: isWideScreen ? paddingSize : paddingSize * 0.05,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text("Experience",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w500,
              )),
          Expanded(
              child: LayoutBuilder(
            builder: (context, constraints) => constraints.maxWidth > 650
                ? Row(
                    children: [
                      Expanded(child: experiencesmenu),
                      Expanded(child: expcontents)
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                        Expanded(child: experiencesmenu),
                        Expanded(child: expcontents),
                      ]),
          ))
        ]));
  }
}
