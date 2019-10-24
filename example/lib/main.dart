import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';

import 'package:org_parser/org_parser.dart';
import 'preference_utils.dart';
import 'preference_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class FilesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("page1");
  }
}

class AgendaView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("page2");
  }
}

class _MyAppState extends State<MyApp> {
  OrgFile _file;
  PreferenceUtil prefUtil;
  Preference _prefs;
  List<String> orgFileUrls;
  PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _loadOrgAsset().then((org) {
      loadOrg(org).then((file) {
        setState(() => _file = file);
      });
    });
    prefUtil = PreferenceUtil();
    prefUtil.getPreference().then((x) {
      print(x);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
  }

  Future<String> _loadOrgAsset() async {
    return await rootBundle.loadString('assets/test.org');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Org Mobile'),
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) => setState(() => _pageIndex = index),
          children: <Widget>[
            FilesView(),
            AgendaView(),
            PreferenceView(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _pageIndex,
          onTap: (index) => _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 280),
              curve: Curves.ease),
          items: [
            BottomNavigationBarItem(
              title: Text('Files'),
              icon: Icon(Icons.insert_drive_file),
            ),
            BottomNavigationBarItem(
              title: Text('Agenda'),
              icon: Icon(Icons.calendar_today),
            ),
            BottomNavigationBarItem(
              title: Text('Setting'),
              icon: Icon(Icons.settings),
            )
          ],
        ),
      ),
    );
  }
}
