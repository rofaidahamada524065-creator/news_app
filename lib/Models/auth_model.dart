class AuthModel {
  final bool status;
  final String message;
  final User ?user;

  AuthModel({required this.status, required this.message,  this.user});
  factory AuthModel.fromjson(Map json){
    if(json["user"]==null){
      return AuthModel(status: json["status"], message: json["message"]);
    }
    return AuthModel(status: json["status"], message: json["message"],user: User.fromjson(json["user"]));
  }
}
class User{
 final String Name;
 final String Email;
 final String Phone;
 final String password;

  new({required this.Name, required this.Email, required this.Phone, required this.password});
 factory User.fromjson(Map json){
    return User(Name: json["name"], Email: json["email"], Phone: json["phone"], password: json["password"]);
  }
}