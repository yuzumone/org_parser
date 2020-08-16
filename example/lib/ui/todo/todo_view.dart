import 'package:flutter/material.dart';
import 'package:org_parser_example/data/model/file.dart';
import 'package:org_parser_example/ui/detail/detail_view.dart';
import 'package:org_parser_example/ui/home/home_view_state.dart';
import 'package:provider/provider.dart';
import 'package:org_parser/org_parser.dart';

class TodoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var files =
        context.select<HomeViewState, List<File>>((state) => state.files);
    var todoKeywords = context
        .select<HomeViewState, List<String>>((state) => state.todoKeywords);
    var todos = _getTodoList(files, todoKeywords);
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
