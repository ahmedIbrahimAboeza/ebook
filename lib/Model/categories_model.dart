class CategoriesModel {
  int? id;
  String? name;

  CategoriesModel({this.id, this.name});

  CategoriesModel.fromJSON(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
