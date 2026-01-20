import 'dart:convert';
import 'package:markethub/common/widgets/custom_button.dart';
import 'package:markethub/common/widgets/custom_textfield.dart';
import 'package:markethub/constants/error_handling.dart';
import 'package:markethub/constants/global_variables.dart';
import 'package:markethub/constants/utils.dart';
import 'package:markethub/features/address/services/address_services.dart';
import 'package:markethub/features/cart/screens/order_success_screen.dart';
import 'package:markethub/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AddressScreen extends StatefulWidget {
  static const String routeName = '/address';
  final String totalAmount;
  const AddressScreen({
    super.key,
    required this.totalAmount,
  });

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}



class _AddressScreenState extends State<AddressScreen> {
  final TextEditingController flatBuildingController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController _promoController = TextEditingController();
  final _addressFormKey = GlobalKey<FormState>();
  
  String paymentMethod = 'card';
  double discountAmount = 0;
  String appliedPromo = '';
  bool _isCheckingPromo = false;

  final AddressServices addressServices = AddressServices();

  @override
  void dispose() {
    super.dispose();
    flatBuildingController.dispose();
    areaController.dispose();
    pincodeController.dispose();
    cityController.dispose();
    _promoController.dispose();
  }

  void validatePromo() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final code = _promoController.text.trim();
    if (code.isEmpty) return;

    setState(() => _isCheckingPromo = true);

    try {
      http.Response res = await http.post(
        Uri.parse('${GlobalVariables.uri}/api/promo/validate'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'code': code,
        }),
      );

      if (!mounted) return;
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          final promo = jsonDecode(res.body);
          final double subtotal = double.parse(widget.totalAmount);
          double discount = (subtotal * promo['discountPercent']) / 100;
          if (promo['maxDiscount'] != null && discount > promo['maxDiscount']) {
            discount = (promo['maxDiscount'] as num).toDouble();
          }
          setState(() {
            discountAmount = discount;
            appliedPromo = code;
          });
          showSnackBar(context, 'Promo code applied! Saved \$${discount.toStringAsFixed(2)}');
        },
      );
    } catch (e) {
      if (!mounted) return;
      showSnackBar(context, e.toString());
    } finally {
      if (mounted) setState(() => _isCheckingPromo = false);
    }
  }

  void onOrderPressed() {
    if (_addressFormKey.currentState!.validate()) {
      String addressToBeUsed = 
        '${flatBuildingController.text}, ${areaController.text}, ${cityController.text} - ${pincodeController.text}';
      
      double finalTotal = double.parse(widget.totalAmount) - discountAmount;

      addressServices.placeOrder(
        context: context, 
        address: addressToBeUsed, 
        totalSum: finalTotal,
      );

      Navigator.pushNamedAndRemoveUntil(context, OrderSuccessScreen.routeName, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    double subtotal = double.parse(widget.totalAmount);
    double finalTotal = subtotal - discountAmount;

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
          title: const Text(
            'Shipping Details',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Delivery Address',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
              ),
              const SizedBox(height: 16),
              Form(
                key: _addressFormKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: flatBuildingController, 
                      hintText: 'Flat, House no, Building', 
                      prefixIcon: Icons.home_rounded,
                    ),
                    const SizedBox(height: 12),
                    CustomTextField(
                      controller: areaController, 
                      hintText: 'Area, Street', 
                      prefixIcon: Icons.map_rounded,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(child: CustomTextField(
                          controller: pincodeController, 
                          hintText: 'Pincode', 
                          prefixIcon: Icons.pin_drop_rounded,
                          keyboardType: TextInputType.number,
                          validator: (val) => val != null && val.length == 6 ? null : 'Enter 6-digit pincode',
                        )),
                        const SizedBox(width: 12),
                        Expanded(child: CustomTextField(
                          controller: cityController, 
                          hintText: 'Town/City', 
                          prefixIcon: Icons.location_city_rounded,
                        )),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Apply Promo Code',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 10, offset: const Offset(0, 4))],
                      ),
                      child: CustomTextField(
                        controller: _promoController,
                        hintText: 'Enter code (e.g. WELCOME40)',
                        prefixIcon: Icons.local_offer_outlined,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  SizedBox(
                    height: 56,
                    child: ElevatedButton(
                      onPressed: _isCheckingPromo ? null : validatePromo,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1E293B),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      child: _isCheckingPromo 
                        ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                        : const Text('Apply'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const Text(
                'Payment Method',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
              ),
              const SizedBox(height: 16),
              _buildPaymentCard('card', 'Credit/Debit Card', Icons.credit_card_rounded),
              const SizedBox(height: 12),
              _buildPaymentCard('gpay', 'Google Pay / UPI', Icons.account_balance_wallet_rounded),
              const SizedBox(height: 12),
              _buildPaymentCard('cod', 'Cash on Delivery', Icons.payments_rounded),
              const SizedBox(height: 32),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 10, offset: const Offset(0, 4)),
                  ],
                ),
                child: Column(
                  children: [
                    _buildSummaryRow('Subtotal', '\$${subtotal.toStringAsFixed(2)}'),
                    if (discountAmount > 0) ...[
                      const SizedBox(height: 8),
                      _buildSummaryRow('Promo Discount ($appliedPromo)', '-\$${discountAmount.toStringAsFixed(2)}', isPromo: true),
                    ],
                    const SizedBox(height: 8),
                    _buildSummaryRow('Shipping Fee', 'FREE', isFree: true),
                    const Divider(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Total', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Text(
                          '\$${finalTotal.toStringAsFixed(2)}',
                          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF6366F1)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              CustomButton(text: 'Place Order', onTap: onOrderPressed),
              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildPaymentCard(String value, String title, IconData icon) {
    bool isSelected = paymentMethod == value;
    return GestureDetector(
      onTap: () => setState(() => paymentMethod = value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFEEF2FF) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? const Color(0xFF6366F1) : const Color(0xFFF1F5F9),
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: isSelected ? const Color(0xFF6366F1) : const Color(0xFF94A3B8)),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  color: isSelected ? const Color(0xFF1E293B) : const Color(0xFF64748B),
                ),
              ),
            ),
            if (isSelected)
              const Icon(Icons.check_circle_rounded, color: Color(0xFF6366F1), size: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isFree = false, bool isPromo = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Color(0xFF64748B))),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isFree ? const Color(0xFF10B981) : (isPromo ? const Color(0xFFEF4444) : const Color(0xFF1E293B)),
          ),
        ),
      ],
    );
  }
}
