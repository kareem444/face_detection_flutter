import 'package:face_recongantion/modules/verifiaction_code/verification_page.dart';
import 'package:face_recongantion/shared/components/components/components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class ForgertPassword extends StatefulWidget {
  const ForgertPassword({Key? key}) : super(key: key);

  @override
  State<ForgertPassword> createState() => _ForgertPasswordState();
}

class _ForgertPasswordState extends State<ForgertPassword> {

  TextEditingController emailController=TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override dispose(){
emailController.dispose();
super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body:Stack(
  children: [
    Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
      child: Stack(
        children: [
          Image.asset(
            "assets/images/woman-with-phone-doing-face-scan.png",
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.7,
            fit: BoxFit.cover,
          ),
          Container(
            color: const Color.fromARGB(255, 10, 108, 111).withOpacity(0.5),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 1,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Text(
                    "Forgot Password",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
              const Spacer(
                flex: 1,
              ),
              const Center(
                child: Text(
                  "Atendy",
                  style: TextStyle(
                      fontSize: 55,
                      fontWeight: FontWeight.w200,
                      color: Color(0xFFFFFFFF),
                      fontFamily: "Kaushan Script"),
                ),
              ),
              const Spacer(
                flex: 4,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.35,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key:formKey ,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Spacer(
                          flex: 1,
                        ),
                       const Text("Please Input Your Email",style: TextStyle(fontSize: 25,),),
                        const Spacer(
                          flex: 1,
                        ),
                        Container(
                          height: 50,
                          child: Material(
                            elevation: 12,
                            child: TextFormField(
                              controller: emailController,
                              validator: (value){
                                if(value!.isEmpty){
                                  return "the email must not be empty";
                                }

                              },
                              decoration: const InputDecoration(
                                hintText: "Email",
                                hintStyle: TextStyle(fontSize: 18),
                                labelStyle: TextStyle(
                                    color: Colors.grey, fontSize: 10),
                                prefixIcon: Icon(Icons.email),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(),
                                // enabledBorder: InputBorder.none,
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                        ),


                        const Spacer(
                          flex: 2,
                        ),
                        defualtButton(text: "Send Code", function: ()async{
                          if(formKey.currentState!.validate()) {
                        try{
                          sendVerfifcation();

                        } on FirebaseAuthException catch(ex){

                        }

                          }}),
                        const Spacer(
                          flex:2 ,
                        ),


                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  ],
),
    );

  }

  Future<void> sendVerfifcation() async{
    await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());
  }


}
