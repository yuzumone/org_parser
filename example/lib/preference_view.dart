import 'package:flutter/material.dart';

class PreferenceView extends StatelessWidget {
  List<Widget> _listWidgets = <Widget>[
    ListTile(
      title: Text('Org File'),
      subtitle: Text('OrgファイルのURL'),
      onTap: () {},
    ),
    ListTile(
      title: Text('TODO Keyword'),
      subtitle: Text('完了のTODOと認識するキーワード'),
      onTap: () {},
    ),
    ListTile(
      title: Text('DONE Keyword'),
      subtitle: Text('未完了のTODOと認識するキーワード'),
      onTap: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: _listWidgets.length,
        itemBuilder: (BuildContext context, int index) =>
            _listWidgets.elementAt(index),
      ),
    );
  }
}

class OrgFileUrlView extends StatefulWidget {
  @override
  _OrgFileUrlState createState() => _OrgFileUrlState();
}

class _OrgFileUrlState extends State<OrgFileUrlView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemBuilder: null,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        onPressed: () {},
      ),
    );
  }
}

class TodoKeywordView extends StatefulWidget {
  @override
  _TodoKeywordState createState() => _TodoKeywordState();
}

class _TodoKeywordState extends State<TodoKeywordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemBuilder: null,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        onPressed: () {},
      ),
    );
  }
}

class DoneKeywordView extends StatefulWidget {
  @override
  _DoneKeywordState createState() => _DoneKeywordState();
}

class _DoneKeywordState extends State<TodoKeywordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemBuilder: null,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        onPressed: () {},
      ),
    );
  }
}
