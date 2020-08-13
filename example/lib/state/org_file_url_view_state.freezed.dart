// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'org_file_url_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$OrgFileUrlViewStateTearOff {
  const _$OrgFileUrlViewStateTearOff();

// ignore: unused_element
  _OrgFileUrlViewState call({List<String> urls = const []}) {
    return _OrgFileUrlViewState(
      urls: urls,
    );
  }
}

// ignore: unused_element
const $OrgFileUrlViewState = _$OrgFileUrlViewStateTearOff();

mixin _$OrgFileUrlViewState {
  List<String> get urls;

  $OrgFileUrlViewStateCopyWith<OrgFileUrlViewState> get copyWith;
}

abstract class $OrgFileUrlViewStateCopyWith<$Res> {
  factory $OrgFileUrlViewStateCopyWith(
          OrgFileUrlViewState value, $Res Function(OrgFileUrlViewState) then) =
      _$OrgFileUrlViewStateCopyWithImpl<$Res>;
  $Res call({List<String> urls});
}

class _$OrgFileUrlViewStateCopyWithImpl<$Res>
    implements $OrgFileUrlViewStateCopyWith<$Res> {
  _$OrgFileUrlViewStateCopyWithImpl(this._value, this._then);

  final OrgFileUrlViewState _value;
  // ignore: unused_field
  final $Res Function(OrgFileUrlViewState) _then;

  @override
  $Res call({
    Object urls = freezed,
  }) {
    return _then(_value.copyWith(
      urls: urls == freezed ? _value.urls : urls as List<String>,
    ));
  }
}

abstract class _$OrgFileUrlViewStateCopyWith<$Res>
    implements $OrgFileUrlViewStateCopyWith<$Res> {
  factory _$OrgFileUrlViewStateCopyWith(_OrgFileUrlViewState value,
          $Res Function(_OrgFileUrlViewState) then) =
      __$OrgFileUrlViewStateCopyWithImpl<$Res>;
  @override
  $Res call({List<String> urls});
}

class __$OrgFileUrlViewStateCopyWithImpl<$Res>
    extends _$OrgFileUrlViewStateCopyWithImpl<$Res>
    implements _$OrgFileUrlViewStateCopyWith<$Res> {
  __$OrgFileUrlViewStateCopyWithImpl(
      _OrgFileUrlViewState _value, $Res Function(_OrgFileUrlViewState) _then)
      : super(_value, (v) => _then(v as _OrgFileUrlViewState));

  @override
  _OrgFileUrlViewState get _value => super._value as _OrgFileUrlViewState;

  @override
  $Res call({
    Object urls = freezed,
  }) {
    return _then(_OrgFileUrlViewState(
      urls: urls == freezed ? _value.urls : urls as List<String>,
    ));
  }
}

class _$_OrgFileUrlViewState
    with DiagnosticableTreeMixin
    implements _OrgFileUrlViewState {
  const _$_OrgFileUrlViewState({this.urls = const []}) : assert(urls != null);

  @JsonKey(defaultValue: const [])
  @override
  final List<String> urls;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OrgFileUrlViewState(urls: $urls)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OrgFileUrlViewState'))
      ..add(DiagnosticsProperty('urls', urls));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OrgFileUrlViewState &&
            (identical(other.urls, urls) ||
                const DeepCollectionEquality().equals(other.urls, urls)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(urls);

  @override
  _$OrgFileUrlViewStateCopyWith<_OrgFileUrlViewState> get copyWith =>
      __$OrgFileUrlViewStateCopyWithImpl<_OrgFileUrlViewState>(
          this, _$identity);
}

abstract class _OrgFileUrlViewState implements OrgFileUrlViewState {
  const factory _OrgFileUrlViewState({List<String> urls}) =
      _$_OrgFileUrlViewState;

  @override
  List<String> get urls;
  @override
  _$OrgFileUrlViewStateCopyWith<_OrgFileUrlViewState> get copyWith;
}
