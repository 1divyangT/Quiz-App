import 'package:flutter/material.dart';

import 'package:quiz_app/questionAnswerSummary/question_summary_blueprint.dart';

class QuestionAnswerSummary extends StatelessWidget {
  const QuestionAnswerSummary({required this.summaryData, super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...summaryData.map(
              (data) {
                return SummaryBlueprint(indivdualMap: data);
              },
            ).toList(),
          ],
        ),
      ),
    );
  }
}
