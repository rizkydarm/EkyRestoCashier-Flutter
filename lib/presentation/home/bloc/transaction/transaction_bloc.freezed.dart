// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransactionEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TransactionEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TransactionEvent()';
  }
}

/// @nodoc
class $TransactionEventCopyWith<$Res> {
  $TransactionEventCopyWith(
      TransactionEvent _, $Res Function(TransactionEvent) __);
}

/// Adds pattern-matching-related methods to [TransactionEvent].
extension TransactionEventPatterns on TransactionEvent {
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
    TResult Function(_GetAllOrder value)? getAllOrder,
    TResult Function(_GetAllOrderItem value)? getAllOrderItem,
    TResult Function(_GetOrderByTransactionId value)? getOrderByTransactionId,
    TResult Function(_GetItemsByTransactionId value)? getItemsByTransactionId,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that);
      case _GetAllOrder() when getAllOrder != null:
        return getAllOrder(_that);
      case _GetAllOrderItem() when getAllOrderItem != null:
        return getAllOrderItem(_that);
      case _GetOrderByTransactionId() when getOrderByTransactionId != null:
        return getOrderByTransactionId(_that);
      case _GetItemsByTransactionId() when getItemsByTransactionId != null:
        return getItemsByTransactionId(_that);
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
    required TResult Function(_GetAllOrder value) getAllOrder,
    required TResult Function(_GetAllOrderItem value) getAllOrderItem,
    required TResult Function(_GetOrderByTransactionId value)
        getOrderByTransactionId,
    required TResult Function(_GetItemsByTransactionId value)
        getItemsByTransactionId,
  }) {
    final _that = this;
    switch (_that) {
      case _Started():
        return started(_that);
      case _GetAllOrder():
        return getAllOrder(_that);
      case _GetAllOrderItem():
        return getAllOrderItem(_that);
      case _GetOrderByTransactionId():
        return getOrderByTransactionId(_that);
      case _GetItemsByTransactionId():
        return getItemsByTransactionId(_that);
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
    TResult? Function(_GetAllOrder value)? getAllOrder,
    TResult? Function(_GetAllOrderItem value)? getAllOrderItem,
    TResult? Function(_GetOrderByTransactionId value)? getOrderByTransactionId,
    TResult? Function(_GetItemsByTransactionId value)? getItemsByTransactionId,
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that);
      case _GetAllOrder() when getAllOrder != null:
        return getAllOrder(_that);
      case _GetAllOrderItem() when getAllOrderItem != null:
        return getAllOrderItem(_that);
      case _GetOrderByTransactionId() when getOrderByTransactionId != null:
        return getOrderByTransactionId(_that);
      case _GetItemsByTransactionId() when getItemsByTransactionId != null:
        return getItemsByTransactionId(_that);
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
    TResult Function()? getAllOrder,
    TResult Function()? getAllOrderItem,
    TResult Function(int id)? getOrderByTransactionId,
    TResult Function(int id)? getItemsByTransactionId,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started();
      case _GetAllOrder() when getAllOrder != null:
        return getAllOrder();
      case _GetAllOrderItem() when getAllOrderItem != null:
        return getAllOrderItem();
      case _GetOrderByTransactionId() when getOrderByTransactionId != null:
        return getOrderByTransactionId(_that.id);
      case _GetItemsByTransactionId() when getItemsByTransactionId != null:
        return getItemsByTransactionId(_that.id);
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
    required TResult Function() getAllOrder,
    required TResult Function() getAllOrderItem,
    required TResult Function(int id) getOrderByTransactionId,
    required TResult Function(int id) getItemsByTransactionId,
  }) {
    final _that = this;
    switch (_that) {
      case _Started():
        return started();
      case _GetAllOrder():
        return getAllOrder();
      case _GetAllOrderItem():
        return getAllOrderItem();
      case _GetOrderByTransactionId():
        return getOrderByTransactionId(_that.id);
      case _GetItemsByTransactionId():
        return getItemsByTransactionId(_that.id);
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
    TResult? Function()? getAllOrder,
    TResult? Function()? getAllOrderItem,
    TResult? Function(int id)? getOrderByTransactionId,
    TResult? Function(int id)? getItemsByTransactionId,
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started();
      case _GetAllOrder() when getAllOrder != null:
        return getAllOrder();
      case _GetAllOrderItem() when getAllOrderItem != null:
        return getAllOrderItem();
      case _GetOrderByTransactionId() when getOrderByTransactionId != null:
        return getOrderByTransactionId(_that.id);
      case _GetItemsByTransactionId() when getItemsByTransactionId != null:
        return getItemsByTransactionId(_that.id);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Started implements TransactionEvent {
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
    return 'TransactionEvent.started()';
  }
}

/// @nodoc

class _GetAllOrder implements TransactionEvent {
  const _GetAllOrder();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _GetAllOrder);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TransactionEvent.getAllOrder()';
  }
}

/// @nodoc

class _GetAllOrderItem implements TransactionEvent {
  const _GetAllOrderItem();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _GetAllOrderItem);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TransactionEvent.getAllOrderItem()';
  }
}

/// @nodoc

class _GetOrderByTransactionId implements TransactionEvent {
  const _GetOrderByTransactionId(this.id);

