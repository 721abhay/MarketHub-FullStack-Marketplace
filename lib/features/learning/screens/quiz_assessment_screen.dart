import 'package:markethub/common/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class QuizAssessmentScreen extends StatefulWidget {
  static const String routeName = '/quiz-assessment';
  const QuizAssessmentScreen({super.key});

  @override
  State<QuizAssessmentScreen> createState() => _QuizAssessmentScreenState();
}

class _QuizAssessmentScreenState extends State<QuizAssessmentScreen> {
  int _selectedOption = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Knowledge Check'), backgroundColor: const Color(0xFF6366F1), foregroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Question 4 of 10', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const Text('What is the primary purpose of data normalization in machine learning?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, height: 1.4)),
            const SizedBox(height: 48),
            _buildOption(0, 'To increase the size of the dataset.'),
            _buildOption(1, 'To ensure all features are on a similar scale.'),
            _buildOption(2, 'To remove outliers automatically.'),
            _buildOption(3, 'To visualize the data effectively.'),
            const Spacer(),
            CustomButton(text: 'Submit Answer', onTap: () {}),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(int index, String text) {
    bool isSelected = _selectedOption == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedOption = index),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: isSelected ? Color(0xFF6366F1).withValues(alpha: 0.1) : Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: isSelected ? const Color(0xFF6366F1) : Colors.grey[300]!)),
        child: Row(
          children: [
            CircleAvatar(radius: 12, backgroundColor: isSelected ? const Color(0xFF6366F1) : Colors.grey[200], child: Text(String.fromCharCode(65 + index), style: TextStyle(color: isSelected ? Colors.white : Colors.black87, fontSize: 12, fontWeight: FontWeight.bold))),
            const SizedBox(width: 16),
            Expanded(child: Text(text, style: TextStyle(color: isSelected ? const Color(0xFF6366F1) : Colors.black87, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal))),
          ],
        ),
      ),
    );
  }
}
