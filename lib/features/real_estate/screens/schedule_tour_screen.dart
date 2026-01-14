import 'package:markethub/common/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ScheduleTourScreen extends StatefulWidget {
  static const String routeName = '/schedule-tour';
  final Map<String, dynamic> property;
  const ScheduleTourScreen({super.key, required this.property});

  @override
  State<ScheduleTourScreen> createState() => _ScheduleTourScreenState();
}

class _ScheduleTourScreenState extends State<ScheduleTourScreen> {
  DateTime _selectedDate = DateTime.now().add(const Duration(days: 1));
  String _selectedSlot = '10:00 AM';

  final List<String> _slots = ['09:00 AM', '10:00 AM', '11:00 AM', '02:00 PM', '04:00 PM', '05:00 PM'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Schedule a Tour', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                const Text('Pick a Date', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                CalendarDatePicker(
                  initialDate: _selectedDate,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 30)),
                  onDateChanged: (date) => setState(() => _selectedDate = date),
                ),
                const SizedBox(height: 32),
                const Text('Preferred Time Slot', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: _slots.map((slot) => _buildSlot(slot)).toList(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: CustomButton(
              text: 'Confirm Visit',
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.celebration_rounded, color: Color(0xFF4F46E5), size: 60),
                        const SizedBox(height: 16),
                        const Text('Tour Confirmed!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                        const SizedBox(height: 8),
                        Text('We\'ll see you on ${_selectedDate.day}/${_selectedDate.month} at $_selectedSlot', textAlign: TextAlign.center, style: const TextStyle(color: Colors.grey)),
                      ],
                    ),
                    actions: [TextButton(onPressed: () { Navigator.pop(context); Navigator.pop(context); }, child: const Text('Visit Hub'))],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSlot(String slot) {
    bool isSelected = _selectedSlot == slot;
    return GestureDetector(
      onTap: () => setState(() => _selectedSlot = slot),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF4F46E5) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isSelected ? const Color(0xFF4F46E5) : const Color(0xFFE2E8F0)),
        ),
        child: Text(slot, style: TextStyle(color: isSelected ? Colors.white : Colors.black87, fontWeight: FontWeight.bold, fontSize: 13)),
      ),
    );
  }
}
