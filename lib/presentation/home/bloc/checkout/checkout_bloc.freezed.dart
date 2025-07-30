// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CheckoutEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CheckoutEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CheckoutEvent()';
  }
}

/// @nodoc
class $CheckoutEventCopyWith<$Res> {
  $CheckoutEventCopyWith(CheckoutEvent _, $Res Function(CheckoutEvent) __);
}

/// Adds pattern-matching-related methods to [CheckoutEvent].
extension CheckoutEventPatterns on CheckoutEvent {
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
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_IncrementProduct value)? incrementProduct,
    TResult Function(_DecrementProduct value)? decrementProduct,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that);
      case _AddToCart() when addToCart != null:
        return addToCart(_that);
      case _RemoveFromCart() when removeFromCart != null:
        return removeFromCart(_that);
      case _IncrementProduct() when incrementProduct != null:
        return incrementProduct(_that);
      case _DecrementProduct() when decrementProduct != null:
        return decrementProduct(_that);
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
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_IncrementProduct value) incrementProduct,
    required TResult Function(_DecrementProduct value) decrementProduct,
  }) {
    final _that = this;
    switch (_that) {
      case _Started():
        return started(_that);
      case _AddToCart():
        return addToCart(_that);
      case _RemoveFromCart():
        return removeFromCart(_that);
      case _IncrementProduct():
        return incrementProduct(_that);
      case _DecrementProduct():
        return decrementProduct(_that);
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
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_IncrementProduct value)? incrementProduct,
    TResult? Function(_DecrementProduct value)? decrementProduct,
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that);
      case _AddToCart() when addToCart != null:
        return addToCart(_that);
      case _RemoveFromCart() when removeFromCart != null:
        return removeFromCart(_that);
      case _IncrementProduct() when incrementProduct != null:
        return incrementProduct(_that);
      case _DecrementProduct() when decrementProduct != null:
        return decrementProduct(_that);
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
    TResult Function(Product product)? addToCart,
    TResult Function(Product product)? removeFromCart,
    TResult Function(Product product)? incrementProduct,
    TResult Function(Product product)? decrementProduct,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started();
      case _AddToCart() when addToCart != null:
        return addToCart(_that.product);
      case _RemoveFromCart() when removeFromCart != null:
        return removeFromCart(_that.product);
      case _IncrementProduct() when incrementProduct != null:
        return incrementProduct(_that.product);
      case _DecrementProduct() when decrementProduct != null:
        return decrementProduct(_that.product);
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
    required TResult Function(Product product) addToCart,
    required TResult Function(Product product) removeFromCart,
    required TResult Function(Product product) incrementProduct,
    required TResult Function(Product product) decrementProduct,
  }) {
    final _that = this;
    switch (_that) {
      case _Started():
        return started();
      case _AddToCart():
        return addToCart(_that.product);
      case _RemoveFromCart():
        return removeFromCart(_that.product);
      case _IncrementProduct():
        return incrementProduct(_that.product);
      case _DecrementProduct():
        return decrementProduct(_that.product);
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
    TResult? Function(Product product)? addToCart,
    TResult? Function(Product product)? removeFromCart,
    TResult? Function(Product product)? incrementProduct,
    TResult? Function(Product product)? decrementProduct,
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started();
      case _AddToCart() when addToCart != null:
        return addToCart(_that.product);
      case _RemoveFromCart() when removeFromCart != null:
        return removeFromCart(_that.product);
      case _IncrementProduct() when incrementProduct != null:
        return incrementProduct(_that.product);
      case _DecrementProduct() when decrementProduct != null:
        return decrementProduct(_that.product);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Started implements CheckoutEvent {
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
    return 'CheckoutEvent.started()';
  }
}

/// @nodoc

class _AddToCart implements CheckoutEvent {
  const _AddToCart({required this.product});

  final Product product;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AddToCartCopyWith<_AddToCart> get copyWith =>
      __$AddToCartCopyWithImpl<_AddToCart>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddToCart &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  @override
  String toString() {
    return 'CheckoutEvent.addToCart(product: $product)';
  }
}

/// @nodoc
abstract mixin class _$AddToCartCopyWith<$Res>
    implements $CheckoutEventCopyWith<$Res> {
  factory _$AddToCartCopyWith(
          _AddToCart value, $Res Function(_AddToCart) _then) =
      __$AddToCartCopyWithImpl;
  @useResult
  $Res call({Product product});
}

/// @nodoc
class __$AddToCartCopyWithImpl<$Res> implements _$AddToCartCopyWith<$Res> {
  __$AddToCartCopyWithImpl(this._self, this._then);

  final _AddToCart _self;
  final $Res Function(_AddToCart) _then;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? product = null,
  }) {
    return _then(_AddToCart(
      product: null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
    ));
  }
}

/// @nodoc

class _RemoveFromCart implements CheckoutEvent {
  const _RemoveFromCart({required this.product});

  final Product product;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RemoveFromCartCopyWith<_RemoveFromCart> get copyWith =>
      __$RemoveFromCartCopyWithImpl<_RemoveFromCart>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RemoveFromCart &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  @override
  String toString() {
    return 'CheckoutEvent.removeFromCart(product: $product)';
  }
}

/// @nodoc
abstract mixin class _$RemoveFromCartCopyWith<$Res>
    implements $CheckoutEventCopyWith<$Res> {
  factory _$RemoveFromCartCopyWith(
          _RemoveFromCart value, $Res Function(_RemoveFromCart) _then) =
      __$RemoveFromCartCopyWithImpl;
  @useResult
  $Res call({Product product});
}

