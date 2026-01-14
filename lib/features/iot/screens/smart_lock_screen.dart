import 'package:flutter/material.dart';

class SmartDoorLockControl extends StatefulWidget {
  static const String routeName = '/door-lock';
  const SmartDoorLockControl({super.key});

  @override
  State<SmartDoorLockControl> createState() => _SmartDoorLockControlState();
}

class _SmartDoorLockControlState extends State<SmartDoorLockControl> {
  bool _isLocked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(title: const Text('Entry Management'), backgroundColor: Colors.transparent, foregroundColor: Colors.white, elevation: 0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => setState(() => _isLocked = !_isLocked),
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _isLocked ? Colors.red.withValues(alpha: 0.1) : Colors.green.withValues(alpha: 0.1),
                  border: Border.all(color: _isLocked ? Colors.red : Colors.green, width: 4),
                  boxShadow: [BoxShadow(color: (_isLocked ? Colors.red : Colors.green).withValues(alpha: 0.2), blurRadius: 40)],
                ),
                child: Icon(_isLocked ? Icons.lock_rounded : Icons.lock_open_rounded, color: _isLocked ? Colors.red : Colors.green, size: 80),
              ),
            ),
            const SizedBox(height: 48),
            Text(_isLocked ? 'DOOR LOCKED' : 'DOOR UNLOCKED', style: TextStyle(color: _isLocked ? Colors.red : Colors.green, fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 2)),
            const SizedBox(height: 12),
            const Text('Last changed 2 mins ago by Admin', style: TextStyle(color: Colors.grey, fontSize: 13)),
          ],
        ),
      ),
    );
  }
}
