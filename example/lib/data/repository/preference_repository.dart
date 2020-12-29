import 'package:shared_preferences/shared_preferences.dart';

class PreferenceRepository {
  static const ARG_URLS = 'urls';
  static const ARG_TODO_KEYWORDS = 'todo_keywords';
  static const ARG_DONE_KEYWORDS = 'done_keywords';
  static const ARG_FONT_FACE = 'font_face';

  PreferenceRepository();

  Future<Preference> getPreference() async {
    var prefs = await SharedPreferences.getInstance();
    var urls = prefs.getStringList(ARG_URLS) ?? [];
    var todoKeywords = prefs.getStringList(ARG_TODO_KEYWORDS) ?? ['TODO'];
    var doneKeywords = prefs.getStringList(ARG_DONE_KEYWORDS) ?? ['DONE'];
    var fontFace = prefs.getString(ARG_FONT_FACE) ?? 'Myrica';
    return Preference(urls, todoKeywords, doneKeywords, fontFace);
  }

  void setUrls(List<String> urls) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(ARG_URLS, urls);
  }

  void setTodoKeywords(List<String> todoKeywords) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(ARG_TODO_KEYWORDS, todoKeywords);
  }

  void setDoneKeywords(List<String> doneKeywords) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(ARG_DONE_KEYWORDS, doneKeywords);
  }

  void setFontFace(String fontFace) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString(ARG_FONT_FACE, fontFace);
  }
}

class Preference {
  List<String> urls;
  List<String> todoKeywords;
  List<String> doneKeywords;
  String fontFace;
  Preference(this.urls, this.todoKeywords, this.doneKeywords, this.fontFace);
}
