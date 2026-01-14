import 'dart:convert';
import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class WalletScreen extends StatefulWidget {
  static const String routeName = '/wallet';
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final TextEditingController _amountController = TextEditingController();
  bool _isLoading = false;

  void topUpWallet() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final amount = double.tryParse(_amountController.text) ?? 0;
    if (amount <= 0) return;

    setState(() => _isLoading = true);

    try {
      http.Response res = await http.post(
        Uri.parse('${GlobalVariables.uri}/api/top-up-wallet'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'amount': amount,
        }),
      );

      if (!mounted) return;
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          userProvider.setUser(res.body);
          showSnackBar(context, 'Wallet topped up successfully!');
          Navigator.pop(context);
        },
      );
    } catch (e) {
      if (!mounted) return;
      showSnackBar(context, e.toString());
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;

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
          elevation: 0,
          title: const Text('MarketHub Wallet', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _buildWalletCard(user.wallet),
            const SizedBox(height: 32),
            _buildActionSection(),
            const SizedBox(height: 48),
            _buildRecentActivity(),
          ],
        ),
      ),
    );
  }

  Widget _buildWalletCard(double balance) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF6366F1), Color(0xFF4F46E5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6366F1).withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Total Balance', style: TextStyle(color: Colors.white70, fontSize: 16)),
          const SizedBox(height: 8),
          Text('\$${balance.toStringAsFixed(2)}', style: const TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('STATUS', style: TextStyle(color: Colors.white60, fontSize: 10, fontWeight: FontWeight.bold)),
                  Text('Active', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
              Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/d/d6/Visa_2021.svg/1200px-Visa_2021.svg.png', height: 20, color: Colors.white),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Quick Top Up', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          child: TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              icon: Icon(Icons.add_card_rounded, color: Color(0xFF6366F1)),
              hintText: 'Enter amount to add',
              border: InputBorder.none,
              hintStyle: TextStyle(color: Color(0xFF94A3B8)),
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          height: 60,
          child: ElevatedButton(
            onPressed: _isLoading ? null : topUpWallet,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF6366F1),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              elevation: 0,
            ),
            child: _isLoading 
              ? const CircularProgressIndicator(color: Colors.white)
              : const Text('Add Funds to Wallet', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }

  Widget _buildRecentActivity() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Recent Activity', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          child: Column(
            children: [
              _buildTransactionItem('Wallet Top Up', 'Jan 12, 2024', '+\$500.00', true),
              const Divider(height: 32),
              _buildTransactionItem('Order #MH8321', 'Jan 10, 2024', '-\$124.50', false),
              const Divider(height: 32),
              _buildTransactionItem('Promo Cashback', 'Jan 05, 2024', '+\$5.00', true),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTransactionItem(String title, String date, String amount, bool isCredit) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
            Text(date, style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 12)),
          ],
        ),
        Text(
          amount,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isCredit ? const Color(0xFF10B981) : const Color(0xFFEF4444),
          ),
        ),
      ],
    );
  }
}
