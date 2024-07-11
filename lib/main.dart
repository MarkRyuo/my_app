import 'package:flutter/material.dart';

void main() => runApp(const TabBarApp());

class TabBarApp extends StatelessWidget {
  const TabBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark, // Set dark mode
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 36, 36, 36), 
        ),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.white, // Set label color for selected tab
          unselectedLabelColor: Colors.white60, // Set color for unselected tabs
          indicator: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.blueAccent, // Set color for tab indicator
                width: 2.0,
              ),
            ),
          ),
        ),
      ),
      home: const TabBarExample(),
    );
  }
}

class TabBarExample extends StatefulWidget {
  const TabBarExample({super.key});

  @override
  State<TabBarExample> createState() => _TabBarExampleState();
}

class _TabBarExampleState extends State<TabBarExample> with TickerProviderStateMixin {
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
            Text(
              _currentTitle,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
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
              backgroundImage: AssetImage('/home/acr/Documents/FlutterApplication/my_app/lib/Image/Guido-portrait-2014.jpg'), // Profile image URL
            ),
          ),
          SizedBox(height: 16),
          Center(
            child: Text(
              'Guido van Rossum',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 12),
          Center(
            child: Text(
              'Creator of Python',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
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
            subtitle: Text('January 31, 1956'),
          ),
          ListTile(
            leading: Icon(Icons.location_city),
            title: Text('City'),
            subtitle: Text('Belmont, California, USA'),
          ),
          ListTile(
            leading: Icon(Icons.work),
            title: Text('Occupation'),
            subtitle: Text('Software Engineer'),
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
            subtitle: Text('Montessori Lyceum Amsterdam, Graduated 1974'),
          ),
          ListTile(
            leading: Icon(Icons.school),
            title: Text('Bachelor\'s Degree'),
            subtitle: Text('University of Amsterdam, Mathematics and Computer Science, Graduated 1982'),
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
            subtitle: Text('Python, C, C++'),
          ),
          ListTile(
            leading: Icon(Icons.computer),
            title: Text('Frameworks and Tools'),
            subtitle: Text('Unix, Amoeba, ABC'),
          ),
          ListTile(
            leading: Icon(Icons.storage),
            title: Text('Databases'),
            subtitle: Text('MySQL, PostgreSQL'),
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
            subtitle: Text('Technology, Science Fiction'),
          ),
          ListTile(
            leading: Icon(Icons.sports_tennis),
            title: Text('Sports'),
            subtitle: Text('Tennis, Biking'),
          ),
          ListTile(
            leading: Icon(Icons.travel_explore),
            title: Text('Travel'),
            subtitle: Text('Exploring, countries and cultures'),
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
            title: Text('Phone Number'),
            subtitle: Text('+1 234 764 3490'),
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('Email'),
            subtitle: Text('guido@email.com'),
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Address'),
            subtitle: Text('369 Street, Belmont, California, USA'),
          ),
        ],
      ),
    );
  }
}
