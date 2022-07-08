import 'package:cached_network_image/cached_network_image.dart';
import 'package:face_recongantion/v2/controller/location_provider.dart';
import 'package:face_recongantion/v2/service/location_service.dart';
import 'package:face_recongantion/v2/service/session_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:face_recongantion/v2/models/user_model.dart';
import 'package:face_recongantion/v2/view/widgets/radio_button_widget.dart';

class ViewStudentItemWidget extends StatelessWidget {
  final UserModel userModel;
  final String sessionId;

  const ViewStudentItemWidget({
    Key? key,
    required this.userModel,
    required this.sessionId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: Get.width / 1.2,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipOval(
                      child: Material(
                        color: Colors.transparent,
                        child: CachedNetworkImage(
                          imageUrl: userModel.image ?? "",
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              Image.asset("assets/images/user.jpg"),
                          errorWidget: (context, url, error) => Icon(
                            Icons.error,
                            color: Colors.red[600],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: Get.width / 2.7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userModel.name!,
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text(
                            userModel.code!,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    IconButton(
                      onPressed: () => SessionService.removeStudentFromSession(
                          context, sessionId, userModel),
                      icon: Icon(
                        Icons.cancel,
                        color: Colors.red[700],
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Builder(builder: (context) {
            bool isCheckd = context
                .watch<LocationProvider>()
                .markedStudents
                .contains(userModel.id);
            return RadioButtonWidget(
              checked: isCheckd,
              onTap: () {
                if (isCheckd) {
                  context.read<LocationProvider>().removeOneMark(userModel.id!);
                } else {
                  LocationService.addMarkForOneStudent(
                    context,
                    userModel.toMap(),
                  );
                }
              },
            );
          })
        ],
      ),
    );
  }
}
