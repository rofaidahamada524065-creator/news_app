import 'package:dio/dio.dart';
import 'package:news_app/Models/news_model.dart';

class NewsServices {
  static Dio dio =Dio();
  static Future<NewsModel> News()async{
    try {
      Response response=await dio.get("https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=28ebf3181c76493d8367e212f26fed6d");
      return NewsModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}