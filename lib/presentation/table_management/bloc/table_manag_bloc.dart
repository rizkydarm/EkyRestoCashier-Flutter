import 'package:eky_pos/presentation/table_management/models/restotable_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'table_manag_bloc.freezed.dart';
part 'table_manag_event.dart';
part 'table_manag_state.dart';

class TableManagementBloc extends Bloc<TableManagementEvent, TableManagementState> {
  
  int _tableCounter = 1;

  TableManagementBloc() : super(_Success([])) {

    on<_AddTable>((event, emit) {
      final state = this.state as _Success;
      final tables = <RestaurantTable>[];
      tables.addAll(state.tables);
      tables.add(event.table);
      _tableCounter++;
      emit(_Success(tables));
    });

    on<_UpdateTable>((event, emit) {
      final state = this.state as _Success;
      final tables = <RestaurantTable>[];
      tables.addAll(state.tables);
     final index = tables.indexWhere((table) => table.id == event.table.id);
      if (index != -1) {
        tables[index] = event.table;
        emit(_Success(tables));
      }
    });

    on<_RemoveTable>((event, emit) {
      final state = this.state as _Success;
      final tables = <RestaurantTable>[];
      tables.addAll(state.tables);
      tables.removeWhere((table) => table.id == event.tableId);
      emit(_Success(tables));
    });

    on<_GetTableById>((event, emit) {
      // final state = this.state as _Success;
      // final tables = <RestaurantTable>[];
      // tables.addAll(state.tables);
      // final table = tables.firstWhere((table) => table.id == event.tableId);
      // emit(_Success([table]));
    });
  }

  int get tableCounter => _tableCounter;
}