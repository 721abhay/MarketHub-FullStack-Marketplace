import 'package:markethub/common/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class DailyQuizScreen extends StatefulWidget {
  static const String routeName = '/quiz';
  const DailyQuizScreen({super.key});

  @override
  State<DailyQuizScreen> createState() => _DailyQuizScreenState();
}

class _DailyQuizScreenState extends State<DailyQuizScreen> {
  int _currentQuestion = 0;
  int _score = 0;
  bool _answered = false;
  int? _selectedOption;

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Which vertical in MarketHub allows you to track milk delivery?',
      'options': ['Grocery', 'Travel', 'Real Estate', 'Services'],
      'answer': 0,
    },
    {
      'question': 'What is the maximum limit for MarketHub Wallet top-up?',
      'options': ['\$500', '\$1,000', '\$5,000', '\$10,000'],
      'answer': 2,
    },
    {
      'question': 'How many Reward Coins do you get for a Daily Login?',
      'options': ['5 Coins', '10 Coins', '50 Coins', '100 Coins'],
      'answer': 1,
    }
  ];

  void _submitAnswer() {
    if (_selectedOption == _questions[_currentQuestion]['answer']) {
      _score += 10;
    }
    setState(() {
      _answered = true;
    });
  }

  void _nextQuestion() {
    if (_currentQuestion < _questions.length - 1) {
      setState(() {
        _currentQuestion++;
        _answered = false;
        _selectedOption = null;
      });
    } else {
      _showResult();
    }
  }

  void _showResult() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: const Text('Quiz Completed!', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.stars_rounded, color: Colors.amber, size: 64),
            const SizedBox(height: 16),
            Text('You earned $_score MarketHub Coins!', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          CustomButton(
            text: 'Collect Rewards',
            onTap: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var q = _questions[_currentQuestion];

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Daily Quiz', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        leading: IconButton(icon: const Icon(Icons.close, color: Colors.white), onPressed: () => Navigator.pop(context)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearProgressIndicator(
              value: (_currentQuestion + 1) / _questions.length,
              backgroundColor: Colors.white12,
              valueColor: const AlwaysStoppedAnimation(Color(0xFF6366F1)),
            ),
            const SizedBox(height: 48),
            Text(
              'Question ${_currentQuestion + 1} of ${_questions.length}',
              style: const TextStyle(color: Color(0xFF6366F1), fontWeight: FontWeight.bold, letterSpacing: 1),
            ),
            const SizedBox(height: 16),
            Text(
              q['question'],
              style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 48),
            ...List.generate(q['options'].length, (index) {
              bool isSelected = _selectedOption == index;
              bool isCorrect = _answered && index == q['answer'];
              bool isWrong = _answered && isSelected && index != q['answer'];

              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: InkWell(
                  onTap: _answered ? null : () => setState(() => _selectedOption = index),
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: isCorrect ? Colors.green.withValues(alpha: 0.1) : isWrong ? Colors.red.withValues(alpha: 0.1) : isSelected ? Colors.white.withValues(alpha: 0.1) : Colors.white.withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isCorrect ? Colors.green : isWrong ? Colors.red : isSelected ? const Color(0xFF6366F1) : Colors.white12,
                        width: 2,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(q['options'][index], style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
                        if (isCorrect) const Icon(Icons.check_circle, color: Colors.green),
                        if (isWrong) const Icon(Icons.cancel, color: Colors.red),
                      ],
                    ),
                  ),
                ),
              );
            }),
            const Spacer(),
            CustomButton(
              text: _answered ? (_currentQuestion == _questions.length - 1 ? 'Finish Quiz' : 'Next Question') : 'Submit Answer',
              onTap: _answered ? _nextQuestion : (_selectedOption != null ? _submitAnswer : () {}),
              color: _selectedOption != null ? const Color(0xFF6366F1) : Colors.grey.shade800,
            ),
          ],
        ),
      ),
    );
  }
}
