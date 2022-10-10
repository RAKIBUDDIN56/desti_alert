import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'dart:math' as math;

class Contain extends StatefulWidget {
  Contain({Key key}) : super(key: key);

  @override
  State<Contain> createState() => _ContainState();
}

class _ContainState extends State<Contain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 74, 26, 71),
      body: Center(
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
                                                  Color.fromARGB(
                                                      255, 95, 5, 107),
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
