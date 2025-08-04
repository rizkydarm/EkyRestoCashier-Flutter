part of 'table_manag_bloc.dart';

@freezed
class TableManagementEvent with _$TableManagementEvent {
  const factory TableManagementEvent.started() = _Started;
  
  const factory TableManagementEvent.addTable({
    required RestaurantTable table,
  }) = _AddTable;

  const factory TableManagementEvent.updateTable({
    required RestaurantTable table,
  }) = _UpdateTable;

  const factory TableManagementEvent.removeTable({
    required int tableId,
  }) = _RemoveTable;

  const factory TableManagementEvent.getTableById({
    required int tableId,
  }) = _GetTableById;
}
