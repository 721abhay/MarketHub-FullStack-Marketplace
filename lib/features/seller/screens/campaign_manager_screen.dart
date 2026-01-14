import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:amazon_clone/common/widgets/custom_textfield.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

class CampaignManagerScreen extends StatefulWidget {
  static const String routeName = '/campaign-manager';
  const CampaignManagerScreen({super.key});

  @override
  State<CampaignManagerScreen> createState() => _CampaignManagerScreenState();
}

class _CampaignManagerScreenState extends State<CampaignManagerScreen> {
  final TextEditingController _campaignNameController = TextEditingController();
  final TextEditingController _budgetController = TextEditingController();
  double _duration = 7;

  @override
  void dispose() {
    _campaignNameController.dispose();
    _budgetController.dispose();
    super.dispose();
  }

  void createCampaign() {
    // Mock Campaign Creation
     ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Campaign "Spring Sale" Created Successfully!')),
      );
      Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
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
          title: const Text(
            'Create Ad Campaign',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Campaign Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Campaign Name', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  CustomTextField(controller: _campaignNameController, hintText: 'e.g. Summer Sale 2026'),
                  
                  const SizedBox(height: 20),
                  
                  const Text('Daily Budget (\$)' , style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  CustomTextField(controller: _budgetController, hintText: 'e.g. 50.00'),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Duration (Days)', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('${_duration.round()} days', style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF6366F1))),
                    ],
                  ),
                  Slider(
                    value: _duration,
                    min: 1,
                    max: 30,
                    activeColor: const Color(0xFF6366F1),
                    onChanged: (val) {
                      setState(() {
                         _duration = val;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Target Audience',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
            ),
             const SizedBox(height: 16),
            Wrap(
              spacing: 10,
              runSpacing: 10, 
              children: [
                _buildTargetChip('Tech Enthusiasts'),
                _buildTargetChip('Fashion Lovers'),
                _buildTargetChip('Frequent Buyers'),
                _buildTargetChip('Local area (50km)'),
              ],
            ),
             const SizedBox(height: 48),
            CustomButton(text: 'Launch Campaign', onTap: createCampaign, color: GlobalVariables.secondaryColor),
          ],
        ),
      ),
    );
  }

  Widget _buildTargetChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.white,
      labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
      side: const BorderSide(color: Color(0xFFE2E8F0)),
    );
  }
}
