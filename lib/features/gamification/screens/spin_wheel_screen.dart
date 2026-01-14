import 'dart:math';

import 'package:flutter/material.dart';

class SpinWheelScreen extends StatefulWidget {
  static const String routeName = '/spin-wheel';
  const SpinWheelScreen({super.key});

  @override
  State<SpinWheelScreen> createState() => _SpinWheelScreenState();
}

class _SpinWheelScreenState extends State<SpinWheelScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double _angle = 0;
  // final Random _random = Random();
  bool _isSpinning = false;

  // final List<String> _prizes = ['10% OFF', 'Try Again', '50 Coins', 'Free Ship', '10 Coins', 'Jackpot'];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    _controller.addListener(() {
      setState(() {
        _angle = _controller.value * 2 * pi * 5 + _angle; // 5 spins
      });
    });
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isSpinning = false;
        });
        _showPrize();
      }
    });
  }

  void _spin() {
    if (_isSpinning) return;
    setState(() {
      _isSpinning = true;
      // Randomize end point (not perfect, but good for visual)
    });
    _controller.forward(from: 0).then((_) {
       // stop logic handled in listener
    });
  }

  void _showPrize() {
     ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('You won 50 Coins! (Mock)')),
     );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6366F1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.white),
        title: const Text('Spin & Win', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                // Wheel (Mock Visual)
                Transform.rotate(
                  angle: _angle,
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [BoxShadow(blurRadius: 20, color: Colors.black26)],
                    ),
                    child: CustomPaint(
                      painter: WheelPainter(colors: [
                        Colors.redAccent, Colors.orangeAccent, Colors.amber, Colors.greenAccent, Colors.blueAccent, Colors.purpleAccent
                      ]),
                    ),
                  ),
                ),
                // Indicator
                Positioned(
                  top: 0,
                  child: Icon(Icons.arrow_drop_down_rounded, size: 50, color: Colors.black),
                ),
                // Center Button
                GestureDetector(
                  onTap: _spin,
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black26)],
                      border: Border.all(color: const Color(0xFF6366F1), width: 4),
                    ),
                    child: Center(
                      child: Text(
                        _isSpinning ? '...' : 'SPIN',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF6366F1)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            const Text(
              'Spin to win amazing rewards!',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
             const SizedBox(height: 8),
            const Text(
              '1 Free Spin Daily',
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

class WheelPainter extends CustomPainter {
  final List<Color> colors;
  WheelPainter({required this.colors});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final sweepAngle = 2 * pi / colors.length;

    for (int i = 0; i < colors.length; i++) {
      final paint = Paint()..color = colors[i];
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        i * sweepAngle,
        sweepAngle,
        true,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
