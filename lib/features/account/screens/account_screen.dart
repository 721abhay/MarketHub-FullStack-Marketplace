import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/account/screens/your_orders_screen.dart';
import 'package:amazon_clone/features/account/screens/addresses_screen.dart';
import 'package:amazon_clone/features/account/screens/notifications_screen.dart';
import 'package:amazon_clone/features/account/screens/wallet_screen.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:amazon_clone/providers/localization_provider.dart';
import 'package:amazon_clone/localization/language_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  void logOut(BuildContext context) {
    Provider.of<UserProvider>(context, listen: false).signOut();
    Navigator.pushNamedAndRemoveUntil(
      context,
      AuthScreen.routeName,
      (route) => false,
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(32))),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Select Language', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 24),
              ...Language.languageList().map((lang) => ListTile(
                    leading: Text(lang.flag, style: const TextStyle(fontSize: 24)),
                    title: Text(lang.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                    onTap: () {
                      Provider.of<LocalizationProvider>(context, listen: false).setLocale(Locale(lang.languageCode));
                      Navigator.pop(context);
                    },
                  )),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: const Text(
            'My Profile',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.settings_outlined, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(user),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Quick Actions',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _buildActionCard(
                          'Your Orders',
                          Icons.local_shipping_outlined,
                          const Color(0xFF6366F1),
                          () => Navigator.pushNamed(context, YourOrdersScreen.routeName),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildActionCard(
                          'Notifications',
                          Icons.notifications_active_outlined,
                          const Color(0xFFF59E0B),
                          () => Navigator.pushNamed(context, NotificationsScreen.routeName),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),

                  const Text(
                    'Account Settings',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                  ),
                  const SizedBox(height: 12),
                  _buildSettingsSection([
                    _SettingsItem(Icons.location_on_outlined, 'Edit Address', 'Manage shipping locations', onTap: () => Navigator.pushNamed(context, AddressesScreen.routeName)),
                    _SettingsItem(Icons.account_balance_wallet_outlined, 'MarketHub Wallet', 'Balance, History, and Top Up', onTap: () => Navigator.pushNamed(context, WalletScreen.routeName)),
                    _SettingsItem(Icons.person_outline, 'Personal Information', 'Name, Email, Phone'),
                    _SettingsItem(Icons.language_rounded, 'App Language', 'English, Spanish, Hindi', onTap: () => _showLanguageDialog(context)),
                    _SettingsItem(Icons.security_outlined, 'Security', 'Password, 2-Step Verification'),
                    _SettingsItem(Icons.payment_outlined, 'Payment Methods', 'Manage cards and wallets'),
                  ]),

                   const SizedBox(height: 32),
                  
                  const Text(
                    'Support & Info',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                  ),
                  const SizedBox(height: 12),
                   _buildSettingsSection([
                    _SettingsItem(Icons.help_outline_rounded, 'Help Center', 'FAQs and Support help'),
                    _SettingsItem(Icons.policy_outlined, 'Privacy Policy', 'Our data practices'),
                  ]),

                  const SizedBox(height: 48),
                  
                  // SIGN OUT
                  SizedBox(
                    width: double.infinity,
                    child: TextButton.icon(
                      onPressed: () => logOut(context),
                      icon: const Icon(Icons.logout_rounded, color: Colors.redAccent),
                      label: const Text(
                        'Sign Out',
                        style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Colors.redAccent.withOpacity(0.05),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(dynamic user) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: GlobalVariables.appBarGradient,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            child: CircleAvatar(
              radius: 40,
              backgroundColor: const Color(0xFFEEF2FF),
              child: Text(
                user.name.isEmpty ? '?' : user.name[0].toUpperCase(),
                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF6366F1)),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  user.email,
                  style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 14),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.stars_rounded, color: Colors.amber, size: 16),
                      SizedBox(width: 4),
                      Text('MarketHub Gold Member', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionCard(String title, IconData icon, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(color: color.withOpacity(0.1), blurRadius: 20, offset: const Offset(0, 8)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(14)),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(height: 16),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF1E293B))),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsSection(List<_SettingsItem> items) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        separatorBuilder: (context, index) => const Divider(height: 1, indent: 60),
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: const Color(0xFFF1F5F9), borderRadius: BorderRadius.circular(10)),
              child: Icon(item.icon, color: const Color(0xFF64748B), size: 20),
            ),
            title: Text(item.title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
            subtitle: Text(item.subtitle, style: const TextStyle(fontSize: 12, color: Color(0xFF94A3B8))),
            trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: Color(0xFFCBD5E1)),
            onTap: item.onTap,
          );
        },
      ),
    );
  }
}

class _SettingsItem {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  const _SettingsItem(this.icon, this.title, this.subtitle, {this.onTap});
}
