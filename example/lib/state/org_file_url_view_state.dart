import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:org_parser_example/preference_utils.dart';

part 'org_file_url_view_state.freezed.dart';

@freezed
abstract class OrgFileUrlViewState with _$OrgFileUrlViewState {
  const factory OrgFileUrlViewState({
    @Default([]) List<String> urls,
  }) = _OrgFileUrlViewState;
}

class OrgFileUrlViewStateNotifier extends StateNotifier<OrgFileUrlViewState> {
  var _prefUtil = PreferenceUtil();

  OrgFileUrlViewStateNotifier() : super(const OrgFileUrlViewState()) {
    init();
  }

  Future<void> init() async {
    var _pref = await _prefUtil.getPreference();
    state = state.copyWith(
      urls: _pref.urls,
    );
  }

  void setUrls(List<String> urls) {
    state = state.copyWith(urls: urls);
    _prefUtil.setUrls(urls);
  }
}
