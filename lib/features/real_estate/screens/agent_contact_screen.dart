import 'package:markethub/common/widgets/custom_button.dart';
import 'package:markethub/common/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class AgentContactScreen extends StatelessWidget {
  static const String routeName = '/contact-agent';
  const AgentContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController msgController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Contact Agent'), backgroundColor: const Color(0xFF1E293B), foregroundColor: Colors.white),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _buildAgentProfile(),
            const SizedBox(height: 48),
            const Align(alignment: Alignment.centerLeft, child: Text('Send a Message', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))),
            const SizedBox(height: 16),
            CustomTextField(controller: msgController, hintText: 'I would like to schedule a viewing...', maxLines: 6),
            const SizedBox(height: 32),
            CustomButton(text: 'Submit Inquiry', onTap: () {}),
            const SizedBox(height: 48),
            const Text('OR CALL DIRECTLY', style: TextStyle(color: Colors.grey, fontSize: 11, letterSpacing: 2)),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _callAction(Icons.phone, 'Call'),
                const SizedBox(width: 40),
                _callAction(Icons.message, 'Text'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAgentProfile() {
    return Column(
      children: [
        const CircleAvatar(radius: 50, backgroundImage: NetworkImage('https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?auto=format&fit=crop&q=80&w=200')),
        const SizedBox(height: 16),
        const Text('Jane Cooper', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const Text('Senior Property Consultant • 12 years exp', style: TextStyle(color: Colors.grey)),
        const SizedBox(height: 12),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: const [Icon(Icons.star, color: Colors.amber, size: 16), Text(' 4.9 (420 Sales)', style: TextStyle(fontWeight: FontWeight.bold))]),
      ],
    );
  }

  Widget _callAction(IconData icon, String label) {
    return Column(children: [CircleAvatar(radius: 28, backgroundColor: const Color(0xFFF1F5F9), child: Icon(icon, color: const Color(0xFF1E293B))), const SizedBox(height: 8), Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12))]);
  }
}
