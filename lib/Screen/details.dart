import 'package:flutter/material.dart';
import 'package:news_app/Models/news_model.dart';

class Details extends StatelessWidget {
  final News news;
  const Details({super.key,required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Card(
        child: SingleChildScrollView(
          child: Column(
            children: [
                Center(child: Container(width: 600,height:300 ,child: Image.network(fit: BoxFit.cover,news.imageUrl,errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image,size: 200,),))),
                 
                  SizedBox(height: 30,),
                 Text("Auther :${news.author}"),
                 SizedBox(height: 30,),
                  Text("publishedAt : ${news.publishedAt}"),
                  SizedBox(height: 30,),
                  Text("content : ${news.content}"),
                   SizedBox(height: 30,),
                   Text(" ${news.description}"),
                 
                
            ],
          ),
        ),
      ),
    );
  }
}