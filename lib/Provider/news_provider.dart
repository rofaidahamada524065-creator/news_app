import 'package:flutter/material.dart';
import 'package:news_app/Models/news_model.dart';
import 'package:news_app/Services/news_services.dart';

class NewsProvider extends ChangeNotifier {
  NewsModel ?news;
  Future<void>RequestNews()async{
    news=await NewsServices.News();
    notifyListeners();
  }
}