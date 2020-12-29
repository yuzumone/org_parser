// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'detail_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$DetailViewStateTearOff {
  const _$DetailViewStateTearOff();

// ignore: unused_element
  _DetailViewState call({String fontFace = 'Myrica'}) {
    return _DetailViewState(
      fontFace: fontFace,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $DetailViewState = _$DetailViewStateTearOff();

/// @nodoc
mixin _$DetailViewState {
  String get fontFace;

  $DetailViewStateCopyWith<DetailViewState> get copyWith;
}

/// @nodoc
abstract class $DetailViewStateCopyWith<$Res> {
  factory $DetailViewStateCopyWith(
          DetailViewState value, $Res Function(DetailViewState) then) =
      _$DetailViewStateCopyWithImpl<$Res>;
  $Res call({String fontFace});
}

/// @nodoc
class _$DetailViewStateCopyWithImpl<$Res>
    implements $DetailViewStateCopyWith<$Res> {
  _$DetailViewStateCopyWithImpl(this._value, this._then);

  final DetailViewState _value;
  // ignore: unused_field
  final $Res Function(DetailViewState) _then;

  @override
  $Res call({
    Object fontFace = freezed,
  }) {
    return _then(_value.copyWith(
      fontFace: fontFace == freezed ? _value.fontFace : fontFace as String,
    ));
  }
}

/// @nodoc
abstract class _$DetailViewStateCopyWith<$Res>
    implements $DetailViewStateCopyWith<$Res> {
  factory _$DetailViewStateCopyWith(
          _DetailViewState value, $Res Function(_DetailViewState) then) =
      __$DetailViewStateCopyWithImpl<$Res>;
  @override
  $Res call({String fontFace});
}

/// @nodoc
class __$DetailViewStateCopyWithImpl<$Res>
    extends _$DetailViewStateCopyWithImpl<$Res>
    implements _$DetailViewStateCopyWith<$Res> {
  __$DetailViewStateCopyWithImpl(
      _DetailViewState _value, $Res Function(_DetailViewState) _then)
      : super(_value, (v) => _then(v as _DetailViewState));

  @override
  _DetailViewState get _value => super._value as _DetailViewState;

  @override
  $Res call({
    Object fontFace = freezed,
  }) {
    return _then(_DetailViewState(
      fontFace: fontFace == freezed ? _value.fontFace : fontFace as String,
    ));
  }
}

/// @nodoc
class _$_DetailViewState
    with DiagnosticableTreeMixin
    implements _DetailViewState {
  const _$_DetailViewState({this.fontFace = 'Myrica'})
      : assert(fontFace != null);

  @JsonKey(defaultValue: 'Myrica')
  @override
  final String fontFace;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DetailViewState(fontFace: $fontFace)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DetailViewState'))
      ..add(DiagnosticsProperty('fontFace', fontFace));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DetailViewState &&
            (identical(other.fontFace, fontFace) ||
                const DeepCollectionEquality()
                    .equals(other.fontFace, fontFace)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(fontFace);

  @override
  _$DetailViewStateCopyWith<_DetailViewState> get copyWith =>
      __$DetailViewStateCopyWithImpl<_DetailViewState>(this, _$identity);
}

abstract class _DetailViewState implements DetailViewState {
  const factory _DetailViewState({String fontFace}) = _$_DetailViewState;

  @override
  String get fontFace;
  @override
  _$DetailViewStateCopyWith<_DetailViewState> get copyWith;
}
