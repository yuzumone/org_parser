// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'todo_keyword_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$TodoKeywordViewStateTearOff {
  const _$TodoKeywordViewStateTearOff();

// ignore: unused_element
  _TodoKeywordViewState call({List<String> todoKeywords = const []}) {
    return _TodoKeywordViewState(
      todoKeywords: todoKeywords,
    );
  }
}

// ignore: unused_element
const $TodoKeywordViewState = _$TodoKeywordViewStateTearOff();

mixin _$TodoKeywordViewState {
  List<String> get todoKeywords;

  $TodoKeywordViewStateCopyWith<TodoKeywordViewState> get copyWith;
}

abstract class $TodoKeywordViewStateCopyWith<$Res> {
  factory $TodoKeywordViewStateCopyWith(TodoKeywordViewState value,
          $Res Function(TodoKeywordViewState) then) =
      _$TodoKeywordViewStateCopyWithImpl<$Res>;
  $Res call({List<String> todoKeywords});
}

class _$TodoKeywordViewStateCopyWithImpl<$Res>
    implements $TodoKeywordViewStateCopyWith<$Res> {
  _$TodoKeywordViewStateCopyWithImpl(this._value, this._then);

  final TodoKeywordViewState _value;
  // ignore: unused_field
  final $Res Function(TodoKeywordViewState) _then;

  @override
  $Res call({
    Object todoKeywords = freezed,
  }) {
    return _then(_value.copyWith(
      todoKeywords: todoKeywords == freezed
          ? _value.todoKeywords
          : todoKeywords as List<String>,
    ));
  }
}

abstract class _$TodoKeywordViewStateCopyWith<$Res>
    implements $TodoKeywordViewStateCopyWith<$Res> {
  factory _$TodoKeywordViewStateCopyWith(_TodoKeywordViewState value,
          $Res Function(_TodoKeywordViewState) then) =
      __$TodoKeywordViewStateCopyWithImpl<$Res>;
  @override
  $Res call({List<String> todoKeywords});
}

class __$TodoKeywordViewStateCopyWithImpl<$Res>
    extends _$TodoKeywordViewStateCopyWithImpl<$Res>
    implements _$TodoKeywordViewStateCopyWith<$Res> {
  __$TodoKeywordViewStateCopyWithImpl(
      _TodoKeywordViewState _value, $Res Function(_TodoKeywordViewState) _then)
      : super(_value, (v) => _then(v as _TodoKeywordViewState));

  @override
  _TodoKeywordViewState get _value => super._value as _TodoKeywordViewState;

  @override
  $Res call({
    Object todoKeywords = freezed,
  }) {
    return _then(_TodoKeywordViewState(
      todoKeywords: todoKeywords == freezed
          ? _value.todoKeywords
          : todoKeywords as List<String>,
    ));
  }
}

class _$_TodoKeywordViewState
    with DiagnosticableTreeMixin
    implements _TodoKeywordViewState {
  const _$_TodoKeywordViewState({this.todoKeywords = const []})
      : assert(todoKeywords != null);

  @JsonKey(defaultValue: const [])
  @override
  final List<String> todoKeywords;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TodoKeywordViewState(todoKeywords: $todoKeywords)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TodoKeywordViewState'))
      ..add(DiagnosticsProperty('todoKeywords', todoKeywords));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TodoKeywordViewState &&
            (identical(other.todoKeywords, todoKeywords) ||
                const DeepCollectionEquality()
                    .equals(other.todoKeywords, todoKeywords)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(todoKeywords);

  @override
  _$TodoKeywordViewStateCopyWith<_TodoKeywordViewState> get copyWith =>
      __$TodoKeywordViewStateCopyWithImpl<_TodoKeywordViewState>(
          this, _$identity);
}

abstract class _TodoKeywordViewState implements TodoKeywordViewState {
  const factory _TodoKeywordViewState({List<String> todoKeywords}) =
      _$_TodoKeywordViewState;

  @override
  List<String> get todoKeywords;
  @override
  _$TodoKeywordViewStateCopyWith<_TodoKeywordViewState> get copyWith;
}
