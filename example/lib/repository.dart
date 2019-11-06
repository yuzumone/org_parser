import "dart:convert" show utf8;
import 'package:http/http.dart' as http;
import 'package:org_parser/org_parser.dart';

import 'model.dart';

class FileRepository {
  FileRepository();

  Future<File> getWebFile(String url, List<String> keywords) async {
    var res = await http.get(url);
    var org = await loadOrg(utf8.decode(res.bodyBytes), keywords: keywords);
    return File(url, org);
  }

  Future<List<File>> getWebFiles(
      List<String> urls, List<String> keywords) async {
    List<File> files = [];
    for (String url in urls) {
      var res = await http.get(url);
      var org = await loadOrg(utf8.decode(res.bodyBytes), keywords: keywords);
      files.add(File(url, org));
    }
    return files;
  }
}
