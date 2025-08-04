// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoryEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CategoryEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CategoryEvent()';
  }
}

/// @nodoc
class $CategoryEventCopyWith<$Res> {
  $CategoryEventCopyWith(CategoryEvent _, $Res Function(CategoryEvent) __);
}

/// Adds pattern-matching-related methods to [CategoryEvent].
extension CategoryEventPatterns on CategoryEvent {
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
    TResult Function(_GetCategories value)? getCategories,
    TResult Function(_AddCategory value)? addCategory,
    TResult Function(_UpdateCategory value)? updateCategory,
    TResult Function(_DeleteCategory value)? deleteCategory,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GetCategories() when getCategories != null:
        return getCategories(_that);
      case _AddCategory() when addCategory != null:
        return addCategory(_that);
      case _UpdateCategory() when updateCategory != null:
        return updateCategory(_that);
      case _DeleteCategory() when deleteCategory != null:
        return deleteCategory(_that);
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
    required TResult Function(_GetCategories value) getCategories,
    required TResult Function(_AddCategory value) addCategory,
    required TResult Function(_UpdateCategory value) updateCategory,
    required TResult Function(_DeleteCategory value) deleteCategory,
  }) {
    final _that = this;
    switch (_that) {
      case _GetCategories():
        return getCategories(_that);
      case _AddCategory():
        return addCategory(_that);
      case _UpdateCategory():
        return updateCategory(_that);
      case _DeleteCategory():
        return deleteCategory(_that);
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
    TResult? Function(_GetCategories value)? getCategories,
    TResult? Function(_AddCategory value)? addCategory,
    TResult? Function(_UpdateCategory value)? updateCategory,
    TResult? Function(_DeleteCategory value)? deleteCategory,
  }) {
    final _that = this;
    switch (_that) {
      case _GetCategories() when getCategories != null:
        return getCategories(_that);
      case _AddCategory() when addCategory != null:
        return addCategory(_that);
      case _UpdateCategory() when updateCategory != null:
        return updateCategory(_that);
      case _DeleteCategory() when deleteCategory != null:
        return deleteCategory(_that);
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
    TResult Function()? getCategories,
    TResult Function(String name)? addCategory,
    TResult Function(int id, String name)? updateCategory,
    TResult Function(int id)? deleteCategory,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _GetCategories() when getCategories != null:
        return getCategories();
      case _AddCategory() when addCategory != null:
        return addCategory(_that.name);
      case _UpdateCategory() when updateCategory != null:
        return updateCategory(_that.id, _that.name);
      case _DeleteCategory() when deleteCategory != null:
        return deleteCategory(_that.id);
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
    required TResult Function() getCategories,
    required TResult Function(String name) addCategory,
    required TResult Function(int id, String name) updateCategory,
    required TResult Function(int id) deleteCategory,
  }) {
    final _that = this;
    switch (_that) {
      case _GetCategories():
        return getCategories();
      case _AddCategory():
        return addCategory(_that.name);
      case _UpdateCategory():
        return updateCategory(_that.id, _that.name);
      case _DeleteCategory():
        return deleteCategory(_that.id);
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
    TResult? Function()? getCategories,
    TResult? Function(String name)? addCategory,
    TResult? Function(int id, String name)? updateCategory,
    TResult? Function(int id)? deleteCategory,
  }) {
    final _that = this;
    switch (_that) {
      case _GetCategories() when getCategories != null:
        return getCategories();
      case _AddCategory() when addCategory != null:
        return addCategory(_that.name);
      case _UpdateCategory() when updateCategory != null:
        return updateCategory(_that.id, _that.name);
      case _DeleteCategory() when deleteCategory != null:
        return deleteCategory(_that.id);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _GetCategories implements CategoryEvent {
  const _GetCategories();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _GetCategories);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CategoryEvent.getCategories()';
  }
}

/// @nodoc

class _AddCategory implements CategoryEvent {
  const _AddCategory({required this.name});

  final String name;

  /// Create a copy of CategoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AddCategoryCopyWith<_AddCategory> get copyWith =>
      __$AddCategoryCopyWithImpl<_AddCategory>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddCategory &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  @override
  String toString() {
    return 'CategoryEvent.addCategory(name: $name)';
  }
}

