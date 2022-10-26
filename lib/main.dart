import 'package:flutter/material.dart';
import 'package:musical_birhday_card/starting_screen.dart';

void main() {
  runApp(const BirthdayCard());
}

// ignore: must_be_immutable
class BirthdayCard extends StatelessWidget {
  const BirthdayCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: startingScreen());
  }
}
