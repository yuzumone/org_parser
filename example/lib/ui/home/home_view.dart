import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:org_parser_example/ui/agenda/agenda_view.dart';
import 'package:org_parser_example/ui/file/file_view.dart';
import 'package:org_parser_example/ui/home/home_view_state.dart';
import 'package:org_parser_example/ui/todo/todo_view.dart';

class HomeView extends StatelessWidget {
  final List<Widget> _listWidgets = <Widget>[
    FilesView(),
    AgendaView(),
    TodoView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Org Mobile'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Navigator.of(context).pushNamed('/preference'),
          ),
        ],
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
        ],
      ),
    );
  }
}
