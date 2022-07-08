import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

class FileRepo {
  static Future<String> uploadFile(
    BuildContext context,
    String filePath,
    String? directoryPathString,
  ) async {
    String urlDownloader = "";
      var uuid = const Uuid();
      final path = (directoryPathString ?? "profile/") + uuid.v4();
      final file = File(filePath);
      final ref = FirebaseStorage.instance.ref().child(path);
      UploadTask uploadTask = ref.putFile(file);
      final snapshot = await uploadTask.whenComplete(() => null);
      urlDownloader = await snapshot.ref.getDownloadURL();
    return urlDownloader;
  }
}
