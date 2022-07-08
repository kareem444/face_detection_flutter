// import 'dart:io';
// import 'package:face_recongantion/v2/service/user_service.dart';
// import 'package:face_recongantion/v2/state/auth_provider.dart';
// import 'package:flutter/material.dart';
// // import 'package:image_picker/image_picker.dart';
// // import 'package:path_provider/path_provider.dart';
// import 'package:provider/provider.dart';

// class CameraPage extends StatefulWidget {
//   const CameraPage({Key? key}) : super(key: key);

//   @override
//   State<CameraPage> createState() => _CameraPageState();
// }

// class _CameraPageState extends State<CameraPage> {
//   // File? image;

//   // final imagePicker = ImagePicker();

//   // void getImage() async {
//   //   XFile? pickedFile = await imagePicker.pickImage(source: ImageSource.camera);

//   //   if (pickedFile == null) {
//   //     return null;
//   //   }
//   //   Directory appDirectory = await getApplicationDocumentsDirectory();
//   //   File newImage = File(appDirectory.path + 'fileName');
//   //   newImage.writeAsBytes(File(pickedFile.path).readAsBytesSync());

//   //   setState(() {
//   //     image = newImage;
//   //     print(newImage.path + ' test');
//   //   });
//   // }

//   // {
//   //    XFile? pick = await ImagePicker().pickImage(source:
//   //        ImageSource.camera,
//   //      maxHeight: 1080,
//   //      maxWidth: 1080,
//   //    );
//   //    setState(() {
//   //      image=File(pick!.path);
//   //    });
//   //   Navigator.pop(context);
//   // }
//   // _initUser() async {
//   //   if (image == null) {
//   //     Center(child: const Text("no photo selected"));
//   //   } else {
//   //     Image.file(image!);
//   //   }
//   // }
//   @override
//   Widget build(BuildContext context) {
//     String? imagePath = context.watch<AuthProvider>().imagePath;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           color: Colors.green,
//           icon: const Icon(Icons.arrow_back),
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const Text(
//           "Camera",
//           style: TextStyle(
//             color: Colors.green,
//           ),
//         ),
//       ),
//       body: ListView(
//         children: [
//           const SizedBox(
//             height: 50,
//           ),
//           imagePath != null
//               ? Image.file(File(imagePath))
//               : const Center(child: Text("no photo selected")),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => UserService.handleImage(context),
//         child: const Icon(Icons.camera),
//         backgroundColor: Colors.green,
//       ),
//     );
//   }
// }
