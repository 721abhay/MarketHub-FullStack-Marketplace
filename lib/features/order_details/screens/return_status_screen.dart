import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

class ReturnStatusScreen extends StatelessWidget {
  static const String routeName = '/return-status';
  const ReturnStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock Data
    final steps = [
      {'title': 'Request Submitted', 'date': 'Jan 13, 2026', 'isCompleted': true},
      {'title': 'Approved', 'date': 'Jan 14, 2026', 'isCompleted': true},
      {'title': 'Pickup Scheduled', 'date': 'Jan 15, 2026', 'isCompleted': false},
      {'title': 'Refund Initiated', 'date': 'Pending', 'isCompleted': false},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: const Text(
            'Return Status',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                   const Icon(Icons.assignment_return_outlined, size: 48, color: Color(0xFF6366F1)),
                   const SizedBox(height: 16),
                   const Text(
                     'Return #RT-982374',
                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                   ),
                   const Text(
                     'Samsung Galaxy S23 Ultra',
                     style: TextStyle(color: Color(0xFF64748B)),
                   ),
                   const SizedBox(height: 32),
                   ListView.builder(
                     shrinkWrap: true,
                     physics: const NeverScrollableScrollPhysics(),
                     itemCount: steps.length,
                     itemBuilder: (context, index) {
                       final step = steps[index];
                       final isLast = index == steps.length - 1;
                       
                       return Row(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Column(
                             children: [
                               Container(
                                 width: 20,
                                 height: 20,
                                 decoration: BoxDecoration(
                                   color: step['isCompleted'] as bool ? const Color(0xFF10B981) : Colors.grey[300],
                                   shape: BoxShape.circle,
                                 ),
                                 child: step['isCompleted'] as bool ? const Icon(Icons.check, size: 12, color: Colors.white) : null,
                               ),
                               if (!isLast)
                                 Container(
                                   width: 2,
                                   height: 40,
                                   color: Colors.grey[300],
                                 ),
                             ],
                           ),
                           const SizedBox(width: 16),
                           Expanded(
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text(
                                   step['title'] as String,
                                   style: TextStyle(
                                     fontWeight: FontWeight.bold,
                                     color: step['isCompleted'] as bool ? const Color(0xFF1E293B) : Colors.grey,
                                   ),
                                 ),
                                 if (step['date'] != 'Pending')
                                   Text(
                                     step['date'] as String,
                                     style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                                   ),
                                   const SizedBox(height: 24),
                               ],
                             ),
                           ),
                         ],
                       );
                     },
                   ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
