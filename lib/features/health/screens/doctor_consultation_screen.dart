import 'package:markethub/common/widgets/custom_button.dart';
import 'package:markethub/common/widgets/shimmer_loader.dart';
import 'package:markethub/features/health/screens/consultation_chat_screen.dart';
import 'package:markethub/features/hub/services/hub_services.dart';
import 'package:markethub/models/service_models.dart';
import 'package:flutter/material.dart';

class DoctorConsultationScreen extends StatefulWidget {
  static const String routeName = '/doctor-consultation';
  const DoctorConsultationScreen({super.key});

  @override
  State<DoctorConsultationScreen> createState() => _DoctorConsultationScreenState();
}

class _DoctorConsultationScreenState extends State<DoctorConsultationScreen> {
  final HubServices hubServices = HubServices();
  List<HealthProvider>? doctors;

  @override
  void initState() {
    super.initState();
    _loadDoctors();
  }

  void _loadDoctors() async {
    final list = await hubServices.fetchHealthConsultations(context: context);
    setState(() {
      doctors = list;
    });
  }

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
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0FDF4), // Success Light
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.video_call_rounded, color: Color(0xFF10B981), size: 48),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Instant Video Consult', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                              Text('Connect with a GP within 5 minutes', style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text('Available Specialists', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  if (doctors == null)
                    const Column(
                      children: [
                        ShimmerLoader(width: double.infinity, height: 100),
                        SizedBox(height: 16),
                        ShimmerLoader(width: double.infinity, height: 100),
                      ],
                    )
                  else
                    ...doctors!.map((doc) => _buildDoctorCard(doc)),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: CustomButton(
                text: 'Fast Track Consult (\$20)',
                onTap: () {
                  // Book fast track
                }),
          ),
        ],
      ),
    );
  }

  Widget _buildDoctorCard(HealthProvider doctor) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(doctor.imageUrl)),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(color: const Color(0xFF10B981), shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 2)),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(doctor.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text('${doctor.specialty} • ${doctor.experience}', style: const TextStyle(color: Colors.grey, fontSize: 13)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star_rounded, color: Colors.amber, size: 16),
                    Text(' ${doctor.rating}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                    const SizedBox(width: 8),
                    Text('Fee: \$${doctor.fee}', style: const TextStyle(color: Color(0xFF6366F1), fontWeight: FontWeight.bold, fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, ConsultationChatScreen.routeName, arguments: doctor.name),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF6366F1),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              elevation: 0,
            ),
            child: const Text('Book', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
