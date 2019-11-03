import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:org_parser/org_parser.dart';

import 'model.dart';
import 'preference_utils.dart';

class AgendaView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var files = Provider.of<List<File>>(context);
    var prefs = Provider.of<Preference>(context);
    var agenda = _getAgendaList(files);
    return ListView.builder(
      itemCount: agenda.length,
      itemBuilder: (BuildContext context, int index) =>
          _buildListTile(agenda[index], prefs.todoKeywords, prefs.doneKeywords),
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

  Widget _buildListTile(
      Headline headline, List<String> todoKeyword, List<String> doneKeyword) {
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
      onTap: () {},
    );
  }
}
