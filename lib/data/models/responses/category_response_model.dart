
class CategoryModel {
  final int? id;
  final String? name;
  final String? categoryId;
  final DateTime? createdAt;

  CategoryModel({
    this.id,
    this.name,
    this.categoryId,
    this.createdAt,
  });

  factory CategoryModel.fromMap(Map<String, dynamic> json) => CategoryModel(
    id: json["id"],
    name: json["name"],
    categoryId: json["category_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toMap() => {
    if (id != null) "id": id,
    "name": name,
    "category_id": categoryId,
    "created_at": createdAt?.toIso8601String(),
  };

  @override
  String toString() {
    return name ?? 'Kategori';
  }

  @override
  bool operator ==(covariant CategoryModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.categoryId == categoryId;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ categoryId.hashCode;
}
