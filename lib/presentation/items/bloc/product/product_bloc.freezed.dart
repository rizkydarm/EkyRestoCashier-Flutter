// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProductEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProductEvent()';
  }
}

/// @nodoc
class $ProductEventCopyWith<$Res> {
  $ProductEventCopyWith(ProductEvent _, $Res Function(ProductEvent) __);
}

/// Adds pattern-matching-related methods to [ProductEvent].
extension ProductEventPatterns on ProductEvent {
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
    TResult Function(_GetProducts value)? getProducts,
    TResult Function(_GetProductById value)? getProductById,
    TResult Function(_AddProduct value)? addProduct,
    TResult Function(_EditProduct value)? editProduct,
    TResult Function(_DeleteProduct value)? deleteProduct,
    TResult Function(_SearchProduct value)? searchProduct,
    TResult Function(_UpdateStock value)? updateStock,
    TResult Function(_GetProductsByCategory value)? getProductsByCategory,
    TResult Function(_GetProductByBarcode value)? getProductByBarcode,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that);
      case _GetProducts() when getProducts != null:
        return getProducts(_that);
      case _GetProductById() when getProductById != null:
        return getProductById(_that);
      case _AddProduct() when addProduct != null:
        return addProduct(_that);
      case _EditProduct() when editProduct != null:
        return editProduct(_that);
      case _DeleteProduct() when deleteProduct != null:
        return deleteProduct(_that);
      case _SearchProduct() when searchProduct != null:
        return searchProduct(_that);
      case _UpdateStock() when updateStock != null:
        return updateStock(_that);
      case _GetProductsByCategory() when getProductsByCategory != null:
        return getProductsByCategory(_that);
      case _GetProductByBarcode() when getProductByBarcode != null:
        return getProductByBarcode(_that);
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
    required TResult Function(_GetProducts value) getProducts,
    required TResult Function(_GetProductById value) getProductById,
    required TResult Function(_AddProduct value) addProduct,
    required TResult Function(_EditProduct value) editProduct,
    required TResult Function(_DeleteProduct value) deleteProduct,
    required TResult Function(_SearchProduct value) searchProduct,
    required TResult Function(_UpdateStock value) updateStock,
    required TResult Function(_GetProductsByCategory value)
        getProductsByCategory,
    required TResult Function(_GetProductByBarcode value) getProductByBarcode,
  }) {
    final _that = this;
    switch (_that) {
      case _Started():
        return started(_that);
      case _GetProducts():
        return getProducts(_that);
      case _GetProductById():
        return getProductById(_that);
      case _AddProduct():
        return addProduct(_that);
      case _EditProduct():
        return editProduct(_that);
      case _DeleteProduct():
        return deleteProduct(_that);
      case _SearchProduct():
        return searchProduct(_that);
      case _UpdateStock():
        return updateStock(_that);
      case _GetProductsByCategory():
        return getProductsByCategory(_that);
      case _GetProductByBarcode():
        return getProductByBarcode(_that);
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
    TResult? Function(_GetProducts value)? getProducts,
    TResult? Function(_GetProductById value)? getProductById,
    TResult? Function(_AddProduct value)? addProduct,
    TResult? Function(_EditProduct value)? editProduct,
    TResult? Function(_DeleteProduct value)? deleteProduct,
    TResult? Function(_SearchProduct value)? searchProduct,
    TResult? Function(_UpdateStock value)? updateStock,
    TResult? Function(_GetProductsByCategory value)? getProductsByCategory,
    TResult? Function(_GetProductByBarcode value)? getProductByBarcode,
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that);
      case _GetProducts() when getProducts != null:
        return getProducts(_that);
      case _GetProductById() when getProductById != null:
        return getProductById(_that);
      case _AddProduct() when addProduct != null:
        return addProduct(_that);
      case _EditProduct() when editProduct != null:
        return editProduct(_that);
      case _DeleteProduct() when deleteProduct != null:
        return deleteProduct(_that);
      case _SearchProduct() when searchProduct != null:
        return searchProduct(_that);
      case _UpdateStock() when updateStock != null:
        return updateStock(_that);
      case _GetProductsByCategory() when getProductsByCategory != null:
        return getProductsByCategory(_that);
      case _GetProductByBarcode() when getProductByBarcode != null:
        return getProductByBarcode(_that);
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
    TResult Function()? getProducts,
    TResult Function(String id)? getProductById,
    TResult Function(ProductModel product)? addProduct,
    TResult Function(ProductModel product, int id)? editProduct,
    TResult Function(int id)? deleteProduct,
    TResult Function(String query)? searchProduct,
    TResult Function(int stock, String type, String note, int id)? updateStock,
    TResult Function(int categoryId)? getProductsByCategory,
    TResult Function(String barcode)? getProductByBarcode,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started();
      case _GetProducts() when getProducts != null:
        return getProducts();
      case _GetProductById() when getProductById != null:
        return getProductById(_that.id);
      case _AddProduct() when addProduct != null:
        return addProduct(_that.product);
      case _EditProduct() when editProduct != null:
        return editProduct(_that.product, _that.id);
      case _DeleteProduct() when deleteProduct != null:
        return deleteProduct(_that.id);
      case _SearchProduct() when searchProduct != null:
        return searchProduct(_that.query);
      case _UpdateStock() when updateStock != null:
        return updateStock(_that.stock, _that.type, _that.note, _that.id);
      case _GetProductsByCategory() when getProductsByCategory != null:
        return getProductsByCategory(_that.categoryId);
      case _GetProductByBarcode() when getProductByBarcode != null:
        return getProductByBarcode(_that.barcode);
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
    required TResult Function() getProducts,
    required TResult Function(String id) getProductById,
    required TResult Function(ProductModel product) addProduct,
    required TResult Function(ProductModel product, int id) editProduct,
    required TResult Function(int id) deleteProduct,
    required TResult Function(String query) searchProduct,
    required TResult Function(int stock, String type, String note, int id)
        updateStock,
    required TResult Function(int categoryId) getProductsByCategory,
    required TResult Function(String barcode) getProductByBarcode,
  }) {
    final _that = this;
    switch (_that) {
      case _Started():
        return started();
      case _GetProducts():
        return getProducts();
      case _GetProductById():
        return getProductById(_that.id);
      case _AddProduct():
        return addProduct(_that.product);
      case _EditProduct():
        return editProduct(_that.product, _that.id);
      case _DeleteProduct():
        return deleteProduct(_that.id);
      case _SearchProduct():
        return searchProduct(_that.query);
      case _UpdateStock():
        return updateStock(_that.stock, _that.type, _that.note, _that.id);
      case _GetProductsByCategory():
        return getProductsByCategory(_that.categoryId);
      case _GetProductByBarcode():
        return getProductByBarcode(_that.barcode);
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
    TResult? Function()? getProducts,
    TResult? Function(String id)? getProductById,
    TResult? Function(ProductModel product)? addProduct,
    TResult? Function(ProductModel product, int id)? editProduct,
    TResult? Function(int id)? deleteProduct,
    TResult? Function(String query)? searchProduct,
    TResult? Function(int stock, String type, String note, int id)? updateStock,
    TResult? Function(int categoryId)? getProductsByCategory,
    TResult? Function(String barcode)? getProductByBarcode,
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started();
      case _GetProducts() when getProducts != null:
        return getProducts();
      case _GetProductById() when getProductById != null:
        return getProductById(_that.id);
      case _AddProduct() when addProduct != null:
        return addProduct(_that.product);
      case _EditProduct() when editProduct != null:
        return editProduct(_that.product, _that.id);
      case _DeleteProduct() when deleteProduct != null:
        return deleteProduct(_that.id);
      case _SearchProduct() when searchProduct != null:
        return searchProduct(_that.query);
      case _UpdateStock() when updateStock != null:
        return updateStock(_that.stock, _that.type, _that.note, _that.id);
      case _GetProductsByCategory() when getProductsByCategory != null:
        return getProductsByCategory(_that.categoryId);
      case _GetProductByBarcode() when getProductByBarcode != null:
        return getProductByBarcode(_that.barcode);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Started implements ProductEvent {
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
    return 'ProductEvent.started()';
  }
}

/// @nodoc

class _GetProducts implements ProductEvent {
  const _GetProducts();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _GetProducts);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProductEvent.getProducts()';
  }
}

