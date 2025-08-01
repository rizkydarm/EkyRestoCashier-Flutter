import 'package:eky_pos/presentation/table_management/models/restotable_model.dart';
import 'package:eky_pos/presentation/table_management/widgets/table_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TableDetailsSheet extends StatefulWidget {
  final RestaurantTable table;

  const TableDetailsSheet({super.key, required this.table});

  @override
  State<TableDetailsSheet> createState() => _TableDetailsSheetState();
}

class _TableDetailsSheetState extends State<TableDetailsSheet> {
  late RestaurantTable _table;

  @override
  void initState() {
    super.initState();
    _table = widget.table;
  }

  @override
  Widget build(BuildContext context) {
    final tableProvider = Provider.of<TableManagementProvider>(context, listen: false);

    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Table ${_table.name}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          SizedBox(height: 16),
          _buildStatusSelector(),
          SizedBox(height: 16),
          _buildCapacitySelector(),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  tableProvider.updateTable(_table);
                  Navigator.pop(context);
                },
                child: Text('Save'),
              ),
              OutlinedButton(
                onPressed: () {
                  tableProvider.removeTable(_table.id);
                  Navigator.pop(context);
                },
                child: Text('Delete'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Status:', style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: TableStatus.values.map((status) {
            return ChoiceChip(
              label: Text(_getStatusText(status)),
              selected: _table.status == status,
              selectedColor: _getStatusColor(status),
              onSelected: (selected) {
                if (selected) {
                  setState(() {
                    _table = _table.copyWith(status: status);
                  });
                }
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildCapacitySelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Capacity:', style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                if (_table.capacity > 1) {
                  setState(() {
                    _table = _table.copyWith(capacity: _table.capacity - 1);
                  });
                }
              },
            ),
            Text('${_table.capacity}', style: TextStyle(fontSize: 18)),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  _table = _table.copyWith(capacity: _table.capacity + 1);
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  String _getStatusText(TableStatus status) {
    switch (status) {
      case TableStatus.available: return 'Available';
      case TableStatus.occupied: return 'Occupied';
      case TableStatus.reserved: return 'Reserved';
      case TableStatus.dirty: return 'Dirty';
    }
  }

  Color _getStatusColor(TableStatus status) {
    switch (status) {
      case TableStatus.available: return Colors.green;
      case TableStatus.occupied: return Colors.red;
      case TableStatus.reserved: return Colors.orange;
      case TableStatus.dirty: return Colors.grey;
    }
  }
}