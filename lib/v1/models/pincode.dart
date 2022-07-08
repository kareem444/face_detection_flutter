import 'package:flutter/material.dart';

class PinCode extends StatefulWidget {
  const PinCode({Key? key}) : super(key: key);

  @override
  State<PinCode> createState() => _PinCodeState();
}

class _PinCodeState extends State<PinCode> {
  List<String> pine = ["", "", "", ""];
  TextEditingController pinOneCode = TextEditingController();
  TextEditingController pinTwoCode = TextEditingController();
  TextEditingController pinThreeCode = TextEditingController();
  TextEditingController pinFourCode = TextEditingController();

  var outLineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(color: Colors.grey),
  );

  int pineNumber = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           _textFieldOtp(first : true ,  last : true),
           _textFieldOtp(first : false,  last : false),
           _textFieldOtp(first : false ,  last : false),
           _textFieldOtp(first : false ,  last : false),
         ],
        ),


      ],
    ));
  }

  _textFieldOtp({required bool first, last}) {
    return Container(
      height: 85,
      child: AspectRatio(
        aspectRatio: 0.7,
        child: TextField(
          autofocus: true,
          onChanged: (value){
if (value.length==1 && last ==true){
  FocusScope.of(context).nextFocus();

}
if (value.length==0 && first == true){
  FocusScope.of(context).previousFocus();
}

          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration:InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2,color:Colors.black12),
              borderRadius: BorderRadius.circular(12),
           ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2,color:Colors.purpleAccent),
                borderRadius: BorderRadius.circular(12),
              )
          ),
        ),
      ),


    );
  }

}