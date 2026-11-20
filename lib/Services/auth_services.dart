import 'package:dio/dio.dart';
import 'package:news_app/Models/auth_model.dart';

class AuthServices 
{
  static Dio dio =Dio();
  static Future<AuthModel> SignUp({required String Name, required String Email, required String Phone, required String password})async{
    try {
      Response response=await dio.post("https://elsewedyteam.runasp.net/api/Register/AddUser",
        data: {
          
          "name": Name,
          "phone": Phone,
          "password":password,
          "email": Email
        }
      );
      return AuthModel.fromjson(response.data);
    } on DioException catch (e) {
      throw Exception(e.message);
    }
    catch(other){
      throw Exception("Error : ${other.toString()}");
    }
  }

   static Future<AuthModel> Login({required String Email,  required String password})async{
    try {
      Response response=await dio.post("https://elsewedyteam.runasp.net/api/Login/CheckUser",
        data: {
          
          
          "password":password,
          "email": Email
        }
      );
      return AuthModel.fromjson(response.data);
    } on DioException catch (e) {
      throw Exception(e.message);
    }
    catch(other){
      throw Exception("Error : ${other.toString()}");
    }
  }
}