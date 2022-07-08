import 'package:flutter/material.dart';

import 'package:face_recongantion/v2/models/user_model.dart';
import 'package:face_recongantion/v2/view/pages/check_your_data/widgets/info_widget/check_your_data_inf_item_widget.dart';
import 'package:face_recongantion/v2/view/widgets/spacer_widget.dart';
import 'package:intl/intl.dart';

class CheckYourDataInfoWidget extends StatelessWidget {
  const CheckYourDataInfoWidget({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SpacerWidget(),
          CheckYourDataInfoItemWidget(
            title: "Code",
            description: userModel.code!,
          ),
          const SpacerWidget(
            height: 20,
          ),
          CheckYourDataInfoItemWidget(
            title: "E-mail",
            description: userModel.email!,
          ),
          const SpacerWidget(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CheckYourDataInfoItemWidget(
                title: "Time",
                description: DateFormat('h:m a').format(DateTime.now()),
              ),
              CheckYourDataInfoItemWidget(
                title: "Date",
                description: DateFormat('dd/MM/yyyy').format(DateTime.now()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
