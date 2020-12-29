// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'preference_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$PreferenceViewStateTearOff {
  const _$PreferenceViewStateTearOff();

// ignore: unused_element
  _PreferenceViewState call(
      {dynamic viewType = PreferenceViewType.Main,
      List<String> urls = const [],
      List<String> todoKeywords = const [],
      List<String> doneKeywords = const [],
      String fontFace = 'Myrica'}) {
    return _PreferenceViewState(
      viewType: viewType,
      urls: urls,
      todoKeywords: todoKeywords,
      doneKeywords: doneKeywords,
      fontFace: fontFace,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $PreferenceViewState = _$PreferenceViewStateTearOff();

/// @nodoc
mixin _$PreferenceViewState {
  dynamic get viewType;
  List<String> get urls;
  List<String> get todoKeywords;
  List<String> get doneKeywords;
  String get fontFace;

  $PreferenceViewStateCopyWith<PreferenceViewState> get copyWith;
}

/// @nodoc
abstract class $PreferenceViewStateCopyWith<$Res> {
  factory $PreferenceViewStateCopyWith(
          PreferenceViewState value, $Res Function(PreferenceViewState) then) =
      _$PreferenceViewStateCopyWithImpl<$Res>;
  $Res call(
      {dynamic viewType,
      List<String> urls,
      List<String> todoKeywords,
      List<String> doneKeywords,
      String fontFace});
}

/// @nodoc
class _$PreferenceViewStateCopyWithImpl<$Res>
    implements $PreferenceViewStateCopyWith<$Res> {
  _$PreferenceViewStateCopyWithImpl(this._value, this._then);

  final PreferenceViewState _value;
  // ignore: unused_field
  final $Res Function(PreferenceViewState) _then;

  @override
  $Res call({
    Object viewType = freezed,
    Object urls = freezed,
    Object todoKeywords = freezed,
    Object doneKeywords = freezed,
    Object fontFace = freezed,
  }) {
    return _then(_value.copyWith(
      viewType: viewType == freezed ? _value.viewType : viewType as dynamic,
      urls: urls == freezed ? _value.urls : urls as List<String>,
      todoKeywords: todoKeywords == freezed
          ? _value.todoKeywords
          : todoKeywords as List<String>,
      doneKeywords: doneKeywords == freezed
          ? _value.doneKeywords
          : doneKeywords as List<String>,
      fontFace: fontFace == freezed ? _value.fontFace : fontFace as String,
    ));
  }
}

/// @nodoc
abstract class _$PreferenceViewStateCopyWith<$Res>
    implements $PreferenceViewStateCopyWith<$Res> {
  factory _$PreferenceViewStateCopyWith(_PreferenceViewState value,
          $Res Function(_PreferenceViewState) then) =
      __$PreferenceViewStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {dynamic viewType,
      List<String> urls,
      List<String> todoKeywords,
      List<String> doneKeywords,
      String fontFace});
}

/// @nodoc
class __$PreferenceViewStateCopyWithImpl<$Res>
    extends _$PreferenceViewStateCopyWithImpl<$Res>
    implements _$PreferenceViewStateCopyWith<$Res> {
  __$PreferenceViewStateCopyWithImpl(
      _PreferenceViewState _value, $Res Function(_PreferenceViewState) _then)
      : super(_value, (v) => _then(v as _PreferenceViewState));

  @override
  _PreferenceViewState get _value => super._value as _PreferenceViewState;

  @override
  $Res call({
    Object viewType = freezed,
    Object urls = freezed,
    Object todoKeywords = freezed,
    Object doneKeywords = freezed,
    Object fontFace = freezed,
  }) {
    return _then(_PreferenceViewState(
      viewType: viewType == freezed ? _value.viewType : viewType,
      urls: urls == freezed ? _value.urls : urls as List<String>,
      todoKeywords: todoKeywords == freezed
          ? _value.todoKeywords
          : todoKeywords as List<String>,
      doneKeywords: doneKeywords == freezed
          ? _value.doneKeywords
          : doneKeywords as List<String>,
      fontFace: fontFace == freezed ? _value.fontFace : fontFace as String,
    ));
  }
}

/// @nodoc
class _$_PreferenceViewState
    with DiagnosticableTreeMixin
    implements _PreferenceViewState {
  const _$_PreferenceViewState(
      {this.viewType = PreferenceViewType.Main,
      this.urls = const [],
      this.todoKeywords = const [],
      this.doneKeywords = const [],
      this.fontFace = 'Myrica'})
      : assert(viewType != null),
        assert(urls != null),
        assert(todoKeywords != null),
        assert(doneKeywords != null),
        assert(fontFace != null);

  @JsonKey(defaultValue: PreferenceViewType.Main)
  @override
  final dynamic viewType;
  @JsonKey(defaultValue: const [])
  @override
  final List<String> urls;
  @JsonKey(defaultValue: const [])
  @override
  final List<String> todoKeywords;
  @JsonKey(defaultValue: const [])
  @override
  final List<String> doneKeywords;
  @JsonKey(defaultValue: 'Myrica')
  @override
  final String fontFace;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PreferenceViewState(viewType: $viewType, urls: $urls, todoKeywords: $todoKeywords, doneKeywords: $doneKeywords, fontFace: $fontFace)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PreferenceViewState'))
      ..add(DiagnosticsProperty('viewType', viewType))
      ..add(DiagnosticsProperty('urls', urls))
      ..add(DiagnosticsProperty('todoKeywords', todoKeywords))
      ..add(DiagnosticsProperty('doneKeywords', doneKeywords))
      ..add(DiagnosticsProperty('fontFace', fontFace));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PreferenceViewState &&
            (identical(other.viewType, viewType) ||
                const DeepCollectionEquality()
                    .equals(other.viewType, viewType)) &&
            (identical(other.urls, urls) ||
                const DeepCollectionEquality().equals(other.urls, urls)) &&
            (identical(other.todoKeywords, todoKeywords) ||
                const DeepCollectionEquality()
                    .equals(other.todoKeywords, todoKeywords)) &&
            (identical(other.doneKeywords, doneKeywords) ||
                const DeepCollectionEquality()
                    .equals(other.doneKeywords, doneKeywords)) &&
            (identical(other.fontFace, fontFace) ||
                const DeepCollectionEquality()
                    .equals(other.fontFace, fontFace)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(viewType) ^
      const DeepCollectionEquality().hash(urls) ^
      const DeepCollectionEquality().hash(todoKeywords) ^
      const DeepCollectionEquality().hash(doneKeywords) ^
      const DeepCollectionEquality().hash(fontFace);

  @override
  _$PreferenceViewStateCopyWith<_PreferenceViewState> get copyWith =>
      __$PreferenceViewStateCopyWithImpl<_PreferenceViewState>(
          this, _$identity);
}

abstract class _PreferenceViewState implements PreferenceViewState {
  const factory _PreferenceViewState(
      {dynamic viewType,
      List<String> urls,
      List<String> todoKeywords,
      List<String> doneKeywords,
      String fontFace}) = _$_PreferenceViewState;

  @override
  dynamic get viewType;
  @override
  List<String> get urls;
  @override
  List<String> get todoKeywords;
  @override
  List<String> get doneKeywords;
  @override
  String get fontFace;
  @override
  _$PreferenceViewStateCopyWith<_PreferenceViewState> get copyWith;
}
