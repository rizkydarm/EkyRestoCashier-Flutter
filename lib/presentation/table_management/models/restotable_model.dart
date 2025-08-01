class RestaurantTable {
  final int id;
  final String name;
  final double x;
  final double y;
  final double width;
  final double height;
  final int capacity;
  final TableStatus status;

  RestaurantTable({
    required this.id,
    required this.name,
    required this.x,
    required this.y,
    this.width = 80,
    this.height = 80,
    this.capacity = 4,
    this.status = TableStatus.available,
  });

  RestaurantTable copyWith({
    int? id,
    String? name,
    double? x,
    double? y,
    double? width,
    double? height,
    int? capacity,
    TableStatus? status,
  }) {
    return RestaurantTable(
      id: id ?? this.id,
      name: name ?? this.name,
      x: x ?? this.x,
      y: y ?? this.y,
      width: width ?? this.width,
      height: height ?? this.height,
      capacity: capacity ?? this.capacity,
      status: status ?? this.status,
    );
  }
}

enum TableStatus { available, occupied, reserved, dirty }