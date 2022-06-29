import 'package:face_recongantion/modules/google_map/google_map.dart';
import 'package:face_recongantion/shared/components/components/components.dart';
import 'package:flutter/material.dart';

class CreateNewSession extends StatefulWidget {
  const CreateNewSession({Key? key}) : super(key: key);

  @override
  State<CreateNewSession> createState() => _CreateNewSessionState();
}

class _CreateNewSessionState extends State<CreateNewSession> {
  String? check;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(40),
              ),
            ),
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/4.png",
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.34,
                  fit: BoxFit.cover,
                ),
                Container(
                  color: Color.fromARGB(255, 10, 108, 111).withOpacity(0.5),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.34,
                ),
              ],
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.78,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 55,right: 55),
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(flex: 4),
                  SingleChildScrollView(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),

                      child: Center(
                          child: Text(
                        "Create New \n    Session",
                        style: TextStyle(
                            letterSpacing: 1.1,
                            fontSize: 27,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[700]),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Define the session type",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[500],
                        fontWeight: FontWeight.bold,
                        wordSpacing: 1.1,
                        letterSpacing: 1.1),
                  ),
                  SizedBox(height: 5,),
                  Container(

                    width: MediaQuery.of(context).size.width * 0.70,
                    height: 115,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.8),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Radio(
                              activeColor: Colors.black,
                                value: "us", groupValue: check, onChanged: (val){
                            setState((){
                              check=val as String?;
                              print(val);
                            });
                            }),
                            Text("Lecture",style: TextStyle(fontSize: 24,color: Colors.grey[700]),)
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Divider(

                            thickness: 2,
                          ),
                        ),
                        Row(
                          children: [
                            Radio(
                                activeColor: Colors.black,
                                value: "usa", groupValue: check, onChanged: (value){
                              setState((){
                                check=value as String?;
                                print(value);
                              });
                            }),
                            Text("Section",style: TextStyle(fontSize: 24,color: Colors.grey[700]),)
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  Text(
                    "Enter the session information",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[500],
                        fontWeight: FontWeight.bold,
                        wordSpacing: 1.1,
                        letterSpacing: 1.1),
                  ),
                  SizedBox(height: 5,),
                  Container(

                    width: MediaQuery.of(context).size.width * 0.70,
                    height: 220,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.8),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25,left: 20,right: 20,bottom:20,),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Course Name",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey[500],
                                fontWeight: FontWeight.bold,
                                wordSpacing: 1.1,
                                letterSpacing: 1.1),
                          ),
                          SizedBox(height: 10),
                          Container(
                            height:40 ,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: TextFormField(
                             cursorColor: Colors.white,


                              decoration: InputDecoration(
                                fillColor: Colors.white,

                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                                  ),




                                filled: true,
                                border: OutlineInputBorder(

                                ),
                                prefixIcon: Icon(Icons.menu_rounded),
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Text(
                            "Code",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey[500],
                                fontWeight: FontWeight.bold,
                                wordSpacing: 1.1,
                                letterSpacing: 1.1),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            height:40 ,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: TextFormField(
                              cursorColor: Colors.white,


                              decoration: InputDecoration(
                                fillColor: Colors.white,

                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white, width: 2.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white, width: 2.0),
                                ),




                                filled: true,
                                border: OutlineInputBorder(

                                ),
                                prefixIcon: Icon(Icons.vpn_key),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40,),

                  defualtButton(
                    text: "create",
                    function: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MapSample()));
                    },
                    width: 300,
                  ),
                  Spacer(flex: 1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
