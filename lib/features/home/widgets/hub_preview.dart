import 'package:markethub/features/hub/screens/main_hub_dashboard.dart';
import 'package:flutter/material.dart';

class HubPreview extends StatelessWidget {
  const HubPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'MarketHub Super Services',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E293B),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, MainHubDashboard.routeName),
                child: const Text('View Hub', style: TextStyle(color: Color(0xFF6366F1), fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              _buildHubItem(context, Icons.flight_rounded, 'Travel', Colors.indigo),
              const SizedBox(width: 12),
              _buildHubItem(context, Icons.home_work_rounded, 'Real Estate', Colors.deepPurple),
              const SizedBox(width: 12),
              _buildHubItem(context, Icons.work_rounded, 'Careers', Colors.orange),
              const SizedBox(width: 12),
              _buildHubItem(context, Icons.medical_services_rounded, 'Health', Colors.redAccent),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHubItem(BuildContext context, IconData icon, String label, Color color) {
    return Expanded(
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, MainHubDashboard.routeName),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: color.withValues(alpha: 0.1)),
          ),
          child: Column(
            children: [
              Icon(icon, color: color, size: 28),
              const SizedBox(height: 12),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E293B),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
