import 'package:markethub/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressBox extends StatelessWidget {
  const AddressBox({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Container(
      height: 44,
      decoration: const BoxDecoration(
        color: Color(0xFFF1F5F9), // Slate 100
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          const Icon(
            Icons.location_on_rounded,
            size: 18,
            color: Color(0xFF6366F1),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Delivery to ${user.name} • ${user.address.isEmpty ? 'Add your address' : user.address}',
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: Color(0xFF475569), // Slate 600
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 18,
            color: Color(0xFF94A3B8),
          )
        ],
      ),
    );
  }
}
