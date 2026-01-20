import 'package:flutter/material.dart';

class SecurityCameraFeed extends StatelessWidget {
  static const String routeName = '/security-camera';
  final String cameraName;
  const SecurityCameraFeed({super.key, required this.cameraName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('Live Feed - $cameraName'), backgroundColor: Colors.transparent, foregroundColor: Colors.white, elevation: 0),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(color: Colors.white10), 
              child: const Center(
                child: Text(
                  'LIVE VIDEO FEED', 
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 2)
                )
              )
            )
          ),
          Container(
            padding: const EdgeInsets.all(40),
            decoration: const BoxDecoration(
              color: Color(0xFF1E293B), 
              borderRadius: BorderRadius.vertical(top: Radius.circular(40))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _cameraAction(Icons.mic, 'Speak'),
                _cameraAction(Icons.camera, 'Snapshot'),
                _cameraAction(Icons.notifications_active, 'Alarm', Colors.red),
                _cameraAction(Icons.history, 'History'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _cameraAction(IconData icon, String label, [Color color = Colors.white]) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white12, 
          child: Icon(icon, color: color, size: 20)
        ), 
        const SizedBox(height: 12), 
        Text(label, style: TextStyle(color: color, fontSize: 11))
      ]
    );
  }
}
