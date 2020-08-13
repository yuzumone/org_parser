import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

import 'package:org_parser_example/state/home_view_state.dart';
import 'package:org_parser_example/state/org_file_url_view_state.dart';
import 'package:org_parser_example/state/todo_keyword_view_state.dart';
import 'package:org_parser_example/state/done_keyword_view_state.dart';
import 'preference_view.dart';
import 'file_view.dart';
import 'agenda_view.dart';
import 'todo_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ja', ''),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        '/': (_) => StateNotifierProvider<HomeViewStateNotifier, HomeViewState>(
              create: (_) => HomeViewStateNotifier(),
              child: _HomeView(),
            ),
        '/pref_url': (_) => StateNotifierProvider<OrgFileUrlViewStateNotifier,
                OrgFileUrlViewState>(
              create: (_) => OrgFileUrlViewStateNotifier(),
              child: OrgFileUrlView(),
            ),
        '/pref_todo_keyword': (_) => StateNotifierProvider<
                TodoKeywordViewStateNotifier, TodoKeywordViewState>(
              create: (_) => TodoKeywordViewStateNotifier(),
              child: TodoKeywordView(),
            ),
        '/pref_done_keyword': (_) => StateNotifierProvider<
                DoneKeywordViewNotifier, DoneKeywordViewState>(
              create: (_) => DoneKeywordViewNotifier(),
              child: DoneKeywordView(),
            ),
      },
    );
  }
}

class _HomeView extends StatelessWidget {
  final List<Widget> _listWidgets = <Widget>[
    FilesView(),
    AgendaView(),
    TodoView(),
    PreferenceView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Org Mobile'),
      ),
      body: Container(
        child: _listWidgets.elementAt(
            context.select<HomeViewState, int>((state) => state.pageIndex)),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:
            context.select<HomeViewState, int>((state) => state.pageIndex),
        onTap: (index) => context.read<HomeViewStateNotifier>().setIndex(index),
        unselectedItemColor: Colors.black54,
        selectedItemColor: Colors.blue,
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
            title: Text('Todo'),
            icon: Icon(Icons.alarm),
          ),
          BottomNavigationBarItem(
            title: Text('Setting'),
            icon: Icon(Icons.settings),
          )
        ],
      ),
    );
  }
}
