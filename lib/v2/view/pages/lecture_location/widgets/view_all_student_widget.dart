import 'package:face_recongantion/v2/controller/location_provider.dart';
import 'package:face_recongantion/v2/service/session_service.dart';
import 'package:face_recongantion/v2/view/widgets/radio_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ViewAllStudentWidget extends StatelessWidget {
  const ViewAllStudentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMarkAllStudents =
        context.watch<LocationProvider>().isMarkAllStudents;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: Get.width / 1.2,
            child: const Text(
              "Show All Locations",
              style: TextStyle(fontSize: 20, color: Colors.black54),
            ),
          ),
          RadioButtonWidget(
            checked: isMarkAllStudents,
            onTap: () {
              if (isMarkAllStudents) {
                context.read<LocationProvider>().removeAllMarks();
                Get.back();
              } else {
                SessionService.addMarkForAllStudent(context);
              }
            },
          )
        ],
      ),
    );
  }
}
