class News {
  String url;
  String imageUrl;
  String title;
  String description;
  String author;
  DateTime publishedAt;

  News({
    required this.publishedAt,
    required this.url,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.author,
  });
}
