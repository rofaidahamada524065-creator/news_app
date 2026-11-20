import 'package:flutter/foundation.dart';
import 'package:news_app/Models/auth_model.dart';
import 'package:news_app/Services/auth_services.dart';

class AuthProvider extends ChangeNotifier {

  AuthModel ?model;
  Future<void> RequestSignUp({required String Name, required String Email, required String Phone, required String password})async{
    model=await AuthServices.SignUp(Name: Name, Email: Email, Phone: Phone, password: password);
    notifyListeners();
  }
   Future<void> RequestLogin({required String Email,  required String password})async{
    model=await AuthServices.Login(Email: Email,password: password);
    notifyListeners();
  }
}