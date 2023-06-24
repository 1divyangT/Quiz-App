import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen(this.start, {super.key});

  final Function() start;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/flag.png',
            height: 300,
          ),
          const SizedBox(height: 40),
          Text(
            'Learn about your glorious history!',
            style: GoogleFonts.lato(
                color: Color.fromARGB(255, 192, 234, 248),
                fontWeight: FontWeight.bold,
                fontSize: 30),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: start,
            label: const Text(
              'Start Quiz!',
              style: TextStyle(
                color: Color.fromARGB(255, 58, 253, 74),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            icon:
                const Icon(Icons.arrow_right_alt_outlined, color: Colors.white),
          )
        ],
      ),
    );
  }
}
