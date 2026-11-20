import 'package:flutter/material.dart';
import 'package:news_app/Provider/news_provider.dart';
import 'package:news_app/Widget/news_custom.dart';
import 'package:provider/provider.dart';

class News extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<NewsProvider>(builder: (context, value, child) {
        final data=value.news?.news;
        if(data==null){
          value.RequestNews();
          return Center(child: CircularProgressIndicator());
        }
        else{
          return ListView.builder(itemCount: data.length,itemBuilder: (context, index) => NewsCustom(news: data[index]),);
        }
      },),
    );
  }
}