import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:org_parser_example/state/done_keyword_view_state.dart';
import 'package:org_parser_example/state/todo_keyword_view_state.dart';
import 'package:org_parser_example/state/org_file_url_view_state.dart';

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
              Navigator.of(context).pushNamed('/pref_url');
            },
          ),
          ListTile(
            title: Text('TODO Keyword'),
            subtitle: Text('完了のTODOと認識するキーワード'),
            onTap: () {
              Navigator.of(context).pushNamed('/pref_todo_keyword');
            },
          ),
          ListTile(
            title: Text('DONE Keyword'),
            subtitle: Text('未完了のTODOと認識するキーワード'),
            onTap: () {
              Navigator.of(context).pushNamed('/pref_done_keyword');
            },
          ),
        ],
      ),
    );
  }
}

Future<String> _buildInputDialog(BuildContext context, String title) async {
  var result = '';
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

class OrgFileUrlView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var urls = context
        .select<OrgFileUrlViewState, List<String>>((state) => state.urls);
    return Scaffold(
      appBar: AppBar(
        title: Text('Org File Url'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: urls.length,
          itemBuilder: (BuildContext context, int index) => ListTile(
            title: Text(urls[index]),
            onLongPress: () {
              context
                  .read<OrgFileUrlViewStateNotifier>()
                  .setUrls(List.from(urls)..removeAt(index));
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        onPressed: () async {
          final result = await _buildInputDialog(context, 'Input File Url');
          if (result != null) {
            context
                .read<OrgFileUrlViewStateNotifier>()
                .setUrls(List.from(urls)..add(result));
          }
        },
      ),
    );
  }
}

class TodoKeywordView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var todoKeywords = context.watch<TodoKeywordViewState>().todoKeywords;
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo Keyword'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: todoKeywords.length,
          itemBuilder: (BuildContext context, int index) => ListTile(
            title: Text(todoKeywords[index]),
            onLongPress: () {
              context
                  .read<TodoKeywordViewStateNotifier>()
                  .setTodoKeywords(List.from(todoKeywords)..removeAt(index));
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        onPressed: () async {
          final result = await _buildInputDialog(context, 'Input Todo Keyword');
          if (result != null) {
            context
                .read<TodoKeywordViewStateNotifier>()
                .setTodoKeywords(List.from(todoKeywords)..add(result));
          }
        },
      ),
    );
  }
}

class DoneKeywordView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var doneKeywords = context.select<DoneKeywordViewState, List<String>>(
        (state) => state.doneKeywords);
    return Scaffold(
      appBar: AppBar(
        title: Text('Done Keyword'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: doneKeywords.length,
          itemBuilder: (BuildContext context, int index) => ListTile(
            title: Text(doneKeywords[index]),
            onLongPress: () {
              context
                  .read<DoneKeywordViewNotifier>()
                  .setDoneKeywords(List.from(doneKeywords)..removeAt(index));
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        onPressed: () async {
          final result = await _buildInputDialog(context, 'Input Done Keyword');
          if (result != null) {
            context
                .read<DoneKeywordViewNotifier>()
                .setDoneKeywords(List.from(doneKeywords)..add(result));
          }
        },
      ),
    );
  }
}
