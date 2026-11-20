class NewsModel {
 final List<News> news;

  NewsModel({required this.news});
   factory NewsModel.fromJson(Map<String, dynamic> json) {
    final tempList = json["articles"]
        .map<News>(
          (article) => News(
            imageUrl: article["urlToImage"] ?? "",
            title: article["title"] ?? "",
            description: article["description"] ?? "",
            author: article["author"] ?? "",
            publishedAt: article["publishedAt"] ?? "",
            content: article["content"] ?? "",
          ),
        )
        .toList();

    return NewsModel(news: tempList);
  }

}

class News{
    final String imageUrl;
  final String title;
  final String description;
  final String author;
  final String publishedAt;
  final String content;

  News({required this.imageUrl, required this.title, required this.description, required this.author, required this.publishedAt, required this.content});
 

 }
