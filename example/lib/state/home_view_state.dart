import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:org_parser_example/model.dart';
import 'package:org_parser_example/repository.dart';
import 'package:org_parser_example/preference_utils.dart';

part 'home_view_state.freezed.dart';

@freezed
abstract class HomeViewState with _$HomeViewState {
  const factory HomeViewState({
    @Default(0) int pageIndex,
    @Default([]) List<File> files,
    @Default([]) List<String> urls,
    @Default([]) List<String> todoKeywords,
    @Default([]) List<String> doneKeywords,
  }) = _HomeViewState;
}

class HomeViewStateNotifier extends StateNotifier<HomeViewState> {
  final _prefUtil = PreferenceUtil();
  final _repository = FileRepository();

  HomeViewStateNotifier() : super(const HomeViewState()) {
    init();
  }

  Future<void> init() async {
    var _pref = await _prefUtil.getPreference();
    var _keywords = _pref.todoKeywords + _pref.doneKeywords;
    var _files = await _repository.getWebFiles(_pref.urls, _keywords);
    state = state.copyWith(
      files: _files,
      todoKeywords: _pref.todoKeywords,
      doneKeywords: _pref.doneKeywords,
    );
  }

  void setIndex(int index) => state = state.copyWith(pageIndex: index);
}
