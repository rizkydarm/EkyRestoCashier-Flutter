// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table_manag_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TableManagementEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TableManagementEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TableManagementEvent()';
  }
}

/// @nodoc
class $TableManagementEventCopyWith<$Res> {
  $TableManagementEventCopyWith(
      TableManagementEvent _, $Res Function(TableManagementEvent) __);
}

/// Adds pattern-matching-related methods to [TableManagementEvent].
extension TableManagementEventPatterns on TableManagementEvent {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddTable value)? addTable,
    TResult Function(_UpdateTable value)? updateTable,
    TResult Function(_RemoveTable value)? removeTable,
    TResult Function(_GetTableById value)? getTableById,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that);
      case _AddTable() when addTable != null:
        return addTable(_that);
      case _UpdateTable() when updateTable != null:
        return updateTable(_that);
      case _RemoveTable() when removeTable != null:
        return removeTable(_that);
      case _GetTableById() when getTableById != null:
        return getTableById(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddTable value) addTable,
    required TResult Function(_UpdateTable value) updateTable,
    required TResult Function(_RemoveTable value) removeTable,
    required TResult Function(_GetTableById value) getTableById,
  }) {
    final _that = this;
    switch (_that) {
      case _Started():
        return started(_that);
      case _AddTable():
        return addTable(_that);
      case _UpdateTable():
        return updateTable(_that);
      case _RemoveTable():
        return removeTable(_that);
      case _GetTableById():
        return getTableById(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddTable value)? addTable,
    TResult? Function(_UpdateTable value)? updateTable,
    TResult? Function(_RemoveTable value)? removeTable,
    TResult? Function(_GetTableById value)? getTableById,
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that);
      case _AddTable() when addTable != null:
        return addTable(_that);
      case _UpdateTable() when updateTable != null:
        return updateTable(_that);
      case _RemoveTable() when removeTable != null:
        return removeTable(_that);
      case _GetTableById() when getTableById != null:
        return getTableById(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(RestaurantTable table)? addTable,
    TResult Function(RestaurantTable table)? updateTable,
    TResult Function(int tableId)? removeTable,
    TResult Function(int tableId)? getTableById,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started();
      case _AddTable() when addTable != null:
        return addTable(_that.table);
      case _UpdateTable() when updateTable != null:
        return updateTable(_that.table);
      case _RemoveTable() when removeTable != null:
        return removeTable(_that.tableId);
      case _GetTableById() when getTableById != null:
        return getTableById(_that.tableId);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(RestaurantTable table) addTable,
    required TResult Function(RestaurantTable table) updateTable,
    required TResult Function(int tableId) removeTable,
    required TResult Function(int tableId) getTableById,
  }) {
    final _that = this;
    switch (_that) {
      case _Started():
        return started();
      case _AddTable():
        return addTable(_that.table);
      case _UpdateTable():
        return updateTable(_that.table);
      case _RemoveTable():
        return removeTable(_that.tableId);
      case _GetTableById():
        return getTableById(_that.tableId);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(RestaurantTable table)? addTable,
    TResult? Function(RestaurantTable table)? updateTable,
    TResult? Function(int tableId)? removeTable,
    TResult? Function(int tableId)? getTableById,
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started();
      case _AddTable() when addTable != null:
        return addTable(_that.table);
      case _UpdateTable() when updateTable != null:
        return updateTable(_that.table);
      case _RemoveTable() when removeTable != null:
        return removeTable(_that.tableId);
      case _GetTableById() when getTableById != null:
        return getTableById(_that.tableId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Started implements TableManagementEvent {
  const _Started();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TableManagementEvent.started()';
  }
}

/// @nodoc

class _AddTable implements TableManagementEvent {
  const _AddTable({required this.table});

  final RestaurantTable table;

  /// Create a copy of TableManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AddTableCopyWith<_AddTable> get copyWith =>
      __$AddTableCopyWithImpl<_AddTable>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddTable &&
            (identical(other.table, table) || other.table == table));
  }

  @override
  int get hashCode => Object.hash(runtimeType, table);

  @override
  String toString() {
    return 'TableManagementEvent.addTable(table: $table)';
  }
}

