import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tfasoft_mobile/app/services/state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPage = 1;
  void _changePage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  final List<Widget> _pages = <Widget>[
    const Text("Accounts"),
    const Text("Home"),
    const Text("Settings"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Provider.of<AppState>(context, listen: false).logout(),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: _pages.elementAt(_selectedPage),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Accounts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedPage,
        onTap: _changePage,
        // elevation: 0,
      ),
    );
  }
}
