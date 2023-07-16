class SearchModel {
  String? imageThumbnailUrl;
  String? title;
  String? name;
  int? id;

  SearchModel({this.imageThumbnailUrl, this.title, this.name, this.id});

  SearchModel.fromJson(Map<String, dynamic> json) {
    imageThumbnailUrl = json['imageThumbnailUrl'];
    title = json['title'];
    name = json['name'];
    id = json['id'];
  }
}
