import 'package:flutter/material.dart';
import 'package:eky_pos/presentation/table_management/models/restotable_model.dart';

class TableManagementProvider with ChangeNotifier {
  final List<RestaurantTable> _tables = [];
  List<RestaurantTable> get tables => _tables;

  void addTable(RestaurantTable table) {
    _tables.add(table);
    notifyListeners();
  }

  void updateTable(RestaurantTable updatedTable) {
    final index = _tables.indexWhere((table) => table.id == updatedTable.id);
    if (index != -1) {
      _tables[index] = updatedTable;
      notifyListeners();
    }
  }

  void removeTable(int tableId) {
    _tables.removeWhere((table) => table.id == tableId);
    notifyListeners();
  }

  RestaurantTable? getTableById(int id) {
    return _tables.firstWhere((table) => table.id == id);
  }
}