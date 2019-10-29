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
      ),
    );
  }
}

Future<String> _buildInputDialog(BuildContext context, String title) async {
  String result = '';
  return showDialog<String>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                autofocus: true,
                onChanged: (value) => result = value,
              ),
            )
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('OK'),
            onPressed: () => Navigator.of(context).pop(result),
          ),
          FlatButton(
            child: Text('CANCEL'),
            onPressed: () => Navigator.of(context).pop(null),
          )
        ],
      );
    },
  );
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
            onLongPress: () {
              setState(() => _urls.removeAt(index));
              _prefUtil.setUrls(_urls);
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        onPressed: () async {
          final String result =
              await _buildInputDialog(context, 'Input File Url');
          if (result != null) {
            setState(() => _urls.add(result));
            _prefUtil.setUrls(_urls);
          }
        },
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
            onLongPress: () {
              setState(() => _todoKeyword.removeAt(index));
              _prefUtil.setTodoKeywords(_todoKeyword);
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        onPressed: () async {
          final String result =
              await _buildInputDialog(context, 'Input Todo Keyword');
          if (result != null) {
            setState(() => _todoKeyword.add(result));
            _prefUtil.setTodoKeywords(_todoKeyword);
          }
        },
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
            onLongPress: () {
              setState(() => _doneKeyword.removeAt(index));
              _prefUtil.setDoneKeywords(_doneKeyword);
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        onPressed: () async {
          final String result =
              await _buildInputDialog(context, 'Input Done Keyword');
          if (result != null) {
            setState(() => _doneKeyword.add(result));
            _prefUtil.setDoneKeywords(_doneKeyword);
          }
        },
      ),
    );
  }
}
