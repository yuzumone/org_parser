import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:org_parser/org_parser.dart';

import 'package:org_parser_example/state/home_view_state.dart';
import 'package:org_parser_example/model.dart';
import 'detail_view.dart';

class AgendaView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var files =
        context.select<HomeViewState, List<File>>((state) => state.files);
    var todoKeywords = context
        .select<HomeViewState, List<String>>((state) => state.todoKeywords);
    var doneKeywords = context
        .select<HomeViewState, List<String>>((state) => state.doneKeywords);
    var agenda = _getAgendaList(files);
    return ListView.builder(
      itemCount: agenda.length,
      itemBuilder: (BuildContext context, int index) =>
          _buildListTile(context, agenda[index], todoKeywords, doneKeywords),
    );
  }

  List<Headline> _getAgendaList(List<File> files) {
    var list = files
        .expand((x) => x.org.headlines)
        .where((x) => _checkAgendaHeadline(x))
        .toList();
    list.sort((x, y) => x.scheduledDateTime.compareTo(y.scheduledDateTime));
    return list;
  }

  bool _checkAgendaHeadline(Headline headline) {
    var now = DateTime.now();
    var start = DateTime(now.year, now.month, now.day - (now.weekday - 1));
    var end = DateTime(now.year, now.month, now.day + (8 - now.weekday));
    return (headline.isTodo && _checkAgendaDate(headline, start, end));
  }

  bool _checkAgendaDate(Headline headline, DateTime start, DateTime end) {
    if (headline.scheduledDateTime != null &&
        start.isBefore(headline.scheduledDateTime) &&
        end.isAfter(headline.scheduledDateTime)) {
      return true;
    } else {
      return false;
    }
  }

  Widget _buildListTile(BuildContext context, Headline headline,
      List<String> todoKeyword, List<String> doneKeyword) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                child: Text(
                  headline.scheduled,
                  style: TextStyle(
                    color: todoKeyword.contains(headline.keyword)
                        ? Colors.red
                        : Colors.green,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: Text(
                  headline.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    color: todoKeyword.contains(headline.keyword)
                        ? Colors.red
                        : Colors.green,
                  ),
                ),
              ),
            )
          ],
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
