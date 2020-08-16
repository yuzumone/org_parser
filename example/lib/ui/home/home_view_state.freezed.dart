// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'home_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$HomeViewStateTearOff {
  const _$HomeViewStateTearOff();

// ignore: unused_element
  _HomeViewState call(
      {int pageIndex = 0,
      List<File> files = const [],
      List<String> urls = const [],
      List<String> todoKeywords = const [],
      List<String> doneKeywords = const []}) {
    return _HomeViewState(
      pageIndex: pageIndex,
      files: files,
      urls: urls,
      todoKeywords: todoKeywords,
      doneKeywords: doneKeywords,
    );
  }
}

// ignore: unused_element
const $HomeViewState = _$HomeViewStateTearOff();

mixin _$HomeViewState {
  int get pageIndex;
  List<File> get files;
  List<String> get urls;
  List<String> get todoKeywords;
  List<String> get doneKeywords;

  $HomeViewStateCopyWith<HomeViewState> get copyWith;
}

abstract class $HomeViewStateCopyWith<$Res> {
  factory $HomeViewStateCopyWith(
          HomeViewState value, $Res Function(HomeViewState) then) =
      _$HomeViewStateCopyWithImpl<$Res>;
  $Res call(
      {int pageIndex,
      List<File> files,
      List<String> urls,
      List<String> todoKeywords,
      List<String> doneKeywords});
}

class _$HomeViewStateCopyWithImpl<$Res>
    implements $HomeViewStateCopyWith<$Res> {
  _$HomeViewStateCopyWithImpl(this._value, this._then);

  final HomeViewState _value;
  // ignore: unused_field
  final $Res Function(HomeViewState) _then;

  @override
  $Res call({
    Object pageIndex = freezed,
    Object files = freezed,
    Object urls = freezed,
    Object todoKeywords = freezed,
    Object doneKeywords = freezed,
  }) {
    return _then(_value.copyWith(
      pageIndex: pageIndex == freezed ? _value.pageIndex : pageIndex as int,
      files: files == freezed ? _value.files : files as List<File>,
      urls: urls == freezed ? _value.urls : urls as List<String>,
      todoKeywords: todoKeywords == freezed
          ? _value.todoKeywords
          : todoKeywords as List<String>,
      doneKeywords: doneKeywords == freezed
          ? _value.doneKeywords
          : doneKeywords as List<String>,
    ));
  }
}

abstract class _$HomeViewStateCopyWith<$Res>
    implements $HomeViewStateCopyWith<$Res> {
  factory _$HomeViewStateCopyWith(
          _HomeViewState value, $Res Function(_HomeViewState) then) =
      __$HomeViewStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {int pageIndex,
      List<File> files,
      List<String> urls,
      List<String> todoKeywords,
      List<String> doneKeywords});
}

class __$HomeViewStateCopyWithImpl<$Res>
    extends _$HomeViewStateCopyWithImpl<$Res>
    implements _$HomeViewStateCopyWith<$Res> {
  __$HomeViewStateCopyWithImpl(
      _HomeViewState _value, $Res Function(_HomeViewState) _then)
      : super(_value, (v) => _then(v as _HomeViewState));

  @override
  _HomeViewState get _value => super._value as _HomeViewState;

  @override
  $Res call({
    Object pageIndex = freezed,
    Object files = freezed,
    Object urls = freezed,
    Object todoKeywords = freezed,
    Object doneKeywords = freezed,
  }) {
    return _then(_HomeViewState(
      pageIndex: pageIndex == freezed ? _value.pageIndex : pageIndex as int,
      files: files == freezed ? _value.files : files as List<File>,
      urls: urls == freezed ? _value.urls : urls as List<String>,
      todoKeywords: todoKeywords == freezed
          ? _value.todoKeywords
          : todoKeywords as List<String>,
      doneKeywords: doneKeywords == freezed
          ? _value.doneKeywords
          : doneKeywords as List<String>,
    ));
  }
}

class _$_HomeViewState with DiagnosticableTreeMixin implements _HomeViewState {
  const _$_HomeViewState(
      {this.pageIndex = 0,
      this.files = const [],
      this.urls = const [],
      this.todoKeywords = const [],
      this.doneKeywords = const []})
      : assert(pageIndex != null),
        assert(files != null),
        assert(urls != null),
        assert(todoKeywords != null),
        assert(doneKeywords != null);

  @JsonKey(defaultValue: 0)
  @override
  final int pageIndex;
  @JsonKey(defaultValue: const [])
  @override
  final List<File> files;
  @JsonKey(defaultValue: const [])
  @override
  final List<String> urls;
  @JsonKey(defaultValue: const [])
  @override
  final List<String> todoKeywords;
  @JsonKey(defaultValue: const [])
  @override
  final List<String> doneKeywords;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeViewState(pageIndex: $pageIndex, files: $files, urls: $urls, todoKeywords: $todoKeywords, doneKeywords: $doneKeywords)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HomeViewState'))
      ..add(DiagnosticsProperty('pageIndex', pageIndex))
      ..add(DiagnosticsProperty('files', files))
      ..add(DiagnosticsProperty('urls', urls))
      ..add(DiagnosticsProperty('todoKeywords', todoKeywords))
      ..add(DiagnosticsProperty('doneKeywords', doneKeywords));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HomeViewState &&
            (identical(other.pageIndex, pageIndex) ||
                const DeepCollectionEquality()
                    .equals(other.pageIndex, pageIndex)) &&
            (identical(other.files, files) ||
                const DeepCollectionEquality().equals(other.files, files)) &&
            (identical(other.urls, urls) ||
                const DeepCollectionEquality().equals(other.urls, urls)) &&
            (identical(other.todoKeywords, todoKeywords) ||
                const DeepCollectionEquality()
                    .equals(other.todoKeywords, todoKeywords)) &&
            (identical(other.doneKeywords, doneKeywords) ||
                const DeepCollectionEquality()
                    .equals(other.doneKeywords, doneKeywords)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(pageIndex) ^
      const DeepCollectionEquality().hash(files) ^
      const DeepCollectionEquality().hash(urls) ^
      const DeepCollectionEquality().hash(todoKeywords) ^
      const DeepCollectionEquality().hash(doneKeywords);

  @override
  _$HomeViewStateCopyWith<_HomeViewState> get copyWith =>
      __$HomeViewStateCopyWithImpl<_HomeViewState>(this, _$identity);
}

abstract class _HomeViewState implements HomeViewState {
  const factory _HomeViewState(
      {int pageIndex,
      List<File> files,
      List<String> urls,
      List<String> todoKeywords,
      List<String> doneKeywords}) = _$_HomeViewState;

  @override
  int get pageIndex;
  @override
  List<File> get files;
  @override
  List<String> get urls;
  @override
  List<String> get todoKeywords;
  @override
  List<String> get doneKeywords;
  @override
  _$HomeViewStateCopyWith<_HomeViewState> get copyWith;
}