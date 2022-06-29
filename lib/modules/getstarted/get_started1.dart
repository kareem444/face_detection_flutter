import 'package:face_recongantion/models/clip_path.dart';
import 'package:face_recongantion/modules/studentorlecturer//lecturer_student.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String Image;
  final String title;
  final String body;

  BoardingModel({required this.Image, required this.body, required this.title});
}

class GetStartedOne extends StatefulWidget {
  @override
  State<GetStartedOne> createState() => _GetStartedOneState();
}

class _GetStartedOneState extends State<GetStartedOne> {
  double w = double.infinity;
  String? sk;
  double h = 550;
  var boundController = PageController();
  List<BoardingModel> boarding = [
    BoardingModel(
        Image: "assets/images/1.png",
        body:
            "No more westing time, use Attendy \n    and register your attendance  \n            in just few seconds ",
        title: "Save Every Second"),
    BoardingModel(
        Image: "assets/images/2.png",
        body:
            "       leave the easy tasks to us and     \n    keep your focus on the important \n        things  ",
        title: "Don't miss a thing"),
    BoardingModel(
        Image: "assets/images/3.png",
        body:
            "        It's time to keep pace with  \n      technologhy and progess right     \n                      together .         ",
        title: "Stay up to  date ")
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: PageView.builder(
            onPageChanged: (int index) {
              if (index == boarding.length - 1) {
                setState(() {
                  sk = "Start";
                });
              } else {
                setState(() {
                  sk = "Skip";
                });
              }
            },
            controller: boundController,
            itemBuilder: (context, index) => buildBoardingItem(boarding[index]),
            itemCount: boarding.length,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SmoothPageIndicator(
              controller: boundController,
              count: boarding.length,
              effect: const ExpandingDotsEffect(
                dotColor: Color(0xFF2D7775),
                activeDotColor: Color(0xFF2D7775),
                dotWidth: 10,
                dotHeight: 10,
                expansionFactor: 3,
              ),
            ),
            const SizedBox(height: 6),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed("choosebetween");
                },
                child: Text(
                  "${sk}",
                  style: const TextStyle(fontSize: 20, color: Colors.blueGrey),
                )),
            const SizedBox(
              height: 5,
            )
          ],
        )
      ],
    ));
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                alignment: Alignment.center,


                child: Image.asset(
                  "assets/images/image.png",
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.57,
                  filterQuality:FilterQuality.high ,
                  fit: BoxFit.cover,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                )),
              ),
              Container(
                margin: EdgeInsets.only(top: 80),
                alignment: Alignment.topCenter,
                child: Image.asset(
                  '${model.Image}',
                  height: 290,
                  width: 270,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(top: 22),
            child: Text("${model.title}",
                style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey)),
          ),
          const SizedBox(height: 17),
          Text(
            '${model.body}',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
              letterSpacing: 1.4,
              wordSpacing: 1.5,
            ),
          ),
        ],
      );
}
