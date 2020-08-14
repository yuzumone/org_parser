import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtil {
  static const ARG_URLS = 'urls';
  static const ARG_TODO_KEYWORDS = 'todo_keywords';
  static const ARG_DONE_KEYWORDS = 'done_keywords';

  PreferenceUtil();

  Future<Preference> getPreference() async {
    var prefs = await SharedPreferences.getInstance();
    var urls = prefs.getStringList(ARG_URLS) ?? [];
    var todoKeywords = prefs.getStringList(ARG_TODO_KEYWORDS) ?? ['TODO'];
    var doneKeywords = prefs.getStringList(ARG_DONE_KEYWORDS) ?? ['DONE'];
    return Preference(urls, todoKeywords, doneKeywords);
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
}

class Preference {
  List<String> urls;
  List<String> todoKeywords;
  List<String> doneKeywords;
  Preference(this.urls, this.todoKeywords, this.doneKeywords);
}
