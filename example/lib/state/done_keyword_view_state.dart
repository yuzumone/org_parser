import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:org_parser_example/preference_utils.dart';

part 'done_keyword_view_state.freezed.dart';

@freezed
abstract class DoneKeywordViewState with _$DoneKeywordViewState {
  const factory DoneKeywordViewState({
    @Default([]) List<String> doneKeywords,
  }) = _DoneKeywordViewState;
}

class DoneKeywordViewNotifier extends StateNotifier<DoneKeywordViewState> {
  final _prefUtil = PreferenceUtil();

  DoneKeywordViewNotifier() : super(const DoneKeywordViewState()) {
    init();
  }

  Future<void> init() async {
    var _pref = await _prefUtil.getPreference();
    state = state.copyWith(
      doneKeywords: _pref.doneKeywords,
    );
  }

  void setDoneKeywords(List<String> doneKeywords) {
    state = state.copyWith(doneKeywords: doneKeywords);
    _prefUtil.setDoneKeywords(doneKeywords);
  }
}
