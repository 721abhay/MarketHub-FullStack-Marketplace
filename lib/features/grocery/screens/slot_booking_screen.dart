import 'package:markethub/common/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class SlotBookingScreen extends StatefulWidget {
  static const String routeName = '/slot-booking';
  const SlotBookingScreen({super.key});

  @override
  State<SlotBookingScreen> createState() => _SlotBookingScreenState();
}

class _SlotBookingScreenState extends State<SlotBookingScreen> {
  int selectedDateIndex = 0;
  int selectedSlotIndex = -1;

  final dates = ['Tomorrow', '16 Jan', '17 Jan', '18 Jan', '19 Jan'];
  final slots = [
    '06:00 AM - 09:00 AM',
    '09:00 AM - 12:00 PM',
    '12:00 PM - 03:00 PM',
    '03:00 PM - 06:00 PM',
    '06:00 PM - 09:00 PM',
    '09:00 PM - 11:00 PM',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Book Delivery Slot', style: TextStyle(fontWeight: FontWeight.bold)),
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
                  const Text('Select Date', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: dates.length,
                      itemBuilder: (context, index) {
                        bool isSelected = selectedDateIndex == index;
                        return GestureDetector(
                          onTap: () => setState(() => selectedDateIndex = index),
                          child: Container(
                            margin: const EdgeInsets.only(right: 12),
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            decoration: BoxDecoration(
                              color: isSelected ? const Color(0xFF16A34A) : const Color(0xFFF1F5F9),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              dates[index],
                              style: TextStyle(color: isSelected ? Colors.white : Colors.black, fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text('Select Time Slot', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: slots.length,
                    itemBuilder: (context, index) {
                      bool isSelected = selectedSlotIndex == index;
                      return GestureDetector(
                        onTap: () => setState(() => selectedSlotIndex = index),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: isSelected ? const Color(0xFFF0FDF4) : Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: isSelected ? const Color(0xFF16A34A) : const Color(0xFFE2E8F0), width: 1.5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(slots[index], style: TextStyle(fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
                              if (isSelected) const Icon(Icons.check_circle_rounded, color: Color(0xFF16A34A)),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: CustomButton(
              text: 'Confirm Slot',
              onTap: () {
                if (selectedSlotIndex == -1) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please select a time slot')));
                  return;
                }
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Delivery slot confirmed!'), backgroundColor: Color(0xFF16A34A)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
