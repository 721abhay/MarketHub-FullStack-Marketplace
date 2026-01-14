import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/features/health/screens/consultation_chat_screen.dart';
import 'package:flutter/material.dart';

class DoctorConsultationScreen extends StatelessWidget {
  static const String routeName = '/doctor-consultation';
  const DoctorConsultationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Consult a Doctor', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(color: const Color(0xFFEEF2FF), borderRadius: BorderRadius.circular(24)),
                    child: Row(
                      children: [
                        const Icon(Icons.video_call_rounded, color: Color(0xFF6366F1), size: 48),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Video Consultation', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                              Text('Talk to a specialist within 10 mins', style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text('Available Specialists', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  _buildDoctorCard('Dr. Sarah Johnson', 'General Physician', '4.9 (1.2k)', 'https://images.unsplash.com/photo-1559839734-2b71f1536780?auto=format&fit=crop&q=80&w=200'),
                  _buildDoctorCard('Dr. Michael Chen', 'Cardiologist', '5.0 (800)', 'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?auto=format&fit=crop&q=80&w=200'),
                  _buildDoctorCard('Dr. Emily Davis', 'Dermatologist', '4.8 (950)', 'https://images.unsplash.com/photo-1594824476967-48c8b964273f?auto=format&fit=crop&q=80&w=200'),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: CustomButton(text: 'Start Fast Consult', onTap: () {}),
          ),
        ],
      ),
    );
  }

  Widget _buildDoctorCard(String name, String spec, String rating, String img) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        children: [
          CircleAvatar(radius: 30, backgroundImage: NetworkImage(img)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text(spec, style: const TextStyle(color: Colors.grey, fontSize: 13)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 14),
                    Text(' $rating', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
          Builder(
            builder: (context) => TextButton(onPressed: () => Navigator.pushNamed(context, ConsultationChatScreen.routeName, arguments: name), child: const Text('Book')),
          ),
        ],
      ),
    );
  }
}
