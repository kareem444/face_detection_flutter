


import 'package:flutter/material.dart';

import '../../../modules/registerstudent/register_student.dart';

Widget defualtButton({
  @required String? text,
  @required VoidCallback? function,
  double width = double.infinity,
}) =>
    Container(
      height: 45,
      width: double.infinity,
      decoration: const BoxDecoration(
          //color: Colors.yellow,
          //borderRadius: BorderRadius.circular(50),
          ),
      child: ElevatedButton(
        onPressed: function!,
        style: ElevatedButton.styleFrom(
          primary: Color(0xFFFECC5F),
          //minimumSize: Size(200, 50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)),
        ),
        child: Text(
          text!,
          style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w600,
              color: Color(0xFF887F6D)),
        ),
      ),
    );

Widget defualtButtonDialog({
  @required String? text,
  @required VoidCallback? function,
  required Color dialogColor,
 // double width = double.infinity,
}) =>
    Container(
      height: 30,
      width: 180,
      decoration: const BoxDecoration(

      ),
      child: ElevatedButton(
        onPressed: function!,
        style: ElevatedButton.styleFrom(
          primary: dialogColor,

          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)),
        ),
        child: Text(
          text!,
          style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
      ),
    );

Widget defualtText({
  @required String? text,
}) =>
    Text(text!,
        style: const TextStyle(
            fontSize: 22,
            letterSpacing: 1.2,
            color: Color.fromARGB(255, 123, 122, 122),
            fontWeight: FontWeight.w400));

Widget defualtTextButton({
  @required String? textbutton,
  @required VoidCallback? function,
}) =>
    TextButton(
        onPressed: function!,
        child: Text(
          textbutton!,
          style: const TextStyle(fontSize: 18, color: Color(0xFFFFC444)),
        ));

bool _passwordIn = true;


Widget defualtFormField({
  @required String? hintText,
  @required IconData? icon,


   @required Function(String)? onchange,
  TextInputType? type,
  IconData? icontwo,
  @required TextEditingController? control,
   Function()? function,
 var validate,
  bool ispassword=false,

}) =>
    Container(
      height: 50,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ]
      ),
      child: TextFormField(
        validator:validate ,
        onChanged: onchange,
        controller: control,
        obscureText: ispassword,
        decoration: InputDecoration(
          hintText: hintText,


          hintStyle: TextStyle(fontSize: 18),
          labelStyle: TextStyle(color: Colors.grey, fontSize: 10),
          prefixIcon: Icon(icon),
          suffixIcon: icontwo !=null ?IconButton(
            onPressed: function,
            icon: Icon(icontwo),
          ):null,
          fillColor: Colors.white,

          filled: true,
          border: OutlineInputBorder(),
          // enabledBorder: InputBorder.none,
        ),
        keyboardType: type,

      ),
    );






