import 'package:flutter/material.dart';

import 'package:quiz_app/questionAnswerSummary/question_identifier.dart';

import 'package:google_fonts/google_fonts.dart';

class SummaryBlueprint extends StatelessWidget {
  const SummaryBlueprint({required this.indivdualMap, super.key});

  final Map<String, Object> indivdualMap;

  @override
  Widget build(context) {
    final isCorrect =
        indivdualMap['selected_answer'] == indivdualMap['correct_answer'];

    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier(
              isCorrect: isCorrect,
              questionIndex: indivdualMap['question_index'] as int),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  indivdualMap['question'] as String,
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16),
                ),
                const SizedBox(height: 5),
                Text(
                  indivdualMap['selected_answer'] as String,
                  style: GoogleFonts.lato(
                    color: isCorrect
                        ? const Color.fromARGB(255, 3, 105, 6)
                        : const Color.fromARGB(255, 183, 28, 17),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  indivdualMap['correct_answer'] as String,
                  style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 3, 105, 6),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
