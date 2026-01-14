import 'package:markethub/constants/global_variables.dart';
import 'package:markethub/constants/utils.dart';
import 'package:markethub/features/seller/services/seller_services.dart';
import 'package:markethub/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SellerPayoutScreen extends StatefulWidget {
  static const String routeName = '/seller-payout';
  const SellerPayoutScreen({super.key});

  @override
  State<SellerPayoutScreen> createState() => _SellerPayoutScreenState();
}

class _SellerPayoutScreenState extends State<SellerPayoutScreen> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _ifscController = TextEditingController();
  final TextEditingController _bankNameController = TextEditingController();
  
  final SellerServices _sellerServices = SellerServices();
  List<dynamic>? _payouts;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchPayoutHistory();
  }

  void _fetchPayoutHistory() async {
    _payouts = await _sellerServices.fetchPayouts(context: context);
    if (mounted) setState(() {});
  }

  void _requestPayout() {
    final amount = double.tryParse(_amountController.text) ?? 0;
    if (amount <= 0) return;

    setState(() => _isLoading = true);
    
    _sellerServices.requestPayout(
      context: context,
      amount: amount,
      bankDetails: {
        'accountNumber': _accountController.text,
        'ifscCode': _ifscController.text,
        'bankName': _bankNameController.text,
      },
      onSuccess: () {
        showSnackBar(context, 'Payout request submitted!');
        _amountController.clear();
        _fetchPayoutHistory();
      },
    );
    setState(() => _isLoading = false);
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
          title: const Text('Vendor Payouts', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBalanceCard(user.wallet),
            const SizedBox(height: 32),
            const Text('Request New Payout', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
            const SizedBox(height: 16),
            _buildPayoutForm(),
            const SizedBox(height: 48),
            const Text('Payout History', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
            const SizedBox(height: 16),
            _buildPayoutHistory(),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceCard(double balance) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 20, offset: const Offset(0, 10)),
        ],
      ),
      child: Column(
        children: [
          const Text('Withdrawable Balance', style: TextStyle(color: Color(0xFF64748B), fontSize: 14, fontWeight: FontWeight.w500)),
          const SizedBox(height: 12),
          Text('\$${balance.toStringAsFixed(2)}', style: const TextStyle(color: Color(0xFF1E293B), fontSize: 48, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('Funds from delivered orders are available here.', style: TextStyle(color: Color(0xFF94A3B8), fontSize: 11)),
        ],
      ),
    );
  }

  Widget _buildPayoutForm() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        children: [
          _buildTextField(_amountController, 'Amount to Withdraw', Icons.payments_outlined, TextInputType.number),
          const SizedBox(height: 16),
          _buildTextField(_accountController, 'Account Number', Icons.account_balance_rounded),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildTextField(_ifscController, 'IFSC Code', Icons.code_rounded)),
              const SizedBox(width: 12),
              Expanded(child: _buildTextField(_bankNameController, 'Bank Name', Icons.business_rounded)),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 54,
            child: ElevatedButton(
              onPressed: _isLoading ? null : _requestPayout,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6366F1),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 0,
              ),
              child: _isLoading 
                ? const CircularProgressIndicator(color: Colors.white)
                : const Text('Submit Payout Request', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint, IconData icon, [TextInputType? type]) {
    return TextField(
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: const Color(0xFF6366F1), size: 20),
        hintText: hint,
        filled: true,
        fillColor: const Color(0xFFF8FAFC),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }

  Widget _buildPayoutHistory() {
    if (_payouts == null) return const Center(child: CircularProgressIndicator());
    if (_payouts!.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(40),
        child: const Center(child: Text('No payout history found.', style: TextStyle(color: Color(0xFF94A3B8)))),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _payouts!.length,
      itemBuilder: (context, index) {
        final payout = _payouts![index];
        final date = DateFormat('MMM dd, yyyy').format(DateTime.fromMillisecondsSinceEpoch(payout['requestedAt']));
        
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('\$${payout['amount']}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 4),
                  Text(date, style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 12)),
                ],
              ),
              _buildStatusBadge(payout['status']),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStatusBadge(String status) {
    Color color;
    switch (status) {
      case 'approved': color = const Color(0xFF10B981); break;
      case 'rejected': color = const Color(0xFFEF4444); break;
      default: color = const Color(0xFFF59E0B);
    }
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(color: color.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12)),
      child: Text(
        status.toUpperCase(),
        style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.bold),
      ),
    );
  }
}
