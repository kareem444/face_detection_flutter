import 'package:face_recongantion/modules/instructions/instructions_screen.dart';
import 'package:face_recongantion/shared/components/components/components.dart';
import 'package:flutter/material.dart';

class RegisterLecturer extends StatefulWidget {
  const RegisterLecturer({Key? key}) : super(key: key);

  @override
  State<RegisterLecturer> createState() => _RegisterLecturerState();
}

class _RegisterLecturerState extends State<RegisterLecturer> {
  TextEditingController nameContoller = TextEditingController();
  TextEditingController emailContoller = TextEditingController();
  TextEditingController passwordContoller = TextEditingController();
  bool isPassword=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/woman-with-phone-doing-face-scan.png",
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 1,
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
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
                                hintText: "Username",
                                icon: Icons.person,
                                onchange: (value) {
                                  print(value);
                                },
                                control: nameContoller,
                                type: TextInputType.name),
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
                              hintText: "email",
                              icon: Icons.email,
                              onchange: (b) {
                                print(b);
                              },
                              control: emailContoller,
                              type: TextInputType.emailAddress,
                            ),
                            const Spacer(
                              flex: 2,
                            ),
                            defualtText(text: "Password"),
                            const Spacer(
                              flex: 1,
                            ),
                            defualtFormField(
                                hintText: "password",
                                icon: Icons.lock,
                                onchange: (g) {
                                  print(g);
                                },
                               control: passwordContoller,
                                type: TextInputType.number,
                                icontwo: isPassword
                                    ? Icons.remove_red_eye
                                    : Icons.visibility_off,


                                ispassword: isPassword,
                                function: () {
                                  setState(() {
                                    isPassword = !isPassword;
                                  });
                                }
                            ),
                            const Spacer(
                              flex: 2,
                            ),
                            defualtButton(
                                text: "Register",
                                function: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Instructions()));
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
                                    textbutton: "Login", function: () {}),
                              ],
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                          ],
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
}
