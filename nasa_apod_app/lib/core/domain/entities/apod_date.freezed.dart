// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'apod_date.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ApodDate {
  int get year => throw _privateConstructorUsedError;
  int get month => throw _privateConstructorUsedError;
  int get day => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ApodDateCopyWith<ApodDate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApodDateCopyWith<$Res> {
  factory $ApodDateCopyWith(ApodDate value, $Res Function(ApodDate) then) =
      _$ApodDateCopyWithImpl<$Res, ApodDate>;
  @useResult
  $Res call({int year, int month, int day});
}

/// @nodoc
class _$ApodDateCopyWithImpl<$Res, $Val extends ApodDate>
    implements $ApodDateCopyWith<$Res> {
  _$ApodDateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? month = null,
    Object? day = null,
  }) {
    return _then(_value.copyWith(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApodDateImplCopyWith<$Res>
    implements $ApodDateCopyWith<$Res> {
  factory _$$ApodDateImplCopyWith(
          _$ApodDateImpl value, $Res Function(_$ApodDateImpl) then) =
      __$$ApodDateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int year, int month, int day});
}

/// @nodoc
class __$$ApodDateImplCopyWithImpl<$Res>
    extends _$ApodDateCopyWithImpl<$Res, _$ApodDateImpl>
    implements _$$ApodDateImplCopyWith<$Res> {
  __$$ApodDateImplCopyWithImpl(
      _$ApodDateImpl _value, $Res Function(_$ApodDateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? month = null,
    Object? day = null,
  }) {
    return _then(_$ApodDateImpl(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ApodDateImpl implements _ApodDate {
  const _$ApodDateImpl(
      {required this.year, required this.month, required this.day});

  @override
  final int year;
  @override
  final int month;
  @override
  final int day;

  @override
  String toString() {
    return 'ApodDate(year: $year, month: $month, day: $day)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApodDateImpl &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.day, day) || other.day == day));
  }

  @override
  int get hashCode => Object.hash(runtimeType, year, month, day);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApodDateImplCopyWith<_$ApodDateImpl> get copyWith =>
      __$$ApodDateImplCopyWithImpl<_$ApodDateImpl>(this, _$identity);
}

abstract class _ApodDate implements ApodDate {
  const factory _ApodDate(
      {required final int year,
      required final int month,
      required final int day}) = _$ApodDateImpl;

  @override
  int get year;
  @override
  int get month;
  @override
  int get day;
  @override
  @JsonKey(ignore: true)
  _$$ApodDateImplCopyWith<_$ApodDateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
