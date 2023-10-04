import 'package:flutter/material.dart';
import 'package:minimal_portfolio/animated_shapes.dart';
import 'package:minimal_portfolio/projectcard.dart';
import 'AboutWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;
  String _selectedSection = 'About';
  final ScrollController _scrollController = ScrollController();
  double _aboutOffset = 1.0;
  double _projectsOffset = 100.0;
  double _experienceOffset = 400.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    setState(() {
      _aboutOffset = 0.0;
      _projectsOffset = _aboutOffset + _buildAboutHeight();
      _experienceOffset = _projectsOffset + _buildProjectsHeight();
    });
  }

  double _buildAboutHeight() {
    // Calculate the height of the About section
    // You can add your own logic here
    return 200.0; // Change this to the actual height
  }

  double _buildProjectsHeight() {
    // Calculate the height of the Projects section
    // You can add your own logic here
    return 400.0; // Change this to the actual height
  }

  void _scrollToSection(double offset) {
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color _selectedLinkColor = _isDarkMode ? Colors.white : Colors.blue;

    return MaterialApp(
      title: 'Elvis Murtezan',
      theme: _buildTheme(),
      home: Scaffold(
        appBar: AppBar(
          title: TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            child: const Text(
              'Elvis Murtezan',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              setState(() {
                _selectedSection = 'About';
                _scrollToSection(_aboutOffset);
              });
            },
          ),
          actions: <Widget>[
            if (MediaQuery.of(context).size.width > 600)
              Row(
                children: <Widget>[
                  _buildLink('About', _aboutOffset),
                  _buildLink('Projects', _projectsOffset),
                  _buildLink('Experience', _experienceOffset),
                ],
              )
            else
              SingleChildScrollView(
                controller: _scrollController,
                child: PopupMenuButton<String>(
                  icon: const Icon(Icons.menu),
                  onSelected: (value) {
                    setState(() {
                      _selectedSection = value;
                    });
                    _scrollToSection(
                      value == 'About'
                          ? _aboutOffset
                          : value == 'Projects'
                              ? _projectsOffset
                              : _experienceOffset,
                    );
                  },
                  itemBuilder: (BuildContext context) {
                    return <PopupMenuEntry<String>>[
                      const PopupMenuItem<String>(
                        value: 'About',
                        child: Text(
                          'About',
                        ),
                      ),
                      const PopupMenuItem<String>(
                        value: 'Projects',
                        child: Text('Projects'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'Experience',
                        child: Text('Experience'),
                      ),
                    ];
                  },
                ),
              ),
            Switch(
              value: _isDarkMode,
              onChanged: (value) {
                _toggleTheme();
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Stack(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: AnimatedBackground()),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.12),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Hello people!  I am',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).primaryColorDark,
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Elvis Murtezan.',
                              style: TextStyle(
                                  fontSize: 66, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'I build software with different technologies.',
                              style: TextStyle(
                                  fontSize: 43, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'I’m a confident software engineer, I consider myself a full stack developer \nand enjoy it a lot, currently working in the air transport industry.',
                              style: TextStyle(fontSize: 19),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  AboutWidget(),
                  _buildProjects(),
                  _buildExperience(),
                  // Footer section
                  Container(
                    alignment: Alignment.center,
                    color: Colors.blue, // Customize the background color.
                    padding:
                        const EdgeInsets.all(16.0), // Add padding for content.
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Built with Flutter and AI tools using',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                          ),
                        ),
                        Row(
                          children: [
                            Image.network(
                              'https://github.gallerycdn.vsassets.io/extensions/github/copilotvs/1.110.0.0/1694462364886/Microsoft.VisualStudio.Services.Icons.Default',
                              height: 50.0, // Limit the height to 50 pixels.
                            ),
                            const SizedBox(
                                width: 8.0), // Add spacing between icons.
                            Image.network(
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/ChatGPT_logo.svg/2048px-ChatGPT_logo.svg.png',
                              height: 50.0, // Limit the height to 50 pixels.
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExperience() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Experience',
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 16),
        // Add your experience content here
      ],
    );
  }

  Widget _buildFixedMenu() {
    return Positioned(
      bottom: 16.0, // Adjust the vertical position as needed
      left: 16.0, // Adjust the horizontal position as needed
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: const Icon(
              Icons.mail,
              size: 30.0,
              color: Colors.blue,
            ),
            onPressed: () {
              // Handle GitHub button click
            },
          ),
          const SizedBox(height: 16.0), // Add spacing between icons
          IconButton(
            icon: const Icon(
              Icons.shield,
              size: 30.0,
              color: Colors.blue,
            ),
            onPressed: () {
              // Handle LinkedIn button click
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLink(String section, double offset) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedSection = section;
            _scrollToSection(offset);
          });
        },
        child: Text(
          section,
          style: TextStyle(
            color: _selectedSection == section ? Colors.blue : Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildProjects() {
    double padding_size = MediaQuery.of(context).size.width > 600
        ? MediaQuery.of(context).size.width * 0.1
        : 40.0;
    double margin_size = MediaQuery.of(context).size.width > 600
        ? MediaQuery.of(context).size.width * 0.12
        : 0.0;
    return Container(
      padding: EdgeInsets.all(padding_size),
      margin: EdgeInsets.only(left: margin_size, right: margin_size),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Projects',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 16),
          ProjectCard(
            title: 'BlockCOVID',
            numberOfPersons: '7',
            context: 'SWE Exam',
            timeframe: '10/2020 - 6/2021',
            technology: 'flutter',
            mainUrlImage:
                'https://images.pexels.com/photos/3183150/pexels-photo-3183150.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
          ),
        ],
      ),
    );
  }

  ThemeData _buildTheme() {
    return _isDarkMode
        ? ThemeData.dark().copyWith(
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF011638),
              foregroundColor: Colors.white,
            ),
            scaffoldBackgroundColor: const Color(0xFF011638),
            textTheme: const TextTheme(),
          )
        : ThemeData.light().copyWith(
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
            primaryColorDark: const Color(0xFF011638),
            scaffoldBackgroundColor: Colors.white,
            textTheme: const TextTheme(),
          );
  }
}
