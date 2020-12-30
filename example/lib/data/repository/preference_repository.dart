import 'package:shared_preferences/shared_preferences.dart';

class PreferenceRepository {
  static const ARG_URLS = 'urls';
  static const ARG_TODO_KEYWORDS = 'todo_keywords';
  static const ARG_DONE_KEYWORDS = 'done_keywords';
  static const ARG_FONT_FACE = 'font_face';
  static const ARG_FONT_SIZE = 'font_size';

  PreferenceRepository();

  Future<Preference> getPreference() async {
    var prefs = await SharedPreferences.getInstance();
    var urls = prefs.getStringList(ARG_URLS) ?? [];
    var todoKeywords = prefs.getStringList(ARG_TODO_KEYWORDS) ?? ['TODO'];
    var doneKeywords = prefs.getStringList(ARG_DONE_KEYWORDS) ?? ['DONE'];
    var fontFace = prefs.getString(ARG_FONT_FACE) ?? 'Myrica';
    var fontSize = prefs.getInt(ARG_FONT_SIZE) ?? 16;
    return Preference(urls, todoKeywords, doneKeywords, fontFace, fontSize);
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

  void setFontSize(int fontSize) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setInt(ARG_FONT_SIZE, fontSize);
  }
}

class Preference {
  List<String> urls;
  List<String> todoKeywords;
  List<String> doneKeywords;
  String fontFace;
  int fontSize;
  Preference(this.urls, this.todoKeywords, this.doneKeywords, this.fontFace,
      this.fontSize);
}
