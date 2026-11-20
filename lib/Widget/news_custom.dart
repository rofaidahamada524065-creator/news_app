import 'package:flutter/material.dart';
import 'package:news_app/Models/news_model.dart';

import 'package:news_app/Screen/details.dart';

class NewsCustom extends StatelessWidget {
 final News news;
  const NewsCustom({super.key,required this.news});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
      
        width: 600,height:400,
        margin: EdgeInsets.all(10),
   
        
        child: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Details(news: news),));
          },
          child: Card(
            elevation: 8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(child: Container(width: 400,height:200 ,child: Image.network(fit: BoxFit.cover,news.imageUrl,errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image,size: 200,),))),
                Text(news.title,style: TextStyle(color: Colors.black,fontWeight: .bold),),
                SizedBox(height: 30,),
                Text(news.description),
          
              ],
            ),
          ),
        ),
      ),
    );
  }
}