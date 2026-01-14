import 'package:amazon_clone/features/account/screens/notifications_screen.dart';
import 'package:amazon_clone/features/account/screens/theme_selector_screen.dart';
import 'package:flutter/material.dart';

class GeneralSettingsScreen extends StatelessWidget {
  static const String routeName = '/settings';
  const GeneralSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildSection('Application', [
            _buildItem(Icons.notifications_outlined, 'Notifications', 'Manage alerts and sounds', () => Navigator.pushNamed(context, NotificationsScreen.routeName)),
            _buildItem(Icons.dark_mode_outlined, 'Appearance', 'Theme and display options', () => Navigator.pushNamed(context, CustomThemeSelector.routeName)),
            _buildItem(Icons.language_rounded, 'Language', 'Change your preferred language', () {}),
          ]),
          const SizedBox(height: 24),
          _buildSection('Account & Security', [
            _buildItem(Icons.lock_outline_rounded, 'Privacy Center', 'Manage your data and visibility', () {}),
            _buildItem(Icons.security_rounded, 'Login Settings', 'Passwords and 2FA', () {}),
            _buildItem(Icons.verified_user_outlined, 'Verification', 'Account identity check', () {}),
          ]),
          const SizedBox(height: 24),
          _buildSection('Support', [
            _buildItem(Icons.help_center_outlined, 'Support Center', 'Help and contact info', () {}),
            _buildItem(Icons.bug_report_outlined, 'Report a Bug', 'Let us know if something is wrong', () {}),
          ]),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, bottom: 12),
          child: Text(title, style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold, fontSize: 13, letterSpacing: 0.5)),
        ),
        Container(
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: const Color(0xFFE2E8F0))),
          child: Column(children: items),
        ),
      ],
    );
  }

  Widget _buildItem(IconData icon, String title, String subtitle, VoidCallback onTap) {
    return ListTile(
      leading: Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: const Color(0xFFF1F5F9), borderRadius: BorderRadius.circular(10)), child: Icon(icon, color: const Color(0xFF6366F1), size: 20)),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 11, color: Colors.grey)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
      onTap: onTap,
    );
  }
}
