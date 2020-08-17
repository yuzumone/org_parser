import 'package:org_parser/org_parser.dart';

class File {
  String url;
  OrgFile org;

  File(this.url, this.org);

  String get name {
    var regex = RegExp(r'^.*/(.*?)(\?.+)?$');
    return regex.firstMatch(url).group(1);
  }
}
