import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/Provider/auth_provider.dart';
import 'package:news_app/Screen/login.dart';
import 'package:news_app/Widget/textformfeild_custom.dart';
import 'package:provider/provider.dart';

class Signup extends StatelessWidget {
   new({super.key});
  TextEditingController _name = TextEditingController();
 TextEditingController _email = TextEditingController();
  TextEditingController _password=TextEditingController();
   TextEditingController _phone=TextEditingController();
   GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final object=context.read<AuthProvider>();
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<AuthProvider>(builder: (context, value, child) => Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: 400,
              height: 500,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),border: BoxBorder.all(width: 1,color: Colors.pink)),
              child: Column(
                children: [
                  Text("SignUp",style: TextStyle(fontSize: 55,color: Colors.pink),),
                  SizedBox(height: 20,),
                  TextformfeildCustom(text: "Name", prefixicin: Icons.account_circle, controller: _name),
                  TextformfeildCustom(text: "Email", prefixicin: Icons.email, controller: _email),
                  TextformfeildCustom(text: "Password", prefixicin: Icons.lock, controller: _password),
                  TextformfeildCustom(text: "phone", prefixicin: Icons.phone, controller: _phone),
              
                  ElevatedButton(style: ElevatedButton.styleFrom(shadowColor: Colors.pinkAccent,backgroundColor: Colors.pinkAccent),onPressed: ()async{
                      if(_formKey.currentState!.validate()){
                    await object.RequestSignUp(Name: _name.text, Email: _email.text, Phone: _phone.text, password: _password.text);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Center(child: Text("${object.model!.message}")),backgroundColor:object.model!.status? const Color.fromARGB(255, 67, 220, 136):Colors.red));
                    if(object.model!.status==true){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                    }
                  }
                  }, child: Text("SignUp",style:  TextStyle(color: Colors.white),)),
                  Row(
                    crossAxisAlignment: .center,
                    mainAxisAlignment: .center,
                    children: [
                      Text("Already Have account"),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                      }, child: Text("Login",style:  TextStyle(color: Colors.pink),))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),),
    );
  }
}