import 'package:flutter/material.dart';
import 'package:org_parser_example/preference_utils.dart';

class PreferenceView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Org File'),
            subtitle: Text('OrgファイルのURL'),
            onTap: () {
              Navigator.of(context).pushNamed("/pref_url");
            },
          ),
          ListTile(
            title: Text('TODO Keyword'),
            subtitle: Text('完了のTODOと認識するキーワード'),
            onTap: () {
              Navigator.of(context).pushNamed("/pref_todo_keyword");
            },
          ),
          ListTile(
            title: Text('DONE Keyword'),
            subtitle: Text('未完了のTODOと認識するキーワード'),
            onTap: () {
              Navigator.of(context).pushNamed("/pref_done_keyword");
            },
          ),
        ],
      )
    );
  }
}

class OrgFileUrlView extends StatefulWidget {
  @override
  _OrgFileUrlState createState() => _OrgFileUrlState();
}

class _OrgFileUrlState extends State<OrgFileUrlView> {
  PreferenceUtil _prefUtil;
  List<String> _urls = [];

  @override
  void initState() {
    super.initState();
    _prefUtil = PreferenceUtil();
    _prefUtil.getPreference().then((prefs) {
      setState(() => _urls = prefs.urls);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Org File Url'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: _urls.length,
          itemBuilder: (BuildContext context, int index) => ListTile(
            title: Text(_urls[index]),
            onTap: () {},
          ),
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
  PreferenceUtil _prefUtil;
  List<String> _todoKeyword = [];

  @override
  void initState() {
    super.initState();
    _prefUtil = PreferenceUtil();
    _prefUtil.getPreference().then((prefs) {
      setState(() => _todoKeyword = prefs.todoKeywords);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo Keyword'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: _todoKeyword.length,
          itemBuilder: (BuildContext context, int index) => ListTile(
            title: Text(_todoKeyword[index]),
            onTap: () {},
          ),
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

class _DoneKeywordState extends State<DoneKeywordView> {
  PreferenceUtil _prefUtil;
  List<String> _doneKeyword = [];

  @override
  void initState() {
    super.initState();
    _prefUtil = PreferenceUtil();
    _prefUtil.getPreference().then((prefs) {
      setState(() => _doneKeyword = prefs.doneKeywords);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Done Keyword'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: _doneKeyword.length,
          itemBuilder: (BuildContext context, int index) => ListTile(
            title: Text(_doneKeyword[index]),
            onTap: () {},
          ),
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