/// @nodoc
abstract mixin class _$AddCategoryCopyWith<$Res>
    implements $CategoryEventCopyWith<$Res> {
  factory _$AddCategoryCopyWith(
          _AddCategory value, $Res Function(_AddCategory) _then) =
      __$AddCategoryCopyWithImpl;
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$AddCategoryCopyWithImpl<$Res> implements _$AddCategoryCopyWith<$Res> {
  __$AddCategoryCopyWithImpl(this._self, this._then);

  final _AddCategory _self;
  final $Res Function(_AddCategory) _then;

  /// Create a copy of CategoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
  }) {
    return _then(_AddCategory(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _UpdateCategory implements CategoryEvent {
  const _UpdateCategory({required this.id, required this.name});

  final int id;
  final String name;

  /// Create a copy of CategoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateCategoryCopyWith<_UpdateCategory> get copyWith =>
      __$UpdateCategoryCopyWithImpl<_UpdateCategory>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateCategory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'CategoryEvent.updateCategory(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$UpdateCategoryCopyWith<$Res>
    implements $CategoryEventCopyWith<$Res> {
  factory _$UpdateCategoryCopyWith(
          _UpdateCategory value, $Res Function(_UpdateCategory) _then) =
      __$UpdateCategoryCopyWithImpl;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$UpdateCategoryCopyWithImpl<$Res>
    implements _$UpdateCategoryCopyWith<$Res> {
  __$UpdateCategoryCopyWithImpl(this._self, this._then);

  final _UpdateCategory _self;
  final $Res Function(_UpdateCategory) _then;

  /// Create a copy of CategoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_UpdateCategory(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _DeleteCategory implements CategoryEvent {
  const _DeleteCategory({required this.id});

  final int id;

  /// Create a copy of CategoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeleteCategoryCopyWith<_DeleteCategory> get copyWith =>
      __$DeleteCategoryCopyWithImpl<_DeleteCategory>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeleteCategory &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'CategoryEvent.deleteCategory(id: $id)';
  }
}

/// @nodoc
abstract mixin class _$DeleteCategoryCopyWith<$Res>
    implements $CategoryEventCopyWith<$Res> {
  factory _$DeleteCategoryCopyWith(
          _DeleteCategory value, $Res Function(_DeleteCategory) _then) =
      __$DeleteCategoryCopyWithImpl;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$DeleteCategoryCopyWithImpl<$Res>
    implements _$DeleteCategoryCopyWith<$Res> {
  __$DeleteCategoryCopyWithImpl(this._self, this._then);

  final _DeleteCategory _self;
  final $Res Function(_DeleteCategory) _then;

  /// Create a copy of CategoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(_DeleteCategory(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$CategoryState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CategoryState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CategoryState()';
  }
}

/// @nodoc
class $CategoryStateCopyWith<$Res> {
  $CategoryStateCopyWith(CategoryState _, $Res Function(CategoryState) __);
}

/// Adds pattern-matching-related methods to [CategoryState].
extension CategoryStatePatterns on CategoryState {
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
    TResult Function(List<CategoryModel> categories)? success,
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
        return success(_that.categories);
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
    required TResult Function(List<CategoryModel> categories) success,
    required TResult Function(String message) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case _Loading():
        return loading();
      case _Success():
        return success(_that.categories);
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
    TResult? Function(List<CategoryModel> categories)? success,
    TResult? Function(String message)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading();
      case _Success() when success != null:
        return success(_that.categories);
      case _Error() when error != null:
        return error(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements CategoryState {
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
    return 'CategoryState.initial()';
  }
}

/// @nodoc

class _Loading implements CategoryState {
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
    return 'CategoryState.loading()';
  }
}

/// @nodoc

class _Success implements CategoryState {
  const _Success(final List<CategoryModel> categories)
      : _categories = categories;

  final List<CategoryModel> _categories;
  List<CategoryModel> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  /// Create a copy of CategoryState
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
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories));

  @override
  String toString() {
    return 'CategoryState.success(categories: $categories)';
  }
}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res>
    implements $CategoryStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) =
      __$SuccessCopyWithImpl;
  @useResult
  $Res call({List<CategoryModel> categories});
}

/// @nodoc
class __$SuccessCopyWithImpl<$Res> implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

  /// Create a copy of CategoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? categories = null,
  }) {
    return _then(_Success(
      null == categories
          ? _self._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
    ));
  }
}

/// @nodoc

class _Error implements CategoryState {
  const _Error(this.message);

  final String message;

  /// Create a copy of CategoryState
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
    return 'CategoryState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $CategoryStateCopyWith<$Res> {
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

  /// Create a copy of CategoryState
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
