class BookDetailsModel {
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

  BookDetailsModel(
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

  BookDetailsModel.fromJson(Map<String, dynamic> json) {
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
}
