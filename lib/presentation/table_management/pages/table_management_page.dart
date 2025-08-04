import 'package:eky_pos/presentation/table_management/bloc/table_manag_bloc.dart';
import 'package:eky_pos/presentation/table_management/models/restotable_model.dart';
import 'package:eky_pos/presentation/table_management/widgets/table_detail_bottomsheet.dart';
import 'package:eky_pos/presentation/table_management/widgets/table_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TableManagementPage extends StatefulWidget {
  
  final ValueNotifier<bool>? toggleSideMenuNotifier;
  
  const TableManagementPage({super.key, this.toggleSideMenuNotifier});

  @override
  State<TableManagementPage> createState() => _TableManagementPageState();
}

class _TableManagementPageState extends State<TableManagementPage> {
  final GlobalKey _canvasKey = GlobalKey(); 
  
  final double canvasWidth = 1000;
  final double canvasHeight = 1000;

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
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: constraints.maxWidth,
                minHeight: constraints.maxHeight,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: canvasWidth,
                  height: canvasHeight,
                  child: ColoredBox(
                    color: Colors.grey[200] ?? Colors.white,
                    child: BlocBuilder<TableManagementBloc, TableManagementState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          orElse: () => SizedBox(),
                          error: (error) => Center(child: Text(error)),
                          loading: () => Center(child: CircularProgressIndicator()),
                          success: (tables) {
                            return Stack(
                              key: _canvasKey,
                              children: [
                                LayoutBuilder(
                                  builder: (context, constraints) {
                                    return CustomPaint(
                                      size: Size(constraints.maxWidth, constraints.maxHeight),
                                      painter: GridPainter(),
                                    );
                                  },
                                ),
                                ...tables.map((table) => TableWidget(
                                  key: ValueKey(table.id),
                                  table: table,
                                  onPositionChanged: (updatedTable) {
                                    context.read<TableManagementBloc>().add(TableManagementEvent.updateTable(table: updatedTable));
                                  },
                                  onTap: _showTableDetails,
                                  canvasKey: _canvasKey,
                                )),
                              ],
                            );
                          }
                        );
                      }
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }

  void _addNewTable() {
    final tableCounter = context.read<TableManagementBloc>().tableCounter;
    
    final newTable = RestaurantTable(
      id: tableCounter,
      name: 'T$tableCounter',
      x: 100.0 + (tableCounter * 20) % 200,
      y: 100.0 + (tableCounter * 30) % 200,
      capacity: 4,
    );

    context.read<TableManagementBloc>().add(TableManagementEvent.addTable(table: newTable));
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
