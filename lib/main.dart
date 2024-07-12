import 'package:flutter/material.dart';

void main() => runApp(const TabBarApp());

class TabBarApp extends StatelessWidget {
  const TabBarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark, // Set dark mode
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 41, 41, 41),
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
  const TabBarExample({Key? key}) : super(key: key);

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
            const SizedBox(width: 8),
            Text(
              _currentTitle,
              style: const TextStyle(
                fontSize: 20.0,
              ),
            ),
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            const Tab(
              icon: Icon(Icons.person),
              text: "Personal Information",
            ),
            const Tab(
              icon: Icon(Icons.cast_for_education),
              text: "Educational Background",
            ),
            const Tab(
              icon: Icon(Icons.arrow_upward),
              text: "Skills",
            ),
            const Tab(
              icon: Icon(Icons.star),
              text: "Interest",
            ),
            const Tab(
              icon: const Icon(Icons.email),
              text: "Contact Details",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          const PersonalInformationTab(),
          const EducationalBackgroundTab(),
          const SkillsTab(),
          const InterestTab(),
          const ContactDetailsTab(),
        ],
      ),
    );
  }
}

class PersonalInformationTab extends StatelessWidget {
  const PersonalInformationTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: <Widget>[
        Center(
          child: CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(
                '/home/acr/Documents/FlutterApplication/my_app/lib/Image/Guido-portrait-2014.jpg'), // Profile image URL
          ),
        ),
        const SizedBox(height: 16),
        Center(
          child: Text(
            'Guido van Rossum',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Center(
          child: 
          Text(
            'Creator of Python',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text('Name'),
          subtitle: const Text('Guido van Rossum'),
        ),
        ListTile(
          leading: const Icon(Icons.cake),
          title: const Text('Date of Birth'),
          subtitle: const Text('January 31, 1956'),
        ),
        ListTile(
          leading: const Icon(Icons.location_city),
          title: const Text('City'),
          subtitle: const Text('Belmont, California, USA'),
        ),
        ListTile(
          leading: const Icon(Icons.work),
          title: const Text('Occupation'),
          subtitle: const Text('Developer'),
        ),
        ListTile(
          leading: const Icon(Icons.biotech),
          title: const Text('Brief Bio'),
          subtitle: const Text('Guido van Rossum is the creator of the Python programming language'),
        ),
      ],
    );
  }
}

class EducationalBackgroundTab extends StatelessWidget {
  const EducationalBackgroundTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.school),
          title: const Text('Bachelor\'s Degree'),
          subtitle: const Text(
              'University of Amsterdam, Master\'s Degree in Mathematics and Computer Science.'),
        ),
        ListTile(
          leading: const Icon(Icons.school),
          title: const Text('High School'),
          subtitle: const Text('Lyceum Amsterdam, Graduated 1974'),
        ),
        ListTile(
          leading: const Icon(Icons.school),
          title: const Text('Elementary'),
          subtitle: const Text('Montessori Lyceum Amsterdam, Graduated 1968'),
        ),
      ],
    );
  }
}

class SkillsTab extends StatelessWidget {
  const SkillsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.code),
          title: const Text('Programming Languages'),
          subtitle: const Text('Python, C, C++, Java, Dart'),
        ),
        ListTile(
          leading: const Icon(Icons.computer),
          title: const Text('Frameworks and Tools'),
          subtitle: const Text('Unix, Flutter, React/React Native'),
        ),
        ListTile(
          leading: const Icon(Icons.storage),
          title: const Text('Databases'),
          subtitle: const Text('MySQL, PostgreSQL, NoSql'),
        ),
      ],
    );
  }
}

class InterestTab extends StatelessWidget {
  const InterestTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.book),
          title: const Text('Reading'),
          subtitle: const Text('Technology, Science Fiction'),
        ),
        ListTile(
          leading: const Icon(Icons.sports_tennis),
          title: const Text('Sports'),
          subtitle: const Text('Biking & Basketball'),
        ),
        ListTile(
          leading: const Icon(Icons.travel_explore),
          title: const Text('Travel'),
          subtitle: const Text('Exploring, countries & cultures'),
        ),
      ],
    );
  }
}

class ContactDetailsTab extends StatelessWidget {
  const ContactDetailsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.phone),
          title: const Text('Phone Number'),
          subtitle: const Text('+1 234 764 3490'),
        ),
        ListTile(
          leading: const Icon(Icons.email),
          title: const Text('Email'),
          subtitle: const Text('guido@email.com'),
        ),
        ListTile(
          leading: const Icon(Icons.location_on),
          title: const Text('Address'),
          subtitle: const Text('369 Street, Belmont, California, USA'),
        ),
        ListTile(
          leading: const Icon(Icons.location_on),
          title: const Text('Social Media'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Facebook: Guido van Rossum'),
              Text('Instagram: its_me_Guido_van)'),
            ], // Child of Social Media
          ),
        ),
      ],
    );
  }
}
