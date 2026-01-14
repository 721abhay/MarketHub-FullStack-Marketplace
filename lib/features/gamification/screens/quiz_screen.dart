import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  static const String routeName = '/quiz';
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _isAnswered = false;

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Which brand is known for the slogan "Just Do It"?',
      'options': ['Adidas', 'Nike', 'Puma', 'Reebok'],
      'answer': 'Nike',
    },
    {
      'question': 'What is the primary material used in denim jeans?',
      'options': ['Cotton', 'Polyester', 'Silk', 'Wool'],
      'answer': 'Cotton',
    },
    {
      'question': 'Which of these is NOT a type of coffee?',
      'options': ['Espresso', 'Latte', 'Matcha', 'Cappuccino'],
      'answer': 'Matcha',
    },
     {
      'question': 'What does "SSD" stand for in computing?',
      'options': ['Super Speed Drive', 'Solid State Drive', 'System Storage Disk', 'Smart Secure Data'],
      'answer': 'Solid State Drive',
    },
  ];

  void _checkAnswer(String selectedOption) {
    if (_isAnswered) return;
    
    bool isCorrect = selectedOption == _questions[_currentQuestionIndex]['answer'];
    if (isCorrect) {
      setState(() {
        _score++;
      });
       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Correct! +10 Points'), backgroundColor: Colors.green, duration: Duration(milliseconds: 500)));
    } else {
       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Wrong Answer!'), backgroundColor: Colors.red, duration: Duration(milliseconds: 500)));
    }

    setState(() {
      _isAnswered = true;
    });

    Future.delayed(const Duration(seconds: 1), () {
      if (_currentQuestionIndex < _questions.length - 1) {
        setState(() {
          _currentQuestionIndex++;
          _isAnswered = false;
        });
      } else {
        _showResult();
      }
    });
  }

  void _showResult() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Quiz Completed!'),
        content: Text('You scored $_score / ${_questions.length}'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close Dialog
              Navigator.pop(context); // Go Back
            },
            child: const Text('Collect Reward'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = _questions[_currentQuestionIndex];
    return Scaffold(
      backgroundColor: const Color(0xFF6366F1),
      appBar: AppBar(
        title: const Text('Daily Trivia', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                   Text(
                     'Question ${_currentQuestionIndex + 1} / ${_questions.length}',
                     style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                   ),
                   const SizedBox(height: 16),
                   Text(
                     question['question'],
                     style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                     textAlign: TextAlign.center,
                   ),
                   const SizedBox(height: 32),
                   ...question['options'].map<Widget>((option) {
                     return Padding(
                       padding: const EdgeInsets.only(bottom: 12),
                       child: SizedBox(
                         width: double.infinity,
                         child: ElevatedButton(
                           onPressed: () => _checkAnswer(option),
                           style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: const Color(0xFF6366F1),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              side: const BorderSide(color: Color(0xFF6366F1)),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                           ),
                           child: Text(option, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                         ),
                       ),
                     );
                   }).toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
