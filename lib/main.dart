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
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 41, 41, 41),
        ),
        tabBarTheme: const TabBarTheme(
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
              icon: Icon(Icons.email),
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
        const Center(
          child: CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(
                '/home/acr/Documents/FlutterApplication/my_app/lib/Image/Guido-portrait-2014.jpg'), // Profile image URL
          ),
        ),
        const SizedBox(height: 16),
        const Center(
          child: Text(
            'Guido van Rossum',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 5),
        const Center(
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
        const ListTile(
          leading: Icon(Icons.person),
          title: Text('Name'),
          subtitle: Text('Guido van Rossum'),
        ),
        const ListTile(
          leading: Icon(Icons.cake),
          title: Text('Date of Birth'),
          subtitle: Text('January 31, 1956'),
        ),
        const ListTile(
          leading: Icon(Icons.location_city),
          title: Text('City'),
          subtitle: Text('Belmont, California, USA'),
        ),
        const ListTile(
          leading: Icon(Icons.work),
          title: Text('Occupation'),
          subtitle: Text('Developer'),
        ),
        const ListTile(
          leading: Icon(Icons.biotech),
          title: Text('Brief Bio'),
          subtitle: 
          Text('Guido van Rossum is the creator of the Python programming language'),
        ),
      ],
    );
  }
}

class EducationalBackgroundTab extends StatelessWidget {
  const EducationalBackgroundTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: <Widget>[
        const ListTile(
          leading: Icon(Icons.school),
          title: Text('Bachelor\'s Degree'),
          subtitle: Text(
              'University of Amsterdam, Master\'s Degree in Mathematics and Computer Science.'),
        ),
        const ListTile(
          leading: Icon(Icons.school),
          title: Text('High School'),
          subtitle: Text('Lyceum Amsterdam, Graduated 1974'),
        ),
        const ListTile(
          leading: Icon(Icons.school),
          title: Text('Elementary'),
          subtitle: Text('Montessori Lyceum Amsterdam, Graduated 1968'),
        ),
      ],
    );
  }
}

class SkillsTab extends StatelessWidget {
  const SkillsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const <Widget>[
        ListTile(
          leading: Icon(Icons.code),
          title:  Text('Programming Languages'),
          subtitle: Text('Python, C, C++, Java, Dart'),
        ),
        ListTile(
          leading: Icon(Icons.computer),
          title: Text('Frameworks and Tools'),
          subtitle: Text('Unix, Flutter, React/React Native'),
        ),
        ListTile(
          leading: Icon(Icons.storage),
          title: Text('Databases'),
          subtitle: Text('MySQL, PostgreSQL, NoSql'),
        ),
      ],
    );
  }
}

class InterestTab extends StatelessWidget {
  const InterestTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const <Widget>[
        ListTile(
          leading: Icon(Icons.book),
          title: Text('Reading'),
          subtitle:Text('Technology, Science Fiction'),
        ),
        ListTile(
          leading: Icon(Icons.sports_tennis),
          title: Text('Sports'),
          subtitle:Text('Biking & Basketball'),
        ),
        ListTile(
          leading: Icon(Icons.travel_explore),
          title: Text('Travel'),
          subtitle: Text('Exploring, countries & cultures'),
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
      children: const <Widget>[
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
          subtitle:Text('369 Street, Belmont, California, USA'),
        ),
        ListTile(
          leading: Icon(Icons.location_on),
          title: Text('Social Media'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Facebook: Guido van Rossum'),
              Text('Instagram: its_me_Guido_van)'),
            ], // Child of Social Media
          ),
        ),
      ],
    );
  }
}
