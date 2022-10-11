
import 'package:flutter/material.dart';
import 'package:gameplan/Utils/common_widgets.dart';
import 'package:gameplan/Utils/methods.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Contain extends StatefulWidget {
  Contain({Key key}) : super(key: key);

  @override
  State<Contain> createState() => _ContainState();
}

class _ContainState extends State<Contain> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: CommonWidgets.gradient1(),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 15.0,
                      offset: Offset(0.0, 0.70),
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: MediaQuery.of(context).padding.top,
                    ),
                    Container(
                      width: Get.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Stack(
                            alignment: AlignmentDirectional.center,
                            children: <Widget>[
                              Text(
                                ("FIFA WC 2022"),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: rFontSize(
                                    context: context,
                                    rFontSize: 18,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Get.width * 0.05),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    CommonWidgets.backButton(context),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        color: Colors.transparent,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: Get.width * 0.001,
                                          vertical: Get.height * 0.0001,
                                        ),
                                        child: Image.asset(
                                          "assets/icons/info.png",
                                          width: Get.width / 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 18),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Container(
                        height: Get.height * .25,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.white, width: 1),
                          image: DecorationImage(
                              scale: 1,
                              image: AssetImage(
                                  'assets/images/special_event_contest_banner.png'),
                              fit: BoxFit.fill),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                height: 30,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      topRight: Radius.circular(15)),
                                ),
                                child: Center(
                                    child: Text(
                                  'Joined',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )),
                              ),
                            ),
                            Positioned(
                              top: Get.height * .025,
                              right: 0,
                              left: 0,
                              child: Column(
                                children: [
                                  Container(
                                    height: Get.height * .036,
                                    width: Get.width * .23,
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(8),
                                        border:
                                            Border.all(color: Colors.white)),
                                    child: Center(
                                        child: Text(
                                      'Match 23',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white),
                                    )),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        radius: 25,
                                        child: Image.asset(
                                            'assets/images/football_team_a_default_jersey.png'),
                                      ),
                                      CircleAvatar(
                                        radius: 25,
                                        child: Image.asset(
                                            'assets/images/football_team_a_default_jersey.png'),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: Get.height * .135,
                              left: Get.width * .19,
                              child: Center(
                                child: Text(
                                  'Arg',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            Positioned(
                              top: Get.height * .135,
                              right: Get.width * .19,
                              child: Center(
                                child: Text(
                                  'Bra',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            index % 2 == 0
                                ? Positioned(
                                    bottom: Get.height * .02,
                                    right: 0,
                                    left: 0,
                                    child: Center(
                                      child: Text(
                                        '0:0',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ))
                                : Positioned(
                                    bottom: Get.height * .01,
                                    right: 0,
                                    left: 0,
                                    child: Center(
                                      child: SizedBox(
                                        height: Get.height * .04,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Edit',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Center(
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Instructions & Prizes'),
            ),
          ),
        )
      ],
    );
  }

  Center ball() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          // padding: EdgeInsets.all(8),
          height: 230,
          width: double.infinity,
          decoration: BoxDecoration(
              // color: Colors.orange,
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 6, 42, 72),
                  Color.fromARGB(255, 4, 25, 42),
                  // Color.fromARGB(255, 218, 221, 225),
                ],
                begin: Alignment.topLeft,
                end: Alignment.centerRight,
                stops: [
                  0.0,
                  0.1,
                ],
              ),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.white)),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topRight: Radius.circular(15)),
                  ),
                  child: Center(
                      child: Text(
                    'Joined',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
                ),
              ),
              Positioned(
                bottom: 2,
                right: 0,
                child: ClipPath(
                  clipper: BottomRight(),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 15, 30, 58),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          topLeft: Radius.circular(15)),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 2,
                left: 0,
                child: ClipPath(
                  clipper: BottomLeft(),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 15, 30, 58),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topRight: Radius.circular(15)),
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: 20,
                  right: 0,
                  left: 0,
                  child: Column(
                    children: [
                      Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.white)),
                        child: Center(
                            child: Text(
                          'Match 23',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircleAvatar(
                            radius: 35,
                            child: Image.asset(
                                'assets/images/football_team_a_default_jersey.png'),
                          ),
                          Container(
                            width: 5,
                            height: 80,
                            color: Color.fromARGB(255, 230, 221, 221)
                                .withOpacity(.5),
                          ),
                          CircleAvatar(
                            radius: 35,
                            child: Image.asset(
                                'assets/images/football_team_a_default_jersey.png'),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            child: Stack(
                              children: [
                                Container(
                                  height: 50,
                                  child: Lottie.asset(
                                      'assets/lotties/GamePlanAnimation.json',
                                      fit: BoxFit.cover),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      ClipPath(
                                        clipper: P1(),
                                        child: Container(
                                          height: 30,
                                          width: 14,
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 170, 154, 154),
                                          ),
                                        ),
                                      ),
                                      // SizedBox(
                                      //   width: 5,
                                      // ),
                                      ClipPath(
                                        clipper: Team1Clipper(),
                                        child: Container(
                                          height: 30,
                                          width: 120,
                                          decoration: BoxDecoration(
                                            // color: Colors.orange,
                                            gradient: LinearGradient(
                                              colors: [
                                                Color.fromARGB(255, 95, 5, 107),
                                                Colors.transparent
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              stops: [
                                                0.5,
                                                .9,
                                              ],
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Arg',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          CircleAvatar(
                            radius: 25,
                            child: Image.asset(
                                'assets/images/football_team_a_default_jersey.png'),
                          ),
                          Container(
                            child: Stack(
                              children: [
                                Container(
                                  height: 50,
                                  child: Lottie.asset(
                                      'assets/lotties/GamePlanAnimation.json',
                                      fit: BoxFit.cover),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      ClipPath(
                                        clipper: Team2Clipper(),
                                        child: Container(
                                          height: 30,
                                          width: 120,
                                          decoration: BoxDecoration(
                                            // color: Colors.orange,
                                            gradient: LinearGradient(
                                              colors: [
                                                Colors.transparent,
                                                Color.fromARGB(
                                                    255, 14, 124, 139),
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomCenter,
                                              stops: [
                                                0.0,
                                                0.9,
                                              ],
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Bra',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      ClipPath(
                                        clipper: P2(),
                                        child: Container(
                                          height: 30,
                                          width: 14,
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 170, 154, 154),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Points: 00',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            'Rank: 00',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class BottomRight extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    //path.quadraticBezierTo(100, size.height, 10, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class BottomLeft extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(0, 0);
    //path.quadraticBezierTo(100, size.height, 10, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class P1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(14, size.height - 8);
    path.lineTo(size.width, size.height - 8);
    path.lineTo(size.width - 8, 0);
    //path.quadraticBezierTo(100, size.height, 10, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class P2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(8, 0);
    path.lineTo(0, size.height - 10);
    path.lineTo(size.width - 14, size.height - 10);
    path.lineTo(size.width, 0);
    //path.quadraticBezierTo(100, size.height, 10, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class Team1Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(10, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    //path.quadraticBezierTo(100, size.height, 10, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class Team2Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width - 10, size.height);
    path.lineTo(size.width, 0);
    //path.quadraticBezierTo(100, size.height, 10, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
