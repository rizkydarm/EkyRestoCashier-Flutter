part of 'category_bloc.dart';

@freezed
class CategoryEvent with _$CategoryEvent {
  const factory CategoryEvent.getCategories() = _GetCategories;
  const factory CategoryEvent.addCategory({
    required String name,
  }) = _AddCategory;
  const factory CategoryEvent.updateCategory({
    required int id,
    required String name,
  }) = _UpdateCategory;
  const factory CategoryEvent.deleteCategory({
    required int id,
  }) = _DeleteCategory;
}