/// @nodoc
abstract mixin class _$AddTableCopyWith<$Res>
    implements $TableManagementEventCopyWith<$Res> {
  factory _$AddTableCopyWith(_AddTable value, $Res Function(_AddTable) _then) =
      __$AddTableCopyWithImpl;
  @useResult
  $Res call({RestaurantTable table});
}

/// @nodoc
class __$AddTableCopyWithImpl<$Res> implements _$AddTableCopyWith<$Res> {
  __$AddTableCopyWithImpl(this._self, this._then);

  final _AddTable _self;
  final $Res Function(_AddTable) _then;

  /// Create a copy of TableManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? table = null,
  }) {
    return _then(_AddTable(
      table: null == table
          ? _self.table
          : table // ignore: cast_nullable_to_non_nullable
              as RestaurantTable,
    ));
  }
}

/// @nodoc

class _UpdateTable implements TableManagementEvent {
  const _UpdateTable({required this.table});

  final RestaurantTable table;

  /// Create a copy of TableManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateTableCopyWith<_UpdateTable> get copyWith =>
      __$UpdateTableCopyWithImpl<_UpdateTable>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateTable &&
            (identical(other.table, table) || other.table == table));
  }

  @override
  int get hashCode => Object.hash(runtimeType, table);

  @override
  String toString() {
    return 'TableManagementEvent.updateTable(table: $table)';
  }
}

/// @nodoc
abstract mixin class _$UpdateTableCopyWith<$Res>
    implements $TableManagementEventCopyWith<$Res> {
  factory _$UpdateTableCopyWith(
          _UpdateTable value, $Res Function(_UpdateTable) _then) =
      __$UpdateTableCopyWithImpl;
  @useResult
  $Res call({RestaurantTable table});
}

/// @nodoc
class __$UpdateTableCopyWithImpl<$Res> implements _$UpdateTableCopyWith<$Res> {
  __$UpdateTableCopyWithImpl(this._self, this._then);

  final _UpdateTable _self;
  final $Res Function(_UpdateTable) _then;

  /// Create a copy of TableManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? table = null,
  }) {
    return _then(_UpdateTable(
      table: null == table
          ? _self.table
          : table // ignore: cast_nullable_to_non_nullable
              as RestaurantTable,
    ));
  }
}

/// @nodoc

class _RemoveTable implements TableManagementEvent {
  const _RemoveTable({required this.tableId});

  final int tableId;

  /// Create a copy of TableManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RemoveTableCopyWith<_RemoveTable> get copyWith =>
      __$RemoveTableCopyWithImpl<_RemoveTable>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RemoveTable &&
            (identical(other.tableId, tableId) || other.tableId == tableId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tableId);

  @override
  String toString() {
    return 'TableManagementEvent.removeTable(tableId: $tableId)';
  }
}

/// @nodoc
abstract mixin class _$RemoveTableCopyWith<$Res>
    implements $TableManagementEventCopyWith<$Res> {
  factory _$RemoveTableCopyWith(
          _RemoveTable value, $Res Function(_RemoveTable) _then) =
      __$RemoveTableCopyWithImpl;
  @useResult
  $Res call({int tableId});
}

/// @nodoc
class __$RemoveTableCopyWithImpl<$Res> implements _$RemoveTableCopyWith<$Res> {
  __$RemoveTableCopyWithImpl(this._self, this._then);

  final _RemoveTable _self;
  final $Res Function(_RemoveTable) _then;

