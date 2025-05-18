import 'dart:async';

import 'src/model.dart';
export 'src/model.dart';

Future<OrgFile> loadOrg(
  String lines, {
  List<String> keywords = const ['TODO', 'DONE'],
}) async {
  final p = OrgParser(lines.split('\n'), keywords);
  return await p.parse();
}

Future<OrgFile> loadsOrg(
  List<String> lines, {
  List<String> keywords = const ['TODO', 'DONE'],
}) async {
  final p = OrgParser(lines, keywords);
  return await p.parse();
}

class OrgParser {
  List<String> lines;
  List<String> keywords;
  final chunkRegex = RegExp(r'^\*+ ');
  final commentRegex = RegExp(r'^#\+.*');
  final headlineRegex = RegExp(r'^(\*+)\s+(.*?)\s*$');
  final todoRegex = RegExp(r'^([\d\w]+)\s+(.*?)\s*$');
  final scheduleRegex = RegExp(
    r'SCHEDULED:\s+<((?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})(?: \w+)?(?: (?<startHour>\d{2}):(?<startMinute>\d{2}))?(?:-+(?<endHour>\d{2}):(?<endMinute>\d{2}))?(?: [\.\+\/\w]+)?)>(?:-+<((?<endYear>\d{4})-(?<endMonth>\d{2})-(?<endDay>\d{2})(?: \w+)?(?: (?<anotherHour>\d{2}):(?<anotherMinute>\d{2}))?)>)?',
  );
  final deadlineRegex = RegExp(
    r'DEADLINE:\s+<((?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})(?: \w+)?(?: (?<startHour>\d{2}):(?<startMinute>\d{2}))?(?:-+(?<endHour>\d{2}):(?<endMinute>\d{2}))?(?: [\.\+\/\w]+)?)>(?:-+<((?<endYear>\d{4})-(?<endMonth>\d{2})-(?<endDay>\d{2})(?: \w+)?(?: (?<anotherHour>\d{2}):(?<anotherMinute>\d{2}))?)>)?',
  );

  OrgParser(this.lines, this.keywords);

  Future<OrgFile> parse() async {
    var headlines = <Headline>[];
    await for (List<String> chunks in linesToChunks(lines)) {
      Headline? headline;
      headline = parseHeadline(chunks);
      if (headline != null) {
        headline = parseTodo(headline);
        headlines.add(headline);
      }
    }
    return OrgFile(headlines);
  }

  Stream<List<String>> linesToChunks(List<String> lines) async* {
    var chunk = <String>[];
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

  Headline? parseHeadline(List<String> chunks) {
    var heading = chunks[0];
    var match = headlineRegex.firstMatch(heading);
    if (match != null) {
      var level = match.group(1)!.length;
      var title = match.group(2)!;
      return Headline(level, title, chunks, chunks.join('\n'));
    }
    return null;
  }

  Headline parseTodo(Headline headline) {
    final todoMatch = todoRegex.firstMatch(headline.title);
    if (todoMatch != null) {
      var keyword = todoMatch.group(1);
      var name = todoMatch.group(2);
      headline.keyword = keyword;
      headline.name = name;
    }
    final scheduleMatch = scheduleRegex.firstMatch(headline.raw);
    if (scheduleMatch != null) {
      headline.scheduled = scheduleMatch.group(1);
      if (scheduleMatch.group(9) != null) {
        headline.scheduled =
            '${scheduleMatch.group(1)} -- ${scheduleMatch.group(9)}';
      }
      final (start: scheduleStart, end: scheduleEnd) = _parseDateTime(
        scheduleMatch,
      );
      headline.scheduledDateTime = scheduleStart;
      headline.scheduledEndDateTime = scheduleEnd;
    }
    final deadlineMatch = deadlineRegex.firstMatch(headline.raw);
    if (deadlineMatch != null) {
      headline.deadline = deadlineMatch.group(1);
      if (deadlineMatch.group(9) != null) {
        headline.deadline =
            '${deadlineMatch.group(1)} -- ${deadlineMatch.group(9)}';
      }
      final (start: deadlineStart, end: deadlineEnd) = _parseDateTime(
        deadlineMatch,
      );
      headline.deadlineDateTime = deadlineStart;
      headline.deadlineEndDateTime = deadlineEnd;
    }
    return headline;
  }

  ({DateTime start, DateTime? end}) _parseDateTime(RegExpMatch match) {
    final year = int.parse(match.namedGroup('year')!);
    final month = int.parse(match.namedGroup('month')!);
    final day = int.parse(match.namedGroup('day')!);
    final startHour = int.parse(match.namedGroup('startHour') ?? '0');
    final startMinute = int.parse(match.namedGroup('startMinute') ?? '0');
    final endHour = match.namedGroup('endHour');
    final endMinute = match.namedGroup('endMinute');
    final endYear = match.namedGroup('endYear');
    final endMonth = match.namedGroup('endMonth');
    final endDay = match.namedGroup('endDay');
    final anotherHour = match.namedGroup('anotherHour');
    final anotherMinute = match.namedGroup('anotherMinute');
    final startDateTime = DateTime(year, month, day, startHour, startMinute);

    DateTime? endDateTime;
    if (endHour != null && endMinute != null) {
      endDateTime = DateTime(
        year,
        month,
        day,
        int.parse(endHour),
        int.parse(endMinute),
      );
    }
    if (endYear != null && endMonth != null && endDay != null) {
      endDateTime = DateTime(
        int.parse(endYear),
        int.parse(endMonth),
        int.parse(endDay),
        int.parse(anotherHour ?? '0'),
        int.parse(anotherMinute ?? '0'),
      );
    }

    return (start: startDateTime, end: endDateTime);
  }
}
