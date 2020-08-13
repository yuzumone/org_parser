// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'done_keyword_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$DoneKeywordViewStateTearOff {
  const _$DoneKeywordViewStateTearOff();

// ignore: unused_element
  _DoneKeywordViewState call({List<String> doneKeywords = const []}) {
    return _DoneKeywordViewState(
      doneKeywords: doneKeywords,
    );
  }
}

// ignore: unused_element
const $DoneKeywordViewState = _$DoneKeywordViewStateTearOff();

mixin _$DoneKeywordViewState {
  List<String> get doneKeywords;

  $DoneKeywordViewStateCopyWith<DoneKeywordViewState> get copyWith;
}

abstract class $DoneKeywordViewStateCopyWith<$Res> {
  factory $DoneKeywordViewStateCopyWith(DoneKeywordViewState value,
          $Res Function(DoneKeywordViewState) then) =
      _$DoneKeywordViewStateCopyWithImpl<$Res>;
  $Res call({List<String> doneKeywords});
}

class _$DoneKeywordViewStateCopyWithImpl<$Res>
    implements $DoneKeywordViewStateCopyWith<$Res> {
  _$DoneKeywordViewStateCopyWithImpl(this._value, this._then);

  final DoneKeywordViewState _value;
  // ignore: unused_field
  final $Res Function(DoneKeywordViewState) _then;

  @override
  $Res call({
    Object doneKeywords = freezed,
  }) {
    return _then(_value.copyWith(
      doneKeywords: doneKeywords == freezed
          ? _value.doneKeywords
          : doneKeywords as List<String>,
    ));
  }
}

abstract class _$DoneKeywordViewStateCopyWith<$Res>
    implements $DoneKeywordViewStateCopyWith<$Res> {
  factory _$DoneKeywordViewStateCopyWith(_DoneKeywordViewState value,
          $Res Function(_DoneKeywordViewState) then) =
      __$DoneKeywordViewStateCopyWithImpl<$Res>;
  @override
  $Res call({List<String> doneKeywords});
}

class __$DoneKeywordViewStateCopyWithImpl<$Res>
    extends _$DoneKeywordViewStateCopyWithImpl<$Res>
    implements _$DoneKeywordViewStateCopyWith<$Res> {
  __$DoneKeywordViewStateCopyWithImpl(
      _DoneKeywordViewState _value, $Res Function(_DoneKeywordViewState) _then)
      : super(_value, (v) => _then(v as _DoneKeywordViewState));

  @override
  _DoneKeywordViewState get _value => super._value as _DoneKeywordViewState;

  @override
  $Res call({
    Object doneKeywords = freezed,
  }) {
    return _then(_DoneKeywordViewState(
      doneKeywords: doneKeywords == freezed
          ? _value.doneKeywords
          : doneKeywords as List<String>,
    ));
  }
}

class _$_DoneKeywordViewState
    with DiagnosticableTreeMixin
    implements _DoneKeywordViewState {
  const _$_DoneKeywordViewState({this.doneKeywords = const []})
      : assert(doneKeywords != null);

  @JsonKey(defaultValue: const [])
  @override
  final List<String> doneKeywords;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DoneKeywordViewState(doneKeywords: $doneKeywords)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DoneKeywordViewState'))
      ..add(DiagnosticsProperty('doneKeywords', doneKeywords));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DoneKeywordViewState &&
            (identical(other.doneKeywords, doneKeywords) ||
                const DeepCollectionEquality()
                    .equals(other.doneKeywords, doneKeywords)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(doneKeywords);

  @override
  _$DoneKeywordViewStateCopyWith<_DoneKeywordViewState> get copyWith =>
      __$DoneKeywordViewStateCopyWithImpl<_DoneKeywordViewState>(
          this, _$identity);
}

abstract class _DoneKeywordViewState implements DoneKeywordViewState {
  const factory _DoneKeywordViewState({List<String> doneKeywords}) =
      _$_DoneKeywordViewState;

  @override
  List<String> get doneKeywords;
  @override
  _$DoneKeywordViewStateCopyWith<_DoneKeywordViewState> get copyWith;
}
