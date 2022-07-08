import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:face_recongantion/v2/controller/loading_widget_provider.dart';
import 'package:face_recongantion/v2/controller/connectivity_checker_provider.dart';
import 'package:face_recongantion/v2/view/widgets/floating_alert_widget.dart';
import 'package:face_recongantion/v2/view/widgets/loading_widget.dart';

class CreatePageWidget extends StatefulWidget {
  final Widget page;
  final Widget? bottomAppbar;
  final AppBar? appBar;
  final FloatingActionButton? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  const CreatePageWidget({
    Key? key,
    required this.page,
    this.bottomAppbar,
    this.appBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
  }) : super(key: key);

  @override
  State<CreatePageWidget> createState() => _CreatePageWidgetState();
}

class _CreatePageWidgetState extends State<CreatePageWidget> {
  late StreamSubscription<ConnectivityResult> connectivitySubscription;

  @override
  initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkConnctivityForIntiaalize();
      connectivitySubscription = Connectivity().onConnectivityChanged.listen(
        (ConnectivityResult result) {
          if (result == ConnectivityResult.none) {
            debugPrint("set the disconnect to true");
            context
                .read<ConnectivityCheckerProvider>()
                .hendelDisConnected(true);
          } else {
            debugPrint("set the disconnect to false");
            context
                .read<ConnectivityCheckerProvider>()
                .hendelDisConnected(false);
          }
        },
      );
    });
  }

  checkConnctivityForIntiaalize() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      context.read<ConnectivityCheckerProvider>().hendelDisConnected(true);
      debugPrint("set the disconnect to true second");
    } else {
      context.read<ConnectivityCheckerProvider>().hendelDisConnected(false);
      debugPrint("set the disconnect to false second");
    }
  }

  @override
  dispose() {
    connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      floatingActionButtonLocation: widget.floatingActionButtonLocation ??
          FloatingActionButtonLocation.centerFloat,
      floatingActionButton: widget.floatingActionButton,
      bottomNavigationBar: widget.bottomAppbar,
      body: SafeArea(
        child: Stack(
          children: [
            widget.page,
            if (context.watch<LoadingWidgetProvidre>().showLoadingScreen)
              const LoadingWidget(),
            if (context.watch<ConnectivityCheckerProvider>().disConnected)
              const FloatingAlertWidget(
                text: "Please Check Your Connection",
                icon: Icons.wifi_off_rounded,
              ),
          ],
        ),
      ),
    );
  }
}
