import 'package:flutter/material.dart';
import 'package:org_parser_example/model.dart';
import 'package:provider/provider.dart';

import 'preference_utils.dart';
import 'preference_view.dart';
import 'repository.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        '/': (_) => _StatefulProvider(
              child: _HomeView(),
            ),
        '/pref_url': (_) => OrgFileUrlView(),
        '/pref_todo_keyword': (_) => TodoKeywordView(),
        '/pref_done_keyword': (_) => DoneKeywordView(),
      },
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
    var files = Provider.of<List<File>>(context);
    return ListView.builder(
      itemCount: files.length,
      itemBuilder: (BuildContext context, int index) => ListTile(
        title: Text(files[index].name),
        onTap: () {},
      ),
    );
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
  FileRepository _repository;
  Preference _prefs;
  List<File> _files = [];
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    _prefUtil = PreferenceUtil();
    _repository = FileRepository();
    _prefUtil.getPreference().then((pref) {
      setState(() => _prefs = pref);
      var keywords = pref.todoKeywords + pref.doneKeywords;
      _repository
          .getWebFiles(pref.urls, keywords)
          .then((f) => setState(() => _files = f));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Preference>.value(value: _prefs),
        Provider<List<File>>.value(value: _files),
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
