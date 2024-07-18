class CategoryModel {
  final int? id;
  final String name;

  CategoryModel({
    this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as int?,
      name: map['name'] as String,
    );
  }

  static List<CategoryModel> defaultCategories = [
    CategoryModel(name: '커피'),
    CategoryModel(name: '식사'),
    CategoryModel(name: '교통'),
    CategoryModel(name: '쇼핑'),
    CategoryModel(name: '의료'),
  ];
}
