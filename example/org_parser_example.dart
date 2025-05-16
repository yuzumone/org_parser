import 'package:org_parser/org_parser.dart';

void main() async {
  final org = '''
* headline 1
** headline 2
*** TODO headline 3
SCHEDULED: <2025-01-01 Wed>
  ''';
  final orgFile = await loadOrg(org);
  for (var headline in orgFile.headlines) {
    print(headline);
  }
  // level: 1, title: headline 1
  // level: 2, title: headline 2
  // level: 3, title: TODO headline 3
}
