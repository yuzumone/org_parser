import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:intl/intl.dart';
import 'package:org_parser_example/data/model/file.dart';
import 'package:org_parser_example/ui/detail/detail_view.dart';
import 'package:org_parser_example/ui/detail/detail_view_state.dart';
import 'package:org_parser_example/ui/home/home_view_state.dart';
import 'package:provider/provider.dart';
import 'package:org_parser/org_parser.dart';

class AgendaView extends StatelessWidget {
  final format = DateFormat('EEEE\tdd\tMMM\ty');

  @override
  Widget build(BuildContext context) {
    var files =
        context.select<HomeViewState, List<File>>((state) => state.files);
    var todoKeywords = context
        .select<HomeViewState, List<String>>((state) => state.todoKeywords);
    var doneKeywords = context
        .select<HomeViewState, List<String>>((state) => state.doneKeywords);
    var agenda = _getAgendaList(files);
    var now = DateTime.now();
    var start = now.subtract(Duration(days: now.weekday - 1));
    var dates = Iterable<int>.generate(7)
        .map((e) => DateTime(start.year, start.month, start.day + e))
        .toList();
    var items = <dynamic>[];
    items.add(dates.first);
    dates.skip(1).forEach((x) {
      items.add(x);
      agenda.forEach((y) {
        var diff = y.scheduledDateTime.difference(x);
        if (0 <= diff.inHours && diff.inHours < 24) {
          items.add(y);
        }
      });
    });
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) =>
          _buildTile(context, items[index], todoKeywords, doneKeywords),
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

  Widget _buildTile(BuildContext context, dynamic item,
      List<String> todoKeyword, List<String> doneKeyword) {
    if (item is DateTime) {
      return _buildHeaderTile(context, item);
    }
    return _buildListTile(context, item, todoKeyword, doneKeyword);
  }

  Widget _buildHeaderTile(BuildContext context, DateTime dateTime) {
    return Container(
      padding: const EdgeInsets.only(
          left: 16.0, top: 12.0, right: 16.0, bottom: 12.0),
      child: Text(
        format.format(dateTime),
        style: TextStyle(color: Colors.blue[700]),
      ),
    );
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
            builder: (context) =>
                StateNotifierProvider<DetailViewStateNotifier, DetailViewState>(
              create: (_) => DetailViewStateNotifier(),
              child: DetailView(headline: headline),
            ),
          ),
        );
      },
    );
  }
}
