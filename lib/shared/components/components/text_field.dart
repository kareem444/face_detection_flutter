import 'package:flutter/material.dart';



class DefaultText extends StatelessWidget {
   DefaultText(this.onchange,this.type,this.control,this.hintText,this.icon,{Key? key}) ;
  String? hintText;
 IconData? icon;

Function(String)? onchange;
      TextInputType? type;
   TextEditingController? control;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 50,
      child: Material(
        elevation: 12,
        child: TextFormField(
          onChanged: onchange,
          controller: control,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 18),
            labelStyle: TextStyle(color: Colors.grey, fontSize: 10),
            prefixIcon: Icon(icon),
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(),
            // enabledBorder: InputBorder.none,
          ),
          keyboardType: type,
        ),
      ),
    );
  }
}
