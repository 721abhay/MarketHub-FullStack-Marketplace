import 'package:flutter/material.dart';
import 'dart:ui';

class QRScannerScreen extends StatefulWidget {
  static const String routeName = '/qr-scanner';
  const QRScannerScreen({super.key});

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scanAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _scanAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Mock Camera Background (Blurred Image)
          Positioned.fill(
            child: Image.network(
              'https://images.unsplash.com/photo-1557683316-973673baf926?auto=format&fit=crop&q=80&w=1000',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(color: Colors.black.withValues(alpha: 0.5)),
            ),
          ),

          // Scanning Overlay
          _buildScannerOverlay(context),

          // Header
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close_rounded, color: Colors.white, size: 28),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Text(
                    'SCAN & PAY',
                    style: TextStyle(
                      color: Colors.white, 
                      fontWeight: FontWeight.bold, 
                      letterSpacing: 2,
                      fontSize: 13,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.flash_off_rounded, color: Colors.white, size: 24),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),

          // Bottom Actions
          Positioned(
            bottom: 64,
            left: 0,
            right: 0,
            child: Column(
              children: [
                const Text(
                  'Scan any QR to pay or connect',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildActionButton(Icons.photo_library_rounded, 'Gallery'),
                    const SizedBox(width: 48),
                    _buildActionButton(Icons.qr_code_2_rounded, 'My Code'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScannerOverlay(BuildContext context) {
    double size = MediaQuery.of(context).size.width * 0.7;
    return Center(
      child: Stack(
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white24, width: 2),
              borderRadius: BorderRadius.circular(32),
            ),
          ),
          // Animated Scan Line
          AnimatedBuilder(
            animation: _scanAnimation,
            builder: (context, child) {
              return Positioned(
                top: _scanAnimation.value * size,
                left: 0,
                right: 0,
                child: Container(
                  height: 2,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.indigoAccent.withValues(alpha: 0.5),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                    gradient: const LinearGradient(
                      colors: [Colors.transparent, Colors.indigoAccent, Colors.transparent],
                    ),
                  ),
                ),
              );
            },
          ),
          // Corners
          Positioned(top: 0, left: 0, child: _ScannerCorner(quarter: 0)),
          Positioned(top: 0, right: 0, child: _ScannerCorner(quarter: 1)),
          Positioned(bottom: 0, left: 0, child: _ScannerCorner(quarter: 3)),
          Positioned(bottom: 0, right: 0, child: _ScannerCorner(quarter: 2)),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.1),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white24),
          ),
          child: Icon(icon, color: Colors.white, size: 28),
        ),
        const SizedBox(height: 12),
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class _ScannerCorner extends StatelessWidget {
  final int quarter;
  const _ScannerCorner({required this.quarter});

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: quarter,
      child: Container(
        height: 30,
        width: 30,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.indigoAccent, width: 4),
            left: BorderSide(color: Colors.indigoAccent, width: 4),
          ),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(8)),
        ),
      ),
    );
  }
}