  final int id;

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GetOrderByTransactionIdCopyWith<_GetOrderByTransactionId> get copyWith =>
      __$GetOrderByTransactionIdCopyWithImpl<_GetOrderByTransactionId>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetOrderByTransactionId &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'TransactionEvent.getOrderByTransactionId(id: $id)';
  }
}

/// @nodoc
abstract mixin class _$GetOrderByTransactionIdCopyWith<$Res>
    implements $TransactionEventCopyWith<$Res> {
  factory _$GetOrderByTransactionIdCopyWith(_GetOrderByTransactionId value,
          $Res Function(_GetOrderByTransactionId) _then) =
      __$GetOrderByTransactionIdCopyWithImpl;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$GetOrderByTransactionIdCopyWithImpl<$Res>
    implements _$GetOrderByTransactionIdCopyWith<$Res> {
  __$GetOrderByTransactionIdCopyWithImpl(this._self, this._then);

  final _GetOrderByTransactionId _self;
  final $Res Function(_GetOrderByTransactionId) _then;

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(_GetOrderByTransactionId(
      null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _GetItemsByTransactionId implements TransactionEvent {
  const _GetItemsByTransactionId(this.id);

  final int id;

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GetItemsByTransactionIdCopyWith<_GetItemsByTransactionId> get copyWith =>
      __$GetItemsByTransactionIdCopyWithImpl<_GetItemsByTransactionId>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetItemsByTransactionId &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'TransactionEvent.getItemsByTransactionId(id: $id)';
  }
}

/// @nodoc
abstract mixin class _$GetItemsByTransactionIdCopyWith<$Res>
    implements $TransactionEventCopyWith<$Res> {
  factory _$GetItemsByTransactionIdCopyWith(_GetItemsByTransactionId value,
          $Res Function(_GetItemsByTransactionId) _then) =
      __$GetItemsByTransactionIdCopyWithImpl;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$GetItemsByTransactionIdCopyWithImpl<$Res>
    implements _$GetItemsByTransactionIdCopyWith<$Res> {
  __$GetItemsByTransactionIdCopyWithImpl(this._self, this._then);

  final _GetItemsByTransactionId _self;
  final $Res Function(_GetItemsByTransactionId) _then;

  /// Create a copy of TransactionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(_GetItemsByTransactionId(
      null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$TransactionState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TransactionState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TransactionState()';
  }
}

/// @nodoc
class $TransactionStateCopyWith<$Res> {
  $TransactionStateCopyWith(
      TransactionState _, $Res Function(TransactionState) __);
}

/// Adds pattern-matching-related methods to [TransactionState].
extension TransactionStatePatterns on TransactionState {
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
    TResult Function(List<TransactionModel>? transactions,
            List<TransactionItemModel>? items, TransactionModel? transaction)?
        success,
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
        return success(_that.transactions, _that.items, _that.transaction);
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
    required TResult Function(List<TransactionModel>? transactions,
            List<TransactionItemModel>? items, TransactionModel? transaction)
        success,
    required TResult Function(String message) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case _Loading():
        return loading();
      case _Success():
        return success(_that.transactions, _that.items, _that.transaction);
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
    TResult? Function(List<TransactionModel>? transactions,
            List<TransactionItemModel>? items, TransactionModel? transaction)?
        success,
    TResult? Function(String message)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading();
      case _Success() when success != null:
        return success(_that.transactions, _that.items, _that.transaction);
      case _Error() when error != null:
        return error(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements TransactionState {
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
    return 'TransactionState.initial()';
  }
}

/// @nodoc

class _Loading implements TransactionState {
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
    return 'TransactionState.loading()';
  }
}

/// @nodoc

class _Success implements TransactionState {
  const _Success(final List<TransactionModel>? transactions,
      final List<TransactionItemModel>? items, this.transaction)
      : _transactions = transactions,
        _items = items;

  final List<TransactionModel>? _transactions;
  List<TransactionModel>? get transactions {
    final value = _transactions;
    if (value == null) return null;
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<TransactionItemModel>? _items;
  List<TransactionItemModel>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final TransactionModel? transaction;

  /// Create a copy of TransactionState
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
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_transactions),
      const DeepCollectionEquality().hash(_items),
      transaction);

  @override
  String toString() {
    return 'TransactionState.success(transactions: $transactions, items: $items, transaction: $transaction)';
  }
}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res>
    implements $TransactionStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) =
      __$SuccessCopyWithImpl;
  @useResult
  $Res call(
      {List<TransactionModel>? transactions,
      List<TransactionItemModel>? items,
      TransactionModel? transaction});
}

/// @nodoc
class __$SuccessCopyWithImpl<$Res> implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

  /// Create a copy of TransactionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? transactions = freezed,
    Object? items = freezed,
    Object? transaction = freezed,
  }) {
    return _then(_Success(
      freezed == transactions
          ? _self._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<TransactionModel>?,
      freezed == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<TransactionItemModel>?,
      freezed == transaction
          ? _self.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as TransactionModel?,
    ));
  }
}

/// @nodoc

class _Error implements TransactionState {
  const _Error(this.message);

  final String message;

  /// Create a copy of TransactionState
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
    return 'TransactionState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $TransactionStateCopyWith<$Res> {
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

  /// Create a copy of TransactionState
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