/// @nodoc

class _GetProductById implements ProductEvent {
  const _GetProductById(this.id);

  final String id;

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GetProductByIdCopyWith<_GetProductById> get copyWith =>
      __$GetProductByIdCopyWithImpl<_GetProductById>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetProductById &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'ProductEvent.getProductById(id: $id)';
  }
}

/// @nodoc
abstract mixin class _$GetProductByIdCopyWith<$Res>
    implements $ProductEventCopyWith<$Res> {
  factory _$GetProductByIdCopyWith(
          _GetProductById value, $Res Function(_GetProductById) _then) =
      __$GetProductByIdCopyWithImpl;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$GetProductByIdCopyWithImpl<$Res>
    implements _$GetProductByIdCopyWith<$Res> {
  __$GetProductByIdCopyWithImpl(this._self, this._then);

  final _GetProductById _self;
  final $Res Function(_GetProductById) _then;

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(_GetProductById(
      null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _AddProduct implements ProductEvent {
  const _AddProduct(this.product);

  final ProductModel product;

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AddProductCopyWith<_AddProduct> get copyWith =>
      __$AddProductCopyWithImpl<_AddProduct>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddProduct &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  @override
  String toString() {
    return 'ProductEvent.addProduct(product: $product)';
  }
}

/// @nodoc
abstract mixin class _$AddProductCopyWith<$Res>
    implements $ProductEventCopyWith<$Res> {
  factory _$AddProductCopyWith(
          _AddProduct value, $Res Function(_AddProduct) _then) =
      __$AddProductCopyWithImpl;
  @useResult
  $Res call({ProductModel product});
}

/// @nodoc
class __$AddProductCopyWithImpl<$Res> implements _$AddProductCopyWith<$Res> {
  __$AddProductCopyWithImpl(this._self, this._then);

  final _AddProduct _self;
  final $Res Function(_AddProduct) _then;

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? product = null,
  }) {
    return _then(_AddProduct(
      null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel,
    ));
  }
}

/// @nodoc

class _EditProduct implements ProductEvent {
  const _EditProduct(this.product, this.id);

  final ProductModel product;
  final int id;

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EditProductCopyWith<_EditProduct> get copyWith =>
      __$EditProductCopyWithImpl<_EditProduct>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EditProduct &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product, id);

  @override
  String toString() {
    return 'ProductEvent.editProduct(product: $product, id: $id)';
  }
}

/// @nodoc
abstract mixin class _$EditProductCopyWith<$Res>
    implements $ProductEventCopyWith<$Res> {
  factory _$EditProductCopyWith(
          _EditProduct value, $Res Function(_EditProduct) _then) =
      __$EditProductCopyWithImpl;
  @useResult
  $Res call({ProductModel product, int id});
}

/// @nodoc
class __$EditProductCopyWithImpl<$Res> implements _$EditProductCopyWith<$Res> {
  __$EditProductCopyWithImpl(this._self, this._then);

  final _EditProduct _self;
  final $Res Function(_EditProduct) _then;

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? product = null,
    Object? id = null,
  }) {
    return _then(_EditProduct(
      null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel,
      null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _DeleteProduct implements ProductEvent {
  const _DeleteProduct(this.id);

  final int id;

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeleteProductCopyWith<_DeleteProduct> get copyWith =>
      __$DeleteProductCopyWithImpl<_DeleteProduct>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeleteProduct &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'ProductEvent.deleteProduct(id: $id)';
  }
}

/// @nodoc
abstract mixin class _$DeleteProductCopyWith<$Res>
    implements $ProductEventCopyWith<$Res> {
  factory _$DeleteProductCopyWith(
          _DeleteProduct value, $Res Function(_DeleteProduct) _then) =
      __$DeleteProductCopyWithImpl;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$DeleteProductCopyWithImpl<$Res>
    implements _$DeleteProductCopyWith<$Res> {
  __$DeleteProductCopyWithImpl(this._self, this._then);

  final _DeleteProduct _self;
  final $Res Function(_DeleteProduct) _then;

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(_DeleteProduct(
      null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _SearchProduct implements ProductEvent {
  const _SearchProduct(this.query);

  final String query;

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchProductCopyWith<_SearchProduct> get copyWith =>
      __$SearchProductCopyWithImpl<_SearchProduct>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchProduct &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @override
  String toString() {
    return 'ProductEvent.searchProduct(query: $query)';
  }
}

/// @nodoc
abstract mixin class _$SearchProductCopyWith<$Res>
    implements $ProductEventCopyWith<$Res> {
  factory _$SearchProductCopyWith(
          _SearchProduct value, $Res Function(_SearchProduct) _then) =
      __$SearchProductCopyWithImpl;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$SearchProductCopyWithImpl<$Res>
    implements _$SearchProductCopyWith<$Res> {
  __$SearchProductCopyWithImpl(this._self, this._then);

  final _SearchProduct _self;
  final $Res Function(_SearchProduct) _then;

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = null,
  }) {
    return _then(_SearchProduct(
      null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _UpdateStock implements ProductEvent {
  const _UpdateStock(this.stock, this.type, this.note, this.id);

  final int stock;
  final String type;
  final String note;
  final int id;

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateStockCopyWith<_UpdateStock> get copyWith =>
      __$UpdateStockCopyWithImpl<_UpdateStock>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateStock &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stock, type, note, id);

  @override
  String toString() {
    return 'ProductEvent.updateStock(stock: $stock, type: $type, note: $note, id: $id)';
  }
}

/// @nodoc
abstract mixin class _$UpdateStockCopyWith<$Res>
    implements $ProductEventCopyWith<$Res> {
  factory _$UpdateStockCopyWith(
          _UpdateStock value, $Res Function(_UpdateStock) _then) =
      __$UpdateStockCopyWithImpl;
  @useResult
  $Res call({int stock, String type, String note, int id});
}

/// @nodoc
class __$UpdateStockCopyWithImpl<$Res> implements _$UpdateStockCopyWith<$Res> {
  __$UpdateStockCopyWithImpl(this._self, this._then);

  final _UpdateStock _self;
  final $Res Function(_UpdateStock) _then;

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? stock = null,
    Object? type = null,
    Object? note = null,
    Object? id = null,
  }) {
    return _then(_UpdateStock(
      null == stock
          ? _self.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int,
      null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      null == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _GetProductsByCategory implements ProductEvent {
  const _GetProductsByCategory(this.categoryId);

  final int categoryId;

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GetProductsByCategoryCopyWith<_GetProductsByCategory> get copyWith =>
      __$GetProductsByCategoryCopyWithImpl<_GetProductsByCategory>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetProductsByCategory &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categoryId);

  @override
  String toString() {
    return 'ProductEvent.getProductsByCategory(categoryId: $categoryId)';
  }
}

/// @nodoc
abstract mixin class _$GetProductsByCategoryCopyWith<$Res>
    implements $ProductEventCopyWith<$Res> {
  factory _$GetProductsByCategoryCopyWith(_GetProductsByCategory value,
          $Res Function(_GetProductsByCategory) _then) =
      __$GetProductsByCategoryCopyWithImpl;
  @useResult
  $Res call({int categoryId});
}

/// @nodoc
class __$GetProductsByCategoryCopyWithImpl<$Res>
    implements _$GetProductsByCategoryCopyWith<$Res> {
  __$GetProductsByCategoryCopyWithImpl(this._self, this._then);

  final _GetProductsByCategory _self;
  final $Res Function(_GetProductsByCategory) _then;

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? categoryId = null,
  }) {
    return _then(_GetProductsByCategory(
      null == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _GetProductByBarcode implements ProductEvent {
  const _GetProductByBarcode(this.barcode);

  final String barcode;

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GetProductByBarcodeCopyWith<_GetProductByBarcode> get copyWith =>
      __$GetProductByBarcodeCopyWithImpl<_GetProductByBarcode>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetProductByBarcode &&
            (identical(other.barcode, barcode) || other.barcode == barcode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, barcode);

  @override
  String toString() {
    return 'ProductEvent.getProductByBarcode(barcode: $barcode)';
  }
}

/// @nodoc
abstract mixin class _$GetProductByBarcodeCopyWith<$Res>
    implements $ProductEventCopyWith<$Res> {
  factory _$GetProductByBarcodeCopyWith(_GetProductByBarcode value,
          $Res Function(_GetProductByBarcode) _then) =
      __$GetProductByBarcodeCopyWithImpl;
  @useResult
  $Res call({String barcode});
}

/// @nodoc
class __$GetProductByBarcodeCopyWithImpl<$Res>
    implements _$GetProductByBarcodeCopyWith<$Res> {
  __$GetProductByBarcodeCopyWithImpl(this._self, this._then);

  final _GetProductByBarcode _self;
  final $Res Function(_GetProductByBarcode) _then;

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? barcode = null,
  }) {
    return _then(_GetProductByBarcode(
      null == barcode
          ? _self.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$ProductState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProductState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProductState()';
  }
}

/// @nodoc
class $ProductStateCopyWith<$Res> {
  $ProductStateCopyWith(ProductState _, $Res Function(ProductState) __);
}

/// Adds pattern-matching-related methods to [ProductState].
extension ProductStatePatterns on ProductState {
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
    TResult Function(List<ProductModel> data)? success,
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
        return success(_that.data);
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
    required TResult Function(List<ProductModel> data) success,
    required TResult Function(String message) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case _Loading():
        return loading();
      case _Success():
        return success(_that.data);
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
    TResult? Function(List<ProductModel> data)? success,
    TResult? Function(String message)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading();
      case _Success() when success != null:
        return success(_that.data);
      case _Error() when error != null:
        return error(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements ProductState {
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
    return 'ProductState.initial()';
  }
}

/// @nodoc

class _Loading implements ProductState {
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
    return 'ProductState.loading()';
  }
}

/// @nodoc

class _Success implements ProductState {
  const _Success(final List<ProductModel> data) : _data = data;

  final List<ProductModel> _data;
  List<ProductModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  /// Create a copy of ProductState
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
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @override
  String toString() {
    return 'ProductState.success(data: $data)';
  }
}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res>
    implements $ProductStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) =
      __$SuccessCopyWithImpl;
  @useResult
  $Res call({List<ProductModel> data});
}

/// @nodoc
class __$SuccessCopyWithImpl<$Res> implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
  }) {
    return _then(_Success(
      null == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>,
    ));
  }
}

/// @nodoc

class _Error implements ProductState {
  const _Error(this.message);

  final String message;

  /// Create a copy of ProductState
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
    return 'ProductState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $ProductStateCopyWith<$Res> {
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

  /// Create a copy of ProductState
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
