import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:org_parser_example/preference_utils.dart';
import 'package:org_parser_example/data/model/preference_view_type.dart';

part 'preference_view_state.freezed.dart';

@freezed
abstract class PreferenceViewState with _$PreferenceViewState {
  const factory PreferenceViewState({
    @Default(PreferenceViewType.Main) viewType,
    @Default([]) List<String> urls,
    @Default([]) List<String> todoKeywords,
    @Default([]) List<String> doneKeywords,
  }) = _PreferenceViewState;
}

class PreferenceViewStateNotifier extends StateNotifier<PreferenceViewState> {
  final _prefUtil = PreferenceUtil();

  PreferenceViewStateNotifier() : super(const PreferenceViewState()) {
    init();
  }

  Future<void> init() async {
    var _pref = await _prefUtil.getPreference();
    state = state.copyWith(
      urls: _pref.urls,
      todoKeywords: _pref.todoKeywords,
      doneKeywords: _pref.doneKeywords,
    );
  }

  void setViewType(PreferenceViewType viewType) {
    state = state.copyWith(viewType: viewType);
  }

  void setUrls(List<String> urls) {
    state = state.copyWith(urls: urls);
    _prefUtil.setUrls(urls);
  }

  void setTodoKeywords(List<String> keywords) {
    state = state.copyWith(todoKeywords: keywords);
    _prefUtil.setTodoKeywords(keywords);
  }

  void setDoneKeywords(List<String> keywords) {
    state = state.copyWith(doneKeywords: keywords);
    _prefUtil.setDoneKeywords(keywords);
  }
}
