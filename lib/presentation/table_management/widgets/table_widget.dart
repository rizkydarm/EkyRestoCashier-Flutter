import 'package:flutter/material.dart';
import 'package:eky_pos/presentation/table_management/models/restotable_model.dart';

class TableWidget extends StatefulWidget {
  final RestaurantTable table;
  final Function(RestaurantTable) onPositionChanged;
  final Function(RestaurantTable) onTap;
  final GlobalKey canvasKey;

  const TableWidget({
    super.key,
    required this.table,
    required this.onPositionChanged,
    required this.onTap,
    required this.canvasKey,
  });

  @override
  State<TableWidget> createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  late double _x;
  late double _y;
  final GlobalKey _widgetKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _x = widget.table.x;
    _y = widget.table.y;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _x,
      top: _y,
      child: GestureDetector(
        onTap: () => widget.onTap(widget.table),
        child: Draggable(
          feedback: _buildTableWidget(true),
          childWhenDragging: SizedBox(), // Empty when dragging
          onDragEnd: (details) {
            // Get canvas render box
            final RenderBox canvasRenderBox = widget.canvasKey.currentContext!.findRenderObject() as RenderBox;
            
            // Convert global coordinates to canvas coordinates
            final Offset canvasPosition = canvasRenderBox.localToGlobal(Offset.zero);
            final Offset globalPosition = details.offset;
            
            // Calculate relative position
            final double relativeX = globalPosition.dx - canvasPosition.dx;
            final double relativeY = globalPosition.dy - canvasPosition.dy;
            
            // Ensure position stays within canvas bounds
            final double boundedX = relativeX.clamp(0.0, canvasRenderBox.size.width - widget.table.width); // 80 is table width
            final double boundedY = relativeY.clamp(0.0, canvasRenderBox.size.height - widget.table.height); // 80 is table height
            
            setState(() {
              _x = boundedX;
              _y = boundedY;
              widget.onPositionChanged(
                widget.table.copyWith(x: _x, y: _y),
              );
            });
          },
          child: _buildTableWidget(false, key: _widgetKey),
        ),
      ),
    );
  }

  Widget _buildTableWidget(bool isDragging, {Key? key}) {
    Color backgroundColor;
    IconData iconData;

    switch (widget.table.status) {
      case TableStatus.available:
        backgroundColor = Colors.green;
        iconData = Icons.check_circle;
        break;
      case TableStatus.occupied:
        backgroundColor = Colors.red;
        iconData = Icons.people;
        break;
      case TableStatus.reserved:
        backgroundColor = Colors.orange;
        iconData = Icons.event_available;
        break;
      case TableStatus.dirty:
        backgroundColor = Colors.grey;
        iconData = Icons.cleaning_services;
        break;
    }

    return Container(
      key: key,
      width: widget.table.width,
      height: widget.table.height,
      decoration: BoxDecoration(
        color: backgroundColor.withValues(alpha: isDragging ? 0.7 : 1.0),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
        boxShadow: isDragging ? [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(4, 4),
          )
        ] : [],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconData, color: Colors.white, size: 24),
          Text(
            widget.table.name,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          Text(
            '${widget.table.capacity}',
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}