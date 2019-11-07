library org_parser;

import 'dart:async';

import 'src/model.dart';
export 'src/model.dart';

Future<OrgFile> loadOrg(String lines,
    {List<String> keywords = const ['TODO', 'DONE']}) async {
  var p = OrgParser(lines.split('\n'), keywords);
  return await p.parse();
}

Future<OrgFile> loadsOrg(List<String> lines,
    {List<String> keywords = const ['TODO', 'DONE']}) async {
  var p = OrgParser(lines, keywords);
  return await p.parse();
}

class OrgParser {
  List<String> lines;
  List<String> keywords;
  var chunkRegex = RegExp(r'^\*+ ');
  var commentRegex = RegExp(r'^#\+.*');
  var headlineRegex = RegExp(r'^(\*+)\s+(.*?)\s*$');
  var todoRegex = RegExp(r'^([\d\w]+)\s+(.*?)\s*$');
  var scheduleRegex = RegExp(
      r'SCHEDULED:\s+<((\d{4})-(\d{2})-(\d{2})\s+\w{3}\s*((\d{2}):(\d{2}))?-*((\d{2}):(\d{2}))?\s*\+?([\ddwmy]*))>');
  var deadlineRegex = RegExp(
      r'DEADLINE:\s+<((\d{4})-(\d{2})-(\d{2})\s+\w{3}\s*((\d{2}):(\d{2}))?-*((\d{2}):(\d{2}))?\s*\+?([\ddwmy]*))>');

  OrgParser(this.lines, this.keywords);

  Future<OrgFile> parse() async {
    List<Headline> headlines = [];
    await for (List<String> chunks in linesToChunks(lines)) {
      Headline headline;
      headline = parseHeadline(chunks);
      if (headline != null) {
        headline = parseTodo(headline);
        if (headline != null) {
          headlines.add(headline);
        }
      }
    }
    return OrgFile(headlines);
  }

  Stream<List<String>> linesToChunks(List<String> lines) async* {
    List<String> chunk = [];
    for (var l in lines) {
      if (chunkRegex.hasMatch(l) && chunk.isNotEmpty) {
        yield chunk;
        chunk = [];
      } else if (commentRegex.hasMatch(l)) {
        continue;
      }
      chunk.add(l);
    }
    yield chunk;
  }

  Headline parseHeadline(List<String> chunks) {
    var heading = chunks[0];
    var match = headlineRegex.firstMatch(heading);
    if (match != null) {
      var level = match.group(1).length;
      var title = match.group(2);
      return Headline(level, title, chunks, chunks.join('\n'));
    }
    return null;
  }

  Headline parseTodo(Headline headline) {
    var todoMatch = todoRegex.firstMatch(headline.title);
    if (todoMatch != null) {
      var keyword = todoMatch.group(1);
      var name = todoMatch.group(2);
      headline.keyword = keyword;
      headline.name = name;
    }
    var scheduleMatch = scheduleRegex.firstMatch(headline.raw);
    if (scheduleMatch != null) {
      headline.scheduled = scheduleMatch.group(1);
      headline.scheduledDateTime = _parseDateTime(scheduleMatch);
    }
    var deadlineMatch = deadlineRegex.firstMatch(headline.raw);
    if (deadlineMatch != null) {
      headline.deadline = deadlineMatch.group(1);
      headline.deadlineDateTime = _parseDateTime(deadlineMatch);
    }
    return headline;
  }

  DateTime _parseDateTime(RegExpMatch match) {
    var year = int.parse(match.group(2));
    var month = int.parse(match.group(3));
    var day = int.parse(match.group(4));
    var hour = int.parse(match.group(6) ?? '0');
    var minute = int.parse(match.group(7) ?? '0');
    return DateTime(year, month, day, hour, minute);
  }
}
