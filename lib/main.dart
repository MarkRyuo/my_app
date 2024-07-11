import 'package:flutter/material.dart';

void main() => runApp(const TabBarApp());

class TabBarApp extends StatelessWidget {
  const TabBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const TabBarExample(),
    );
  }
}

class TabBarExample extends StatefulWidget {
  const TabBarExample({super.key});

  @override
  State<TabBarExample> createState() => _TabBarExampleState();
}

class _TabBarExampleState extends State<TabBarExample>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  final List<String> _titles = [
    "Personal Information",
    "Educational Background",
    "Skills",
    "Interest",
    "Contact Details"
  ];
  final List<IconData> _icons = [
    Icons.person,
    Icons.cast_for_education,
    Icons.arrow_upward,
    Icons.star,
    Icons.email
  ];
  String _currentTitle = "Personal Information";
  IconData _currentIcon = Icons.person;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentTitle = _titles[_tabController.index];
        _currentIcon = _icons[_tabController.index];
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(_currentIcon),
            SizedBox(width: 8),
            Text(_currentTitle),
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              icon: Icon(Icons.person),
              text: "Personal Information",
            ),
            Tab(
              icon: Icon(Icons.cast_for_education),
              text: "Educational Background",
            ),
            Tab(
              icon: Icon(Icons.arrow_upward),
              text: "Skills",
            ),
            Tab(
              icon: Icon(Icons.star),
              text: "Interest",
            ),
            Tab(
              icon: Icon(Icons.email),
              text: "Contact Details",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          PersonalInformationTab(),
          EducationalBackgroundTab(),
          SkillsTab(),
          InterestTab(),
          ContactDetailsTab(),
        ],
      ),
    );
  }
}

class PersonalInformationTab extends StatelessWidget {
  const PersonalInformationTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('/home/acr/Documents/FlutterApplication/my_app/lib/Image/Guido-portrait-2014.jpg'), // Replace with your profile image URL
            ),
          ),
          SizedBox(height: 16),
          Center(
            child: Text(
              'John Doe',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 8),
          Divider(),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Username'),
            subtitle: Text('Guido van Rossum'),
          ),
          ListTile(
            leading: Icon(Icons.cake),
            title: Text('Date of Birth'),
            subtitle: Text('January 1, 1990'),
          ),
          ListTile(
            leading: Icon(Icons.location_city),
            title: Text('City'),
            subtitle: Text('New York'),
          ),
          ListTile(
            leading: Icon(Icons.work),
            title: Text('Occupation'),
            subtitle: Text('Software Developer'),
          ),
        ],
      ),
    );
  }
}

class EducationalBackgroundTab extends StatelessWidget {
  const EducationalBackgroundTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.school),
            title: Text('High School'),
            subtitle: Text('ABC High School, Graduated 2008'),
          ),
          ListTile(
            leading: Icon(Icons.school),
            title: Text('Bachelor\'s Degree'),
            subtitle: Text('XYZ University, Computer Science, Graduated 2012'),
          ),
          ListTile(
            leading: Icon(Icons.school),
            title: Text('Master\'s Degree'),
            subtitle: Text('LMN University, Software Engineering, Graduated 2015'),
          ),
        ],
      ),
    );
  }
}

class SkillsTab extends StatelessWidget {
  const SkillsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.code),
            title: Text('Programming Languages'),
            subtitle: Text('Dart, Python, Java, JavaScript'),
          ),
          ListTile(
            leading: Icon(Icons.computer),
            title: Text('Frameworks'),
            subtitle: Text('Flutter, React, Angular'),
          ),
          ListTile(
            leading: Icon(Icons.storage),
            title: Text('Databases'),
            subtitle: Text('MySQL, PostgreSQL, MongoDB'),
          ),
        ],
      ),
    );
  }
}

class InterestTab extends StatelessWidget {
  const InterestTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Reading'),
            subtitle: Text('Fiction, Non-fiction, Technology'),
          ),
          ListTile(
            leading: Icon(Icons.sports_soccer),
            title: Text('Sports'),
            subtitle: Text('Soccer, Basketball'),
          ),
          ListTile(
            leading: Icon(Icons.music_note),
            title: Text('Music'),
            subtitle: Text('Playing guitar, Piano'),
          ),
        ],
      ),
    );
  }
}

class ContactDetailsTab extends StatelessWidget {
  const ContactDetailsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Phone'),
            subtitle: Text('+123 456 7890'),
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('Email'),
            subtitle: Text('example@example.com'),
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Address'),
            subtitle: Text('123 Street, City, Country'),
          ),
        ],
      ),
    );
  }
}
