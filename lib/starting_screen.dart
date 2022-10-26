import 'package:audioplayers/audioplayers.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import 'dart:math';

import 'dart:async';
import 'poem.dart';

// ignore: camel_case_types
class startingScreen extends StatefulWidget {
  const startingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _startingScreenState createState() => _startingScreenState();
}

// ignore: camel_case_types
class _startingScreenState extends State<startingScreen> {
  ConfettiController _controllerCenterRight = ConfettiController();
  ConfettiController _controllerCenterLeft = ConfettiController();
  late Timer _timer;
  int _start = 5;
  void startTimer() {
    const oneSec = Duration(seconds: 3);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          if (_start == 0) {
            _controllerCenterRight.play();
            _controllerCenterLeft.play();
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  @override
  void initState() {
    _controllerCenterRight =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerCenterLeft =
        ConfettiController(duration: const Duration(seconds: 10));
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    _controllerCenterRight.dispose();
    _controllerCenterLeft.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    startTimer();
    return SafeArea(
      child: Scaffold(
        // ignore: sized_box_for_whitespace
        bottomNavigationBar: Container(
          height: 50,
          child: const BottomAppBar(
            shape: CircularNotchedRectangle(),
            color: Colors.pinkAccent,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final player = AudioPlayer();
            player.play(AssetSource("song.mp3"));
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  Poem(),
                ));
          },
          backgroundColor: const Color.fromRGBO(19, 25, 91, 1),
          child: const Icon(
            Icons.play_circle_fill_sharp,
            color: Colors.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 161, 156, 158),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ClipPath(
                clipper: WaveClipperTwo(),
                child: Container(
                  height: 220,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "$_start",
                      style: const TextStyle(
                          fontWeight: FontWeight.w900, fontSize: 50),
                    )),
              ),
              Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerRight,
                    child: ConfettiWidget(
                      confettiController: _controllerCenterRight,
                      blastDirection: pi,
                      particleDrag: 0.05,
                      emissionFrequency: 0.05,
                      numberOfParticles: 20,
                      gravity: 0.05,
                      shouldLoop: false,
                      colors: const [
                        Colors.green,
                        Colors.blue,
                        Colors.pinkAccent
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ConfettiWidget(
                      confettiController: _controllerCenterLeft,
                      blastDirection: 0,
                      emissionFrequency: 0.6,
                      minimumSize: const Size(10, 10),
                      maximumSize: const Size(50, 50),
                      numberOfParticles: 1,
                      gravity: 0.1,
                    ),
                  ),
                  Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 5.0, left: 20),
                        child: Text(
                          " Happy ",
                          style: TextStyle(
                              color: Color(0xff13195b),
                              fontWeight: FontWeight.w900,
                              fontSize: 90),
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 70.0),
                        child: Text(
                          "Birthday ",
                          style: TextStyle(
                              color: Color(0xff13195b),
                              fontWeight: FontWeight.w900,
                              fontSize: 50),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
