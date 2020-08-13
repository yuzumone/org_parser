import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:org_parser_example/preference_utils.dart';

part 'todo_keyword_view_state.freezed.dart';

@freezed
abstract class TodoKeywordViewState with _$TodoKeywordViewState {
  const factory TodoKeywordViewState({
    @Default([]) List<String> todoKeywords,
  }) = _TodoKeywordViewState;
}

class TodoKeywordViewStateNotifier extends StateNotifier<TodoKeywordViewState> {
  var _prefUtil = PreferenceUtil();

  TodoKeywordViewStateNotifier() : super(const TodoKeywordViewState()) {
    init();
  }

  Future<void> init() async {
    var _pref = await _prefUtil.getPreference();
    state = state.copyWith(
      todoKeywords: _pref.todoKeywords,
    );
  }

  void setTodoKeywords(List<String> todoKeywords) {
    state = state.copyWith(todoKeywords: todoKeywords);
    _prefUtil.setTodoKeywords(todoKeywords);
  }
}
