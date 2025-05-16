class OrgFile {
  List<Headline> headlines = [];

  OrgFile(this.headlines);

  @override
  String toString() {
    return 'headlines: $headlines';
  }
}

class Headline {
  int level;
  String title;
  List<String> chunks;
  String raw;
  String? keyword;
  String? name;
  String? scheduled;
  DateTime? scheduledDateTime;
  String? deadline;
  DateTime? deadlineDateTime;

  Headline(this.level, this.title, this.chunks, this.raw);

  bool get isTodo => keyword != null;

  @override
  String toString() {
    return 'level: $level, title: $title';
  }
}
