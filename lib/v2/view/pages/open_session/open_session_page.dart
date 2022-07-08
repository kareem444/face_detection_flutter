import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:face_recongantion/v2/service/user_service.dart';
import 'package:face_recongantion/v2/view/pages/open_session/widgets/opend_sessions_header_widget.dart';
import 'package:face_recongantion/v2/view/pages/open_session/widgets/sessions_items_widget.dart';
import 'package:face_recongantion/v2/view/widgets/create_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OpenSessionsPage extends StatefulWidget {
  const OpenSessionsPage({Key? key}) : super(key: key);

  @override
  State<OpenSessionsPage> createState() => _OpenSessionsPageState();
}

class _OpenSessionsPageState extends State<OpenSessionsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      UserService.getCurrentuser(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference sessions =
        FirebaseFirestore.instance.collection('sessions');

    void reload() {
      setState(() {});
    }

    return CreatePageWidget(
        page: Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const OpenedSessionsHeaderWidget(),
            FutureBuilder<QuerySnapshot>(
              future: sessions.get(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Expanded(
                    child: Center(
                      child: Text(
                        "Something went wrong",
                        style: TextStyle(color: Colors.red[600], fontSize: 20),
                      ),
                    ),
                  );
                }

                if (snapshot.hasData) {
                  List<QueryDocumentSnapshot<Object?>> sessions =
                      snapshot.data!.docs;
                  return SessionsItemsWidget(
                    sessions: sessions,
                    reload: reload,
                  );
                }

                return Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 5,
                      color: Colors.blue[700],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    ));
  }
}