  /// Create a copy of TableManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? tableId = null,
  }) {
    return _then(_RemoveTable(
      tableId: null == tableId
          ? _self.tableId
          : tableId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _GetTableById implements TableManagementEvent {
  const _GetTableById({required this.tableId});

  final int tableId;

  /// Create a copy of TableManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GetTableByIdCopyWith<_GetTableById> get copyWith =>
      __$GetTableByIdCopyWithImpl<_GetTableById>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetTableById &&
            (identical(other.tableId, tableId) || other.tableId == tableId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tableId);

  @override
  String toString() {
    return 'TableManagementEvent.getTableById(tableId: $tableId)';
  }
}

/// @nodoc
abstract mixin class _$GetTableByIdCopyWith<$Res>
    implements $TableManagementEventCopyWith<$Res> {
  factory _$GetTableByIdCopyWith(
          _GetTableById value, $Res Function(_GetTableById) _then) =
      __$GetTableByIdCopyWithImpl;
  @useResult
  $Res call({int tableId});
}

/// @nodoc
class __$GetTableByIdCopyWithImpl<$Res>
    implements _$GetTableByIdCopyWith<$Res> {
  __$GetTableByIdCopyWithImpl(this._self, this._then);

  final _GetTableById _self;
  final $Res Function(_GetTableById) _then;

  /// Create a copy of TableManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? tableId = null,
  }) {
    return _then(_GetTableById(
      tableId: null == tableId
          ? _self.tableId
          : tableId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$TableManagementState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TableManagementState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TableManagementState()';
  }
}

/// @nodoc
class $TableManagementStateCopyWith<$Res> {
  $TableManagementStateCopyWith(
      TableManagementState _, $Res Function(TableManagementState) __);
}

/// Adds pattern-matching-related methods to [TableManagementState].
extension TableManagementStatePatterns on TableManagementState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Success() when success != null:
        return success(_that);
      case _Error() when error != null:
        return error(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case _Loading():
        return loading(_that);
      case _Success():
        return success(_that);
      case _Error():
        return error(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Success() when success != null:
        return success(_that);
      case _Error() when error != null:
        return error(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<RestaurantTable> tables)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading();
      case _Success() when success != null:
        return success(_that.tables);
      case _Error() when error != null:
        return error(_that.message);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<RestaurantTable> tables) success,
    required TResult Function(String message) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case _Loading():
        return loading();
      case _Success():
        return success(_that.tables);
      case _Error():
        return error(_that.message);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<RestaurantTable> tables)? success,
    TResult? Function(String message)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading();
      case _Success() when success != null:
        return success(_that.tables);
      case _Error() when error != null:
        return error(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements TableManagementState {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TableManagementState.initial()';
  }
}

/// @nodoc

class _Loading implements TableManagementState {
  const _Loading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TableManagementState.loading()';
  }
}

/// @nodoc

class _Success implements TableManagementState {
  const _Success(final List<RestaurantTable> tables) : _tables = tables;

  final List<RestaurantTable> _tables;
  List<RestaurantTable> get tables {
    if (_tables is EqualUnmodifiableListView) return _tables;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tables);
  }

  /// Create a copy of TableManagementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SuccessCopyWith<_Success> get copyWith =>
      __$SuccessCopyWithImpl<_Success>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Success &&
            const DeepCollectionEquality().equals(other._tables, _tables));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tables));

  @override
  String toString() {
    return 'TableManagementState.success(tables: $tables)';
  }
}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res>
    implements $TableManagementStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) =
      __$SuccessCopyWithImpl;
  @useResult
  $Res call({List<RestaurantTable> tables});
}

/// @nodoc
class __$SuccessCopyWithImpl<$Res> implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

  /// Create a copy of TableManagementState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? tables = null,
  }) {
    return _then(_Success(
      null == tables
          ? _self._tables
          : tables // ignore: cast_nullable_to_non_nullable
              as List<RestaurantTable>,
    ));
  }
}

/// @nodoc

class _Error implements TableManagementState {
  const _Error(this.message);

  final String message;

  /// Create a copy of TableManagementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'TableManagementState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $TableManagementStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) =
      __$ErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

  /// Create a copy of TableManagementState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(_Error(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
