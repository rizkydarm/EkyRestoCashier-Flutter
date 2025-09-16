import 'package:bloc/bloc.dart';
import 'package:eky_pos/data/datasources/category_datasource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:eky_pos/data/models/responses/category_response_model.dart';
import 'package:eky_pos/data/datasources/db_local_datasource.dart';

part 'category_bloc.freezed.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {

  CategoryBloc() : super(_Initial()) {

    final dbCategory = CategoryDataSource(dbLocal: DBLocalDatasource.instance);
    
    on<_GetCategories>((event, emit) async {
      emit(CategoryState.loading());
      await dbCategory.getAllCategory().then((result) {
        print("get categories");
        emit(CategoryState.success(result));
      }).onError((error, st) {
        print(st);
        emit(CategoryState.error(error.toString()));
      });
    });

    on<_AddCategory>((event, emit) async {
      emit(CategoryState.loading());
      final category = CategoryModel(
        name: event.name,        
        createdAt: DateTime.now(),
      );
      await dbCategory.saveCategory(category).then((value) {
        add(_GetCategories());
      }).onError((error, st) {
        print(st);
        emit(CategoryState.error(error.toString()));
      });
    });

    on<_UpdateCategory>((event, emit) async {
      emit(CategoryState.loading());
      await dbCategory.updateCategory(
        event.id,
        event.name,
      ).then((value) {
        add(_GetCategories());
      }).onError((error, st) {
        print(st);
        emit(CategoryState.error(error.toString()));
      });
    });

    on<_DeleteCategory>((event, emit) async {
      emit(CategoryState.loading());
      await dbCategory.deleteCategory(event.id).then((value) {
        add(_GetCategories());
      }).onError((error, st) {
        print(st);
        emit(CategoryState.error(error.toString()));
      });
    });
  }
}
