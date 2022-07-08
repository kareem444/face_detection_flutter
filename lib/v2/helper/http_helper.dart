import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class SessionHelper {
  static Future post({
    required String url,
    required String filePath,
    required Map<String, dynamic>? data,
  }) async {
    try {
      http.MultipartRequest request = http.MultipartRequest(
          'POST', Uri.parse("http://acc8-35-227-180-233.ngrok.io/" + url))
        ..files.add(
          await http.MultipartFile.fromPath(
            'image',
            File(filePath).path,
          ),
        )
        ..headers.addAll({});

      if (data != null) {
        request.fields["student_id"] = data["student_id"];
        request.fields["student_name"] = data["student_name"];
        request.fields["student_email"] = data["student_email"];
      }

      var response = await request.send();

      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);

      return json.decode(responseString);
    } catch (e) {
      return "error! Something went wrong";
    }
  }
}
