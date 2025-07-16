import 'package:bloc/bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:eky_pos/data/models/responses/category_response_model.dart';
import 'package:eky_pos/data/datasources/db_local_datasource.dart';

part 'category_bloc.freezed.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {

  final _uuid = Uuid();
  
  CategoryBloc() : super(_Initial()) {

    final dbLocalDatasource = DBLocalDatasource.instance;
    
    on<_GetCategories>((event, emit) async {
      emit(CategoryState.loading());
      final result = await dbLocalDatasource.getAllCategory();
      emit(CategoryState.success(result));
    });

    on<_AddCategory>((event, emit) async {
      emit(CategoryState.loading());
      final category = Category(
        name: event.name,        
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      await dbLocalDatasource.saveCategory(category);
      add(_GetCategories());
    });

    on<_UpdateCategory>((event, emit) async {
      emit(CategoryState.loading());
      await dbLocalDatasource.updateCategory(
        event.id,
        event.name,
      );
      add(_GetCategories());
    });

    on<_DeleteCategory>((event, emit) async {
      emit(CategoryState.loading());
      await dbLocalDatasource.deleteCategory(event.id);
      add(_GetCategories());
    });
  }
}
