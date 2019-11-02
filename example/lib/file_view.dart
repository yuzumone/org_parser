import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:org_parser/org_parser.dart';

import 'model.dart';
import 'preference_utils.dart';

class FilesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var files = Provider.of<List<File>>(context);
    var prefs = Provider.of<Preference>(context);
    return ListView.builder(
      itemCount: files.length,
      itemBuilder: (BuildContext context, int index) => ListTile(
        title: Text(files[index].name),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => _HeadlineListView(
                name: files[index].name,
                org: files[index].org,
                todoKeywords: prefs.todoKeywords,
                doneKeywords: prefs.doneKeywords,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _HeadlineListView extends StatelessWidget {
  final String name;
  final OrgFile org;
  final List<String> todoKeywords;
  final List<String> doneKeywords;

  _HeadlineListView(
      {Key key,
      @required this.name,
      @required this.org,
      @required this.todoKeywords,
      @required this.doneKeywords})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: org.headlines.length,
          itemBuilder: (BuildContext context, int index) => _HeadlineView(
            headline: org.headlines[index],
            todoKeywords: todoKeywords,
            doneKeywords: doneKeywords,
          ),
        ),
      ),
    );
  }
}

class _HeadlineView extends StatelessWidget {
  final Headline headline;
  final List<String> todoKeywords;
  final List<String> doneKeywords;

  _HeadlineView(
      {Key key,
      @required this.headline,
      @required this.todoKeywords,
      @required this.doneKeywords})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding:
            EdgeInsets.only(left: 8.0, right: 16.0, top: 16.0, bottom: 16.0),
        child: Container(
            padding: EdgeInsets.only(
              left: (8.0 * headline.level).toDouble(),
            ),
            child: Row(
              children: <Widget>[
                Divider(
                  height: 10,
                  color: Colors.black,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      headline.title,
                      style: TextStyle(
                          color: _getTextColor(
                              headline.keyword, todoKeywords, doneKeywords)),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Visibility(
                      child: Text("Sheduled: ${headline.scheduled}"),
                      visible: headline.scheduled != null,
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Visibility(
                      child: Text("Deadline: ${headline.deadline}"),
                      visible: headline.deadline != null,
                    )
                  ],
                ),
              ],
            )),
      ),
      onTap: () {},
    );
  }

  Color _getTextColor(String keyword, List<String> todos, List<String> dones) {
    if (todos.contains(keyword)) {
      return Colors.red;
    } else if (dones.contains(keyword)) {
      return Colors.green;
    } else {
      return Colors.black;
    }
  }
}
