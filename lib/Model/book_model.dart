class BookModel {
  int id;
  String title;
  String publisher;
  String publishingDate;
  String imageUrl;
  String hall;
  bool isAvailableForRental;
  String description;
  String imageThumbnailUrl;
  String authorName;
  List<String> categories;
  int copies;

  BookModel(
      {required this.id,
      required this.title,
      required this.publisher,
      required this.publishingDate,
      required this.imageUrl,
      required this.hall,
      required this.isAvailableForRental,
      required this.description,
      required this.imageThumbnailUrl,
      required this.authorName,
      required this.categories,
      required this.copies});
  factory BookModel.fromJSON(Map<String, dynamic> json) {
    return BookModel(
        id: json['id'],
        title: json['title'],
        publisher: json['publisher'],
        publishingDate: json['publishingDate'],
        imageUrl: json['imageUrl'],
        hall: json['hall'],
        isAvailableForRental: json['isAvailableForRental'],
        description: json['description'],
        imageThumbnailUrl: json['imageThumbnailUrl'],
        authorName: json['authorName'],
        categories: json['categories'].cast<String>(),
        copies: json['copies']);
  }
}
