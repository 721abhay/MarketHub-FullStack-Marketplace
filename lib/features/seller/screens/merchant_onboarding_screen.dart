import 'package:markethub/common/widgets/custom_button.dart';
import 'package:markethub/common/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class MerchantOnboardingScreen extends StatefulWidget {
  static const String routeName = '/merchant-onboarding';
  const MerchantOnboardingScreen({super.key});

  @override
  State<MerchantOnboardingScreen> createState() => _MerchantOnboardingScreenState();
}

class _MerchantOnboardingScreenState extends State<MerchantOnboardingScreen> {
  int _currentStep = 0;
  final PageController _pageController = PageController();
  
  final TextEditingController _storeNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _gstController = TextEditingController();
  final TextEditingController _panController = TextEditingController();

  @override
  void dispose() {
    _pageController.dispose();
    _storeNameController.dispose();
    _descriptionController.dispose();
    _gstController.dispose();
    _panController.dispose();
    super.dispose();
  }

  void _nextStep() {
    if (_currentStep < 2) {
      setState(() => _currentStep++);
      _pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    } else {
      // Final Submission
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Merchant Onboarding', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF0F172A),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          _buildProgressBar(),
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildStepOne(),
                _buildStepTwo(),
                _buildStepThree(),
              ],
            ),
          ),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildProgressBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Row(
        children: List.generate(3, (index) {
          bool isActive = index <= _currentStep;
          return Expanded(
            child: Container(
              height: 4,
              margin: EdgeInsets.only(right: index == 2 ? 0 : 8),
              decoration: BoxDecoration(
                color: isActive ? const Color(0xFF6366F1) : const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildStepOne() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Your store details', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
          const SizedBox(height: 8),
          const Text('Tell us about the business you are bringing to MarketHub.', style: TextStyle(color: Color(0xFF64748B), fontSize: 16)),
          const SizedBox(height: 40),
          _inputLabel('STORE NAME'),
          CustomTextField(controller: _storeNameController, hintText: 'e.g. Abhay\'s Tech Hub'),
          const SizedBox(height: 24),
          _inputLabel('STORE DESCRIPTION'),
          CustomTextField(controller: _descriptionController, hintText: 'What do you sell?', maxLines: 3),
          const SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: const Color(0xFFEEF2FF), borderRadius: BorderRadius.circular(20)),
            child: const Row(
              children: [
                Icon(Icons.info_outline_rounded, color: Color(0xFF6366F1)),
                SizedBox(width: 16),
                Expanded(
                  child: Text(
                    'Ensure your store name is unique and represents your brand well.',
                    style: TextStyle(color: Color(0xFF6366F1), fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepTwo() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Legal Information', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
          const SizedBox(height: 8),
          const Text('We need these details to verify your business identity.', style: TextStyle(color: Color(0xFF64748B), fontSize: 16)),
          const SizedBox(height: 40),
          _inputLabel('GSTIN NUMBER'),
          CustomTextField(controller: _gstController, hintText: '22AAAAA0000A1Z5'),
          const SizedBox(height: 24),
          _inputLabel('PAN NUMBER'),
          CustomTextField(controller: _panController, hintText: 'ABCDE1234F'),
          const SizedBox(height: 40),
          _buildUploadBox('Upload Cancelled Cheque'),
          const SizedBox(height: 16),
          _buildUploadBox('Business Registration Certificate'),
        ],
      ),
    );
  }

  Widget _buildStepThree() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 80),
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(color: const Color(0xFFF0FDF4), shape: BoxShape.circle),
            child: const Icon(Icons.rocket_launch_rounded, size: 80, color: Color(0xFF22C55E)),
          ),
          const SizedBox(height: 40),
          const Text('Almost Ready to Launch!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
          const SizedBox(height: 16),
          const Text(
            'By tapping "Launch My Store", you agree to the MarketHub Merchant Terms & Conditions.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xFF64748B), fontSize: 15, height: 1.5),
          ),
          const SizedBox(height: 40),
          _buildSummaryItem('Store Name', _storeNameController.text.isEmpty ? 'Abhay\'s Tech Hub' : _storeNameController.text),
          _buildSummaryItem('Category', 'Electronics & Gadgets'),
          _buildSummaryItem('Verification', 'Pending Documents'),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: const Color(0xFFF1F5F9))),
      ),
      child: Row(
        children: [
          if (_currentStep > 0)
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: IconButton(
                onPressed: () {
                  setState(() => _currentStep--);
                  _pageController.previousPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
                },
                icon: const Icon(Icons.arrow_back_rounded),
                style: IconButton.styleFrom(
                  backgroundColor: const Color(0xFFF1F5F9),
                  padding: const EdgeInsets.all(16),
                ),
              ),
            ),
          Expanded(
            child: CustomButton(
              text: _currentStep == 2 ? 'Launch My Store' : 'Continue',
              onTap: _nextStep,
            ),
          ),
        ],
      ),
    );
  }

  Widget _inputLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(label, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF94A3B8), letterSpacing: 1)),
    );
  }

  Widget _buildUploadBox(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0), style: BorderStyle.solid),
      ),
      child: Column(
        children: [
          const Icon(Icons.cloud_upload_outlined, color: Color(0xFF6366F1)),
          const SizedBox(height: 12),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF475569))),
          const Text('PDF, JPG or PNG (Max 5MB)', style: TextStyle(color: Color(0xFF94A3B8), fontSize: 11)),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Color(0xFF64748B))),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
        ],
      ),
    );
  }
}
