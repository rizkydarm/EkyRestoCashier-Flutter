import 'package:eky_pos/core/constants/colors.dart';
import 'package:eky_pos/presentation/table_management/models/restotable_model.dart';
import 'package:eky_pos/presentation/table_management/widgets/table_detail_bottomsheet.dart';
import 'package:eky_pos/presentation/table_management/widgets/table_provider.dart';
import 'package:eky_pos/presentation/table_management/widgets/table_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TableManagementPage extends StatefulWidget {
  
  final ValueNotifier<bool>? toggleSideMenuNotifier;
  
  const TableManagementPage({super.key, this.toggleSideMenuNotifier});

  @override
  State<TableManagementPage> createState() => _TableManagementPageState();
}

class _TableManagementPageState extends State<TableManagementPage> {
  final GlobalKey _canvasKey = GlobalKey();
  int _tableCounter = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Table Management'),
        leading: widget.toggleSideMenuNotifier != null ? IconButton(
          icon: const Icon(Icons.menu_open),
          onPressed: () => widget.toggleSideMenuNotifier!.value = !widget.toggleSideMenuNotifier!.value,
        ) : null,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewTable,
        child: Icon(Icons.add),
      ),
      body: Consumer<TableManagementProvider>(
        builder: (context, tableProvider, child) {
          return Container(
            color: Colors.grey[200],
            child: Stack(
              key: _canvasKey,
              children: [
                // Background grid (optional)
                _buildGridBackground(),
                
                // Tables
                ...tableProvider.tables.map((table) => TableWidget(
                      key: ValueKey(table.id),
                      table: table,
                      onPositionChanged: (updatedTable) {
                        tableProvider.updateTable(updatedTable);
                      },
                      onTap: _showTableDetails,
                    )),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildGridBackground() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return CustomPaint(
          size: Size(constraints.maxWidth, constraints.maxHeight),
          painter: GridPainter(),
        );
      },
    );
  }

  void _addNewTable() {
    final tableProvider = Provider.of<TableManagementProvider>(context, listen: false);
    
    final newTable = RestaurantTable(
      id: _tableCounter,
      name: 'T$_tableCounter',
      x: 100.0 + (_tableCounter * 20) % 200,
      y: 100.0 + (_tableCounter * 30) % 200,
      capacity: 4,
    );

    tableProvider.addTable(newTable);
    _tableCounter++;
  }

  void _showTableDetails(RestaurantTable table) {
    showModalBottomSheet(
      context: context,
      builder: (context) => TableDetailsSheet(table: table),
    );
  }
}

class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey[300]!
      ..strokeWidth = 1;

    // Draw vertical lines
    for (double i = 0; i <= size.width; i += 20) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }

    // Draw horizontal lines
    for (double i = 0; i <= size.height; i += 20) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
