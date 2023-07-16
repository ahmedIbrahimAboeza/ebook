class CategoriesDetailsModel {
  int? id;
  String? title;
  String? publisher;
  String? publishingDate;
  String? imageUrl;
  String? hall;
  bool? isAvailableForRental;
  String? description;
  String? imageThumbnailUrl;
  String? authorName;
  List<String>? categories;
  int? copies;

  CategoriesDetailsModel(
      {this.id,
      this.title,
      this.publisher,
      this.publishingDate,
      this.imageUrl,
      this.hall,
      this.isAvailableForRental,
      this.description,
      this.imageThumbnailUrl,
      this.authorName,
      this.categories,
      this.copies});

  CategoriesDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    publisher = json['publisher'];
    publishingDate = json['publishingDate'];
    imageUrl = json['imageUrl'];
    hall = json['hall'];
    isAvailableForRental = json['isAvailableForRental'];
    description = json['description'];
    imageThumbnailUrl = json['imageThumbnailUrl'];
    authorName = json['authorName'];
    categories = json['categories'].cast<String>();
    copies = json['copies'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['publisher'] = this.publisher;
    data['publishingDate'] = this.publishingDate;
    data['imageUrl'] = this.imageUrl;
    data['hall'] = this.hall;
    data['isAvailableForRental'] = this.isAvailableForRental;
    data['description'] = this.description;
    data['imageThumbnailUrl'] = this.imageThumbnailUrl;
    data['authorName'] = this.authorName;
    data['categories'] = this.categories;
    data['copies'] = this.copies;
    return data;
  }
}
