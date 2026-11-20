import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/Provider/auth_provider.dart';
import 'package:news_app/Screen/login.dart';
import 'package:news_app/Screen/news.dart';
import 'package:news_app/Widget/textformfeild_custom.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
   new({super.key});

 TextEditingController _email = TextEditingController();
  TextEditingController _password=TextEditingController();

   GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final object=context.read<AuthProvider>();
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<AuthProvider>(builder: (context, value, child) => Form(
        key: _formKey,
        child: Center(
          child: Column(
            children: [
              Text("Login",style: TextStyle(fontSize: 55,color: Colors.pink),),
              SizedBox(height: 20,),
            
              TextformfeildCustom(text: "Email", prefixicin: Icons.email, controller: _email),
              TextformfeildCustom(text: "Password", prefixicin: Icons.lock, controller: _password),
     
          
              ElevatedButton(style: ElevatedButton.styleFrom(shadowColor: Colors.pinkAccent,backgroundColor: Colors.pinkAccent),onPressed: ()async{
                  if(_formKey.currentState!.validate()){
                await object.RequestLogin(Email: _email.text, password: _password.text);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text("${object.model!.message}")),backgroundColor:object.model!.status? const Color.fromARGB(255, 67, 220, 136):Colors.red));
                if(object.model!.status==true){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => News(),));
                }
              }
              }, child: Text("Login",style: TextStyle(color: Colors.white),)),
          
            ],
          ),
        ),
      ),),
    );
  }
}