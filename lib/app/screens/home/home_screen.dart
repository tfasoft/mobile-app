import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:tfasoft_mobile/app/services/api.dart';
import 'package:tfasoft_mobile/app/services/state.dart';

import 'package:tfasoft_mobile/app/screens/home/pages/home_page.dart';
import 'package:tfasoft_mobile/app/screens/home/pages/log_page.dart';
import 'package:tfasoft_mobile/app/screens/home/pages/settings_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DioClient _client = DioClient();

  Future<void> _showSnackBar(BuildContext context, String message) async {
    final snackBar = SnackBar(
      content: Text(message),
      action: SnackBarAction(
        textColor: Colors.blue,
        label: 'Close',
        onPressed: () {},
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> _getLoginToken(BuildContext context) async {
    var response = _client.getLoginToken(
        Provider.of<AppState>(context, listen: false).getUser["tid"]);

    response.then((result) {
      if (result.statusCode == 200) {
        Map data = result.data;

        FlutterClipboard.copy(data['token'])
            .then((success) => _showSnackBar(context, "Token copied"));
      }
    });
  }

  Future<void> _openUrl(BuildContext context, String link) async {
    final Uri url = Uri.parse(link);

    if (!await launchUrl(url)) {
      _showSnackBar(context, "Can not open $url");
    }
  }

  int _selectedPage = 0;

  void _changePage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  List<Map> drawerLinkItems = [
    {
      "title": "TFASoft",
      "icon": Icons.home,
      "url": "https://tfasoft.amirhossein.info",
    },
    {
      "title": "Dashboard",
      "icon": Icons.dashboard,
      "url": "https://dashboard.amirhossein.info",
    },
    {
      "title": "Blog",
      "icon": Icons.rss_feed,
      "url": "https://blog.amirhossein.info",
    },
    {
      "title": "Docs",
      "icon": Icons.menu_book,
      "url": "https://docs.amirhossein.info",
    },
    {
      "title": "Demo",
      "icon": Icons.biotech,
      "url": "https://demo.amirhossein.info",
    },
    {
      "title": "Mobile",
      "icon": Icons.phone_iphone,
      "url": "https://mobile.amirhossein.info",
    },
  ];

  final List<Widget> pages = <Widget>[
    // const LogPage(),
    const HomePage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TFA Mobile'),
        elevation: 0,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _getLoginToken(context),
        elevation: 0,
        child: const Icon(Icons.vpn_key),
      ),
      drawer: Drawer(
        width: 240,
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blueGrey,
                image: DecorationImage(
                  image: ExactAssetImage('assets/images/wallpaper_1.jpg'),
                  fit: BoxFit.fitHeight,
                ),
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
                    iconColor: Colors.blueGrey,
                    title: Text(drawerLinkItems[index]['title']),
                    onTap: () =>
                        _openUrl(context, drawerLinkItems[index]['url']),
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
        child: pages.elementAt(_selectedPage),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.cake),
          //   label: 'Accounts',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedPage,
        onTap: _changePage,
        // elevation: 0,
      ),
    );
  }
}
