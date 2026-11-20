import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextformfeildCustom extends StatelessWidget {

  final String text;
   final IconData prefixicin;
  final IconData ?sufixicin;
  TextEditingController controller=TextEditingController();

  new({super.key, required this.text, required this.prefixicin, this.sufixicin,required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 75,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(label: Text(text),border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),),prefixIcon: Icon(prefixicin,color: const Color.fromARGB(255, 237, 87, 137),),suffixIcon: Icon(sufixicin,color: const Color.fromARGB(255, 237, 86, 136),)),
        validator: (value) {
          if(value==null||value.isEmpty){
            return "Pleas Enter the ${text}";
          }
        },


      ),
    );
  }
}