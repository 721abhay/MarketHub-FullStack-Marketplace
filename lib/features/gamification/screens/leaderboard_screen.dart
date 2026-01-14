import 'package:markethub/constants/global_variables.dart';
import 'package:flutter/material.dart';

class LeaderboardScreen extends StatelessWidget {
  static const String routeName = '/leaderboard';
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock Leaderboard Data
    final List<Map<String, dynamic>> users = [
      {'name': 'Alex Johnson', 'points': 5430, 'avatar': 'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?auto=format&fit=crop&w=100&q=80', 'rank': 1},
      {'name': 'Sarah Smith', 'points': 4920, 'avatar': 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=100&q=80', 'rank': 2},
      {'name': 'Mike Brown', 'points': 4100, 'avatar': 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=100&q=80', 'rank': 3},
      {'name': 'You', 'points': 2450, 'avatar': '', 'rank': 145},
      {'name': 'Emily Davis', 'points': 3800, 'avatar': 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?auto=format&fit=crop&w=100&q=80', 'rank': 4},
      {'name': 'David Wilson', 'points': 3650, 'avatar': 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=100&q=80', 'rank': 5},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: const Text(
            'Leaderboard',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              decoration: const BoxDecoration(
                gradient: GlobalVariables.appBarGradient,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                   _buildTopRank(users[1], 80), // 2nd
                   _buildTopRank(users[0], 100), // 1st
                   _buildTopRank(users[2], 80), // 3rd
                ],
              ),
            ),
            const SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: users.length - 3,
              itemBuilder: (context, index) {
                // Offset by 3 for top ranks
                final user = users[index + 3];
                bool isMe = user['name'] == 'You';
                
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: isMe ? const Color(0xFFEEF2FF) : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: isMe ? Border.all(color: const Color(0xFF6366F1)) : null,
                    boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 5)],
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      backgroundImage: user['avatar'] != '' ? NetworkImage(user['avatar']) : null,
                      child: Text('${user['rank']}', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)),
                    ),
                    title: Text(user['name'], style: TextStyle(fontWeight: FontWeight.bold, color: isMe ? const Color(0xFF6366F1) : Colors.black87)),
                    trailing: Text(
                      '${user['points']} pts',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.orange),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopRank(Map<String, dynamic> user, double size) {
    bool isFirst = user['rank'] == 1;
    return Column(
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: isFirst ? Colors.amber : Colors.white, width: 4),
              ),
              child: CircleAvatar(
                radius: size / 2,
                backgroundImage: NetworkImage(user['avatar']),
              ),
            ),
            if (isFirst)
              const Positioned(
                right: 0,
                child: CircleAvatar(backgroundColor: Colors.amber, radius: 12, child: Icon(Icons.star, size: 16, color: Colors.white)),
              ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          user['name'],
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Text(
          '${user['points']}',
          style: TextStyle(color: Colors.white.withValues(alpha: 0.8), fontSize: 12),
        ),
        if (isFirst) ...[
          const SizedBox(height: 8), 
          const Icon(Icons.workspace_premium, color: Colors.amber, size: 32)
        ] else 
           const SizedBox(height: 40) // Spacer to align
      ],
    );
  }
}
