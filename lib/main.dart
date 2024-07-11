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
          Center(
            child: Text("Personal Information Content"),
          ),
          Center(
            child: Text("Educational Background Content"),
          ),
          Center(
            child: Text("Skills Content"),
          ),
          Center(
            child: Text("Interest Content"),
          ),
          Center(
            child: Text("Contact Details Content"),
          ),
        ],
      ),
    );
  }
}
