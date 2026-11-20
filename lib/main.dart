import 'package:flutter/material.dart';
import 'package:news_app/Provider/auth_provider.dart';
import 'package:news_app/Provider/news_provider.dart';
import 'package:news_app/Screen/signup.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) =>  AuthProvider(),),
         ChangeNotifierProvider(create: (context) => NewsProvider()),
        
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
       
          
          colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        ),
        home:  Signup(),
      ),
    );
  }
}

