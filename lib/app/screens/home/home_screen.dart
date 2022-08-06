import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tfasoft_mobile/app/screens/home/pages/home_page.dart';
import 'package:tfasoft_mobile/app/screens/home/pages/log_page.dart';
import 'package:tfasoft_mobile/app/screens/home/pages/settings_page.dart';

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

  List<Map> drawerLinkItems = [
    {
      "title": "TFASoft",
      "icon": Icons.home,
      "link": "https://tfasoft.amirhossein.info",
    },
    {
      "title": "Dashboard",
      "icon": Icons.dashboard,
      "link": "https://dashboard.amirhossein.info",
    },
    {
      "title": "Blog",
      "icon": Icons.rss_feed,
      "link": "https://blog.amirhossein.info",
    },
    {
      "title": "Docs",
      "icon": Icons.menu_book,
      "link": "https://docs.amirhossein.info",
    },
    {
      "title": "Demo",
      "icon": Icons.biotech,
      "link": "https://demo.amirhossein.info",
    },
    {
      "title": "Mobile",
      "icon": Icons.phone_iphone,
      "link": "https://mobile.amirhossein.info",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = <Widget>[
      const LogPage(),
      const HomePage(),
      const SettingsPage(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () =>
                Provider.of<AppState>(context, listen: false).logout(),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      drawer: Drawer(
        width: 240,
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "TFAsoft Mobile",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: drawerLinkItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Icon(drawerLinkItems[index]['icon']),
                    iconColor: Colors.blue,
                    title: Text(drawerLinkItems[index]['title']),
                    onTap: () => {},
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "TFA Mobile",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Version 1.0.0",
              style: TextStyle(
                fontSize: 10,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
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
