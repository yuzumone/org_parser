import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:org_parser/org_parser.dart';

import 'model.dart';
import 'preference_utils.dart';
import 'detail_view.dart';

class TodoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var files = Provider.of<List<File>>(context);
    var prefs = Provider.of<Preference>(context);
    var todos = _getTodoList(files, prefs.todoKeywords);
    return ListView.builder(
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) =>
            _buildListTile(context, todos[index]));
  }

  List<Headline> _getTodoList(List<File> files, List<String> todoKeyword) {
    return files
        .expand((x) => x.org.headlines)
        .where((x) => (x.isTodo && todoKeyword.contains(x.keyword)))
        .toList();
  }

  Widget _buildListTile(BuildContext context, Headline headline) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Text(
            headline.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailView(
              headline: headline,
            ),
          ),
        );
      },
    );
  }
}