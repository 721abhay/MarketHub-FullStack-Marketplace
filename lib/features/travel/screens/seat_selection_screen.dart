import 'package:markethub/common/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class SeatSelectionScreen extends StatefulWidget {
  static const String routeName = '/seat-selection';
  const SeatSelectionScreen({super.key});

  @override
  State<SeatSelectionScreen> createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  final Set<String> _selectedSeats = {};
  
  final List<String> _rows = ['A', 'B', 'C', 'D', 'E', 'F'];
  final List<int> _cols = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Choose Your Seat', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          _buildLegend(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                children: _cols.map((c) => _buildRow(c)).toList(),
              ),
            ),
          ),
          _buildPaymentBar(),
        ],
      ),
    );
  }

  Widget _buildLegend() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(color: Color(0xFFF8FAFC)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _legendItem(const Color(0xFFE2E8F0), 'Available'),
          _legendItem(const Color(0xFF6366F1), 'Selected'),
          _legendItem(const Color(0xFFCBD5E1), 'Reserved'),
        ],
      ),
    );
  }

  Widget _legendItem(Color color, String label) {
    return Row(children: [Container(width: 12, height: 12, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(4))), const SizedBox(width: 8), Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey))]);
  }

  Widget _buildRow(int colIndex) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ..._rows.take(3).map((r) => _seatItem(r, colIndex)),
          const SizedBox(width: 32),
          ..._rows.skip(3).map((r) => _seatItem(r, colIndex)),
        ],
      ),
    );
  }

  Widget _seatItem(String row, int col) {
    final seatId = '$row$col';
    bool isSelected = _selectedSeats.contains(seatId);
    bool isReserved = col % 4 == 0; // Mock reserved seats

    return GestureDetector(
      onTap: () {
        if (!isReserved) {
          setState(() {
            if (isSelected) {
              _selectedSeats.remove(seatId);
            } else {
              _selectedSeats.add(seatId);
            }
          });
        }
      },
      child: Container(
        margin: const EdgeInsets.all(4),
        width: 32, height: 32,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF6366F1) : (isReserved ? const Color(0xFFCBD5E1) : const Color(0xFFE2E8F0)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(child: Text(seatId, style: TextStyle(color: isSelected ? Colors.white : Colors.black45, fontSize: 8, fontWeight: FontWeight.bold))),
      ),
    );
  }

  Widget _buildPaymentBar() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(32)), boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)]),
      child: SafeArea(
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('${_selectedSeats.length} Seats Selected', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                Text('\$${_selectedSeats.length * 245}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF6366F1))),
              ],
            ),
            const SizedBox(width: 32),
            Expanded(
              child: CustomButton(
                text: 'Confirm Flight',
                onTap: () {
                  if (_selectedSeats.isEmpty) {
                    return;
                  }
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                      title: const Text('Booked!'),
                      content: Text('Your seats (${_selectedSeats.join(', ')}) have been reserved.'),
                      actions: [TextButton(onPressed: () { Navigator.pop(context); Navigator.pop(context); Navigator.pop(context); }, child: const Text('Done'))],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