/// @nodoc
class __$RemoveFromCartCopyWithImpl<$Res>
    implements _$RemoveFromCartCopyWith<$Res> {
  __$RemoveFromCartCopyWithImpl(this._self, this._then);

  final _RemoveFromCart _self;
  final $Res Function(_RemoveFromCart) _then;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? product = null,
  }) {
    return _then(_RemoveFromCart(
      product: null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
    ));
  }
}

/// @nodoc

class _IncrementProduct implements CheckoutEvent {
  const _IncrementProduct({required this.product});

  final Product product;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IncrementProductCopyWith<_IncrementProduct> get copyWith =>
      __$IncrementProductCopyWithImpl<_IncrementProduct>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IncrementProduct &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  @override
  String toString() {
    return 'CheckoutEvent.incrementProduct(product: $product)';
  }
}

/// @nodoc
abstract mixin class _$IncrementProductCopyWith<$Res>
    implements $CheckoutEventCopyWith<$Res> {
  factory _$IncrementProductCopyWith(
          _IncrementProduct value, $Res Function(_IncrementProduct) _then) =
      __$IncrementProductCopyWithImpl;
  @useResult
  $Res call({Product product});
}

/// @nodoc
class __$IncrementProductCopyWithImpl<$Res>
    implements _$IncrementProductCopyWith<$Res> {
  __$IncrementProductCopyWithImpl(this._self, this._then);

  final _IncrementProduct _self;
  final $Res Function(_IncrementProduct) _then;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? product = null,
  }) {
    return _then(_IncrementProduct(
      product: null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
    ));
  }
}

/// @nodoc

class _DecrementProduct implements CheckoutEvent {
  const _DecrementProduct({required this.product});

  final Product product;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DecrementProductCopyWith<_DecrementProduct> get copyWith =>
      __$DecrementProductCopyWithImpl<_DecrementProduct>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DecrementProduct &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  @override
  String toString() {
    return 'CheckoutEvent.decrementProduct(product: $product)';
  }
}

/// @nodoc
abstract mixin class _$DecrementProductCopyWith<$Res>
    implements $CheckoutEventCopyWith<$Res> {
  factory _$DecrementProductCopyWith(
          _DecrementProduct value, $Res Function(_DecrementProduct) _then) =
      __$DecrementProductCopyWithImpl;
  @useResult
  $Res call({Product product});
}

/// @nodoc
class __$DecrementProductCopyWithImpl<$Res>
    implements _$DecrementProductCopyWith<$Res> {
  __$DecrementProductCopyWithImpl(this._self, this._then);

  final _DecrementProduct _self;
  final $Res Function(_DecrementProduct) _then;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? product = null,
  }) {
    return _then(_DecrementProduct(
      product: null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
    ));
  }
}

/// @nodoc
mixin _$CheckoutState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CheckoutState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CheckoutState()';
  }
}

/// @nodoc
class $CheckoutStateCopyWith<$Res> {
  $CheckoutStateCopyWith(CheckoutState _, $Res Function(CheckoutState) __);
}

/// Adds pattern-matching-related methods to [CheckoutState].
extension CheckoutStatePatterns on CheckoutState {
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
    TResult Function(List<ProductQuantity> cart, double subtotal, double total,
            int quantity)?
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
        return success(_that.cart, _that.subtotal, _that.total, _that.quantity);
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
    required TResult Function(List<ProductQuantity> cart, double subtotal,
            double total, int quantity)
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
        return success(_that.cart, _that.subtotal, _that.total, _that.quantity);
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
    TResult? Function(List<ProductQuantity> cart, double subtotal, double total,
            int quantity)?
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
        return success(_that.cart, _that.subtotal, _that.total, _that.quantity);
      case _Error() when error != null:
        return error(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements CheckoutState {
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
    return 'CheckoutState.initial()';
  }
}

/// @nodoc

class _Loading implements CheckoutState {
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
    return 'CheckoutState.loading()';
  }
}

/// @nodoc

class _Success implements CheckoutState {
  const _Success(final List<ProductQuantity> cart, this.subtotal, this.total,
      this.quantity)
      : _cart = cart;

  final List<ProductQuantity> _cart;
  List<ProductQuantity> get cart {
    if (_cart is EqualUnmodifiableListView) return _cart;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cart);
  }

// double discount,
// double tax,
  final double subtotal;
  final double total;
  final int quantity;

  /// Create a copy of CheckoutState
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
            const DeepCollectionEquality().equals(other._cart, _cart) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_cart), subtotal, total, quantity);

  @override
  String toString() {
    return 'CheckoutState.success(cart: $cart, subtotal: $subtotal, total: $total, quantity: $quantity)';
  }
}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res>
    implements $CheckoutStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) =
      __$SuccessCopyWithImpl;
  @useResult
  $Res call(
      {List<ProductQuantity> cart,
      double subtotal,
      double total,
      int quantity});
}

/// @nodoc
class __$SuccessCopyWithImpl<$Res> implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? cart = null,
    Object? subtotal = null,
    Object? total = null,
    Object? quantity = null,
  }) {
    return _then(_Success(
      null == cart
          ? _self._cart
          : cart // ignore: cast_nullable_to_non_nullable
              as List<ProductQuantity>,
      null == subtotal
          ? _self.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _Error implements CheckoutState {
  const _Error(this.message);

  final String message;

  /// Create a copy of CheckoutState
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
    return 'CheckoutState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $CheckoutStateCopyWith<$Res> {
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

  /// Create a copy of CheckoutState
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
