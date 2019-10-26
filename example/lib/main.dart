import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:provider/provider.dart';
import 'dart:async';

import 'package:org_parser/org_parser.dart';
import 'preference_utils.dart';
import 'preference_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _StatefulProvider(
        child: _HomeView(),
      ),
    );
  }
}

class _StatefulProvider extends StatefulWidget {
  const _StatefulProvider({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  _StatefulProviderState createState() => _StatefulProviderState();
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

class _StatefulProviderState extends State<_StatefulProvider> {
  PreferenceUtil _prefUtil;
  Preference _prefs;
  List<OrgFile> _files = [];
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadOrgAsset().then((org) {
      loadOrg(org).then((file) {
        setState(() => _files.add(file));
      });
    });
    _prefUtil = PreferenceUtil();
    _prefUtil.getPreference().then((pref) {
      setState(() => _prefs = pref);
    });
  }

  Future<String> _loadOrgAsset() async {
    return await rootBundle.loadString('assets/test.org');
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Preference>.value(value: _prefs),
        Provider<List<OrgFile>>.value(value: _files),
        Provider<int>.value(value: _pageIndex),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Org Mobile'),
        ),
        body: Container(child: widget.child),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _pageIndex,
          onTap: (index) => setState(() => _pageIndex = index),
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

class _HomeView extends StatelessWidget {
  List<Widget> _listWidgets = <Widget>[
    FilesView(),
    AgendaView(),
    PreferenceView(),
  ];
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    int index = Provider.of<int>(context);
    return _listWidgets.elementAt(index);
  }
}
