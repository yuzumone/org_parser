// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'search_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SearchViewStateTearOff {
  const _$SearchViewStateTearOff();

// ignore: unused_element
  _SearchViewState call({List<Headline> result = const []}) {
    return _SearchViewState(
      result: result,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SearchViewState = _$SearchViewStateTearOff();

/// @nodoc
mixin _$SearchViewState {
  List<Headline> get result;

  $SearchViewStateCopyWith<SearchViewState> get copyWith;
}

/// @nodoc
abstract class $SearchViewStateCopyWith<$Res> {
  factory $SearchViewStateCopyWith(
          SearchViewState value, $Res Function(SearchViewState) then) =
      _$SearchViewStateCopyWithImpl<$Res>;
  $Res call({List<Headline> result});
}

/// @nodoc
class _$SearchViewStateCopyWithImpl<$Res>
    implements $SearchViewStateCopyWith<$Res> {
  _$SearchViewStateCopyWithImpl(this._value, this._then);

  final SearchViewState _value;
  // ignore: unused_field
  final $Res Function(SearchViewState) _then;

  @override
  $Res call({
    Object result = freezed,
  }) {
    return _then(_value.copyWith(
      result: result == freezed ? _value.result : result as List<Headline>,
    ));
  }
}

/// @nodoc
abstract class _$SearchViewStateCopyWith<$Res>
    implements $SearchViewStateCopyWith<$Res> {
  factory _$SearchViewStateCopyWith(
          _SearchViewState value, $Res Function(_SearchViewState) then) =
      __$SearchViewStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Headline> result});
}

/// @nodoc
class __$SearchViewStateCopyWithImpl<$Res>
    extends _$SearchViewStateCopyWithImpl<$Res>
    implements _$SearchViewStateCopyWith<$Res> {
  __$SearchViewStateCopyWithImpl(
      _SearchViewState _value, $Res Function(_SearchViewState) _then)
      : super(_value, (v) => _then(v as _SearchViewState));

  @override
  _SearchViewState get _value => super._value as _SearchViewState;

  @override
  $Res call({
    Object result = freezed,
  }) {
    return _then(_SearchViewState(
      result: result == freezed ? _value.result : result as List<Headline>,
    ));
  }
}

/// @nodoc
class _$_SearchViewState
    with DiagnosticableTreeMixin
    implements _SearchViewState {
  const _$_SearchViewState({this.result = const []}) : assert(result != null);

  @JsonKey(defaultValue: const [])
  @override
  final List<Headline> result;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SearchViewState(result: $result)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SearchViewState'))
      ..add(DiagnosticsProperty('result', result));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SearchViewState &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(result);

  @override
  _$SearchViewStateCopyWith<_SearchViewState> get copyWith =>
      __$SearchViewStateCopyWithImpl<_SearchViewState>(this, _$identity);
}

abstract class _SearchViewState implements SearchViewState {
  const factory _SearchViewState({List<Headline> result}) = _$_SearchViewState;

  @override
  List<Headline> get result;
  @override
  _$SearchViewStateCopyWith<_SearchViewState> get copyWith;
}
