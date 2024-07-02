
class TodoModel {
  final int id;
  final String title;
  final String createdAt;
  final String? updatedAt;

  TodoModel({
    required this.id,
    required this.title,
    required this.createdAt,
    this.updatedAt,
  });

  factory TodoModel.fromSqfliteDatabase(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      createdAt: map['created_at'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['created_at']).toIso8601String()
          : '',
      updatedAt: map['updated_at'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['updated_at']).toIso8601String()
          : null,
    );
  }

  // factory TodoModel.fromSqfliteDatabase(Map<String, dynamic> map) {
  //   return TodoModel(
  //     id: map['id']?.toInt() ?? 0,
  //     title: map['title'] ?? '',
  //     createdAt: DateTime.fromMillisecondsSinceEpoch(map['created_at']).toIso8601String(),
  //     updatedAt: map['updated_at'] == null
  //       ? null
  //       : DateTime.fromMillisecondsSinceEpoch(map['updated_at']).toIso8601String(),
  //   );
  // }
}