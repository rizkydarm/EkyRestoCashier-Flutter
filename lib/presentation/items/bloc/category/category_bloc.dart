import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:eky_pos/data/datasources/category_remote_datasource.dart';
import 'package:eky_pos/data/models/responses/category_response_model.dart';

import '../../../../data/datasources/db_local_datasource.dart';

part 'category_bloc.freezed.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRemoteDataSource categoryRemoteDataSource;
  List<Category> categories = [];
  CategoryBloc(
    this.categoryRemoteDataSource,
  ) : super(_Initial()) {
    on<_GetCategories>((event, emit) async {
      emit(CategoryState.loading());
      final result = await categoryRemoteDataSource.getCategories();
      result.fold(
        (l) => emit(_Error(l)),
        (r) {
          categories = r.data ?? [];
          emit(_Success(r.data ?? []));
        },
      );
    });

    //add
    on<_AddCategory>((event, emit) async {
      emit(CategoryState.loading());
      final result = await categoryRemoteDataSource.addCategory(
        event.name,
      );
      result.fold(
        (l) => emit(_Error(l)),
        (r) {
          add(_GetCategories());
        },
      );
    });

    //update
    on<_UpdateCategory>((event, emit) async {
      emit(CategoryState.loading());
      final result = await categoryRemoteDataSource.updateCategory(
        event.id,
        event.name,
      );
      result.fold(
        (l) => emit(_Error(l)),
        (r) {
          add(_GetCategories());
        },
      );
    });

    on<_FetchLocal>((event, emit) async {
      emit(const _Loading());
      final localCategories = await DBLocalDatasource.instance.getAllCategory();
      categories = localCategories;

      emit(_Success(categories));
    });
  }
}
