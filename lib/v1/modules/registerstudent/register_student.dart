import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:face_recongantion/v1/modules/instructions/instructions_screen.dart';
import 'package:face_recongantion/v1/shared/components/components/components.dart';
import 'package:face_recongantion/v2/models/user_model.dart';
import 'package:face_recongantion/v2/service/location_service.dart';
import 'package:face_recongantion/v2/controller/auth_provider.dart';
import 'package:face_recongantion/v2/service/user_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:location/location.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RigisterStudent extends StatefulWidget {
  const RigisterStudent({Key? key}) : super(key: key);

  @override
  State<RigisterStudent> createState() => _RigisterStudentState();
}

class _RigisterStudentState extends State<RigisterStudent> {
  TextEditingController? nameControl = TextEditingController();
  TextEditingController? emailControl = TextEditingController();
  TextEditingController? passwordControl = TextEditingController();
  bool isPassword = true;
  var formKey = GlobalKey<FormState>();
  String? email;
  String? code;
  final _auth = FirebaseAuth.instance;
  bool isloading = false;

  double longitude = 0;
  double latitude = 0;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
          child: Stack(
            children: [
              Image.asset(
                "assets/images/woman-with-phone-doing-face-scan.png",
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.6,
                fit: BoxFit.cover,
              ),
              Container(
                color: const Color.fromARGB(255, 10, 108, 111).withOpacity(0.5),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.6,
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
                        "Registration",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
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
                    flex: 15,
                  ),
                ],
              ),
              ListView(
                reverse: true,
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.65,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(40),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Spacer(
                              flex: 1,
                            ),
                            defualtText(text: "Username"),
                            const Spacer(
                              flex: 1,
                            ),
                            defualtFormField(
                              validate: (value) {
                                RegExp regex = RegExp(r'^.{3,}$');
                                if (value.isEmpty) {
                                  return ("the name cannont be Empty");
                                }
                                if (!regex.hasMatch(value)) {
                                  return ("please enter the valid name");
                                }
                                return null;
                              },
                              hintText: "username",
                              icon: Icons.person,
                              onchange: (value) {
                                print(value);
                              },
                              control: nameControl,
                              type: TextInputType.name,
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                            defualtText(text: "Email"),
                            const Spacer(
                              flex: 1,
                            ),
                            defualtFormField(
                                hintText: "Email",
                                icon: Icons.email_sharp,
                                onchange: (data) {
                                  email = data;
                                },
                                control: emailControl,
                                type: TextInputType.emailAddress),
                            const Spacer(
                              flex: 2,
                            ),
                            defualtText(text: "Uinversity Code"),
                            const Spacer(
                              flex: 1,
                            ),
                            defualtFormField(
                                hintText: "University Code",
                                icon: Icons.lock,
                                type: TextInputType.number,
                                icontwo: isPassword
                                    ? Icons.remove_red_eye
                                    : Icons.visibility_off,
                                onchange: (data) {
                                  code = data;
                                },
                                control: passwordControl,
                                ispassword: isPassword,
                                function: () {
                                  setState(() {
                                    isPassword = !isPassword;
                                  });
                                }),
                            const Spacer(
                              flex: 2,
                            ),
                            defualtButton(
                                text: "Continue",
                                function: () async {
                                  if (formKey.currentState!.validate()) {
                                    FocusManager.instance.primaryFocus?.unfocus();
                                    UserModel userModel = UserModel.fromMap({
                                      "name": nameControl!.text,
                                      "email": emailControl!.text,
                                      "code": passwordControl!.text,
                                    });

                                    UserService.holdUserInfo(
                                      context,
                                      userModel,
                                    );

                                    // isloading = true;
                                    // setState(() {});
                                    // try {
                                    //   final User? user = _auth.currentUser;
                                    //   final _uid = user!.uid;
                                    // LocationData locationData =
                                    //     await LocationService
                                    //         .getCurrentLocation();
                                    // UserModel userModel = UserModel.fromMap({
                                    //   "id": _uid,
                                    //   "name": nameControl!.text,
                                    //   "email": emailControl!.text,
                                    //   "code": passwordControl!.text,
                                    //   "latitude": locationData.latitude,
                                    //   "longitude": locationData.longitude,
                                    // });
                                      // FirebaseFirestore.instance
                                      //     .collection("students")
                                      //     .doc(_uid)
                                      //     .set(userModel.toMap());
                                    //   context
                                    //       .read<AuthProvider>()
                                    //       .handelCurrentUser(userModel);
                                    //   Navigator.push(
                                    //       context,
                                    //       MaterialPageRoute(
                                    //           builder: (context) =>
                                    //               Instructions()));
                                    // } on FirebaseAuthException catch (ex) {
                                    //   if (ex.code == "wrong-password") {
                                    //     showDialog(
                                    //         context: context,
                                    //         builder: (context) {
                                    //           return AlertDialog(
                                    //             title: Column(
                                    //               children: [
                                    //                 Image.asset(
                                    //                   "assets/images/warning.png",
                                    //                   color: const Color(
                                    //                       0xFFFFC444),
                                    //                   height: 100,
                                    //                   width: 100,
                                    //                   fit: BoxFit.cover,
                                    //                 ),
                                    //                 const SizedBox(height: 20),
                                    //                 const Text(
                                    //                     "Ops! Something Went\n             Wrong",
                                    //                     style: TextStyle(
                                    //                         fontSize: 22,
                                    //                         fontWeight:
                                    //                             FontWeight
                                    //                                 .w400)),
                                    //               ],
                                    //             ),
                                    //             content: SizedBox(
                                    //               // width:MediaQuery.of(context).size.width*0.95,
                                    //               width: 250,
                                    //               height: 160,
                                    //               child: Padding(
                                    //                 padding:
                                    //                     const EdgeInsets.all(
                                    //                         0.0),
                                    //                 child: Column(
                                    //                   children: [
                                    //                     Text(
                                    //                         "         please enter the correct \n e-mail & university code and try \n                      again. ",
                                    //                         style: TextStyle(
                                    //                             fontSize: 15,
                                    //                             fontWeight:
                                    //                                 FontWeight
                                    //                                     .w500,
                                    //                             color:
                                    //                                 Colors.grey[
                                    //                                     700])),
                                    //                     const SizedBox(
                                    //                       height: 30,
                                    //                     ),
                                    //                     defualtButtonDialog(
                                    //                         text: "Ok",
                                    //                         function: () {},
                                    //                         dialogColor:
                                    //                             const Color(
                                    //                                 0xFFFECC5F)),
                                    //                   ],
                                    //                 ),
                                    //               ),
                                    //             ),
                                    //           );
                                    //         });
                                    //   } else if (ex.code ==
                                    //       "email-already-in use") {
                                    //     showDialog(
                                    //         context: context,
                                    //         builder: (context) {
                                    //           return AlertDialog(
                                    //             title: Column(
                                    //               children: [
                                    //                 Image.asset(
                                    //                   "assets/images/warning.png",
                                    //                   color: const Color(
                                    //                       0xFFFFC444),
                                    //                   height: 100,
                                    //                   width: 100,
                                    //                   fit: BoxFit.cover,
                                    //                 ),
                                    //                 const SizedBox(height: 20),
                                    //                 const Text(
                                    //                     "Ops! Something Went\n             Wrong",
                                    //                     style: TextStyle(
                                    //                         fontSize: 22,
                                    //                         fontWeight:
                                    //                             FontWeight
                                    //                                 .w400)),
                                    //               ],
                                    //             ),
                                    //             content: SizedBox(
                                    //               // width:MediaQuery.of(context).size.width*0.95,
                                    //               width: 250,
                                    //               height: 160,
                                    //               child: Padding(
                                    //                 padding:
                                    //                     const EdgeInsets.all(
                                    //                         0.0),
                                    //                 child: Column(
                                    //                   children: [
                                    //                     Text(
                                    //                         "         please enter the correct \n e-mail & university code and try \n                      again. ",
                                    //                         style: TextStyle(
                                    //                             fontSize: 15,
                                    //                             fontWeight:
                                    //                                 FontWeight
                                    //                                     .w500,
                                    //                             color:
                                    //                                 Colors.grey[
                                    //                                     700])),
                                    //                     const SizedBox(
                                    //                       height: 30,
                                    //                     ),
                                    //                     defualtButtonDialog(
                                    //                         text: "Ok",
                                    //                         function: () {},
                                    //                         dialogColor:
                                    //                             const Color(
                                    //                                 0xFFFECC5F)),
                                    //                   ],
                                    //                 ),
                                    //               ),
                                    //             ),
                                    //           );
                                    //         });
                                    //   }
                                    // }
                                  }

                                  isloading = false;
                                  setState(() {});
                                }),
                            const Spacer(
                              flex: 1,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "Have an account? ",
                                      style: TextStyle(
                                          fontSize: 17, color: Colors.grey),
                                    )),
                                defualtTextButton(
                                    textbutton: "Login",
                                    function: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Column(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/warning.png",
                                                    color:
                                                        const Color(0xFFFFC444),
                                                    height: 100,
                                                    width: 100,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  const SizedBox(height: 20),
                                                  const Text(
                                                      "Ops! Something Went\n             Wrong",
                                                      style: TextStyle(
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                ],
                                              ),
                                              content: SizedBox(
                                                // width:MediaQuery.of(context).size.width*0.95,
                                                width: 250,
                                                height: 160,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(0.0),
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                          "         please enter the correct \n e-mail & university code and try \n                      again. ",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: Colors
                                                                  .grey[700])),
                                                      const SizedBox(
                                                        height: 30,
                                                      ),
                                                      defualtButtonDialog(
                                                          text: "Ok",
                                                          function: () {},
                                                          dialogColor:
                                                              const Color(
                                                                  0xFFFECC5F)),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          });
                                    }),
                              ],
                            ),
                            const Spacer(
                              flex: 1,
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
      ),
    );
  }

  // Future<void> singUp() async {
  //   if (formKey.currentState!.validate()) {
  //     try {
  //       await _auth
  //           .createUserWithEmailAndPassword(email: email!, password: code!)
  //           .then((uid) => {
  //                 Navigator.push(
  //                     context,
  //                     MaterialPageRoute(
  //                         builder: (context) => const Instructions()))
  //               });
  //     } on FirebaseAuthException {}
  //   }
  // }
}
