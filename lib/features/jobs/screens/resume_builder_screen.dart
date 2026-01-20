import 'package:markethub/common/widgets/custom_button.dart';
import 'package:markethub/common/widgets/custom_textfield.dart';
import 'package:markethub/constants/global_variables.dart';
import 'package:flutter/material.dart';

class ResumeBuilderScreen extends StatefulWidget {
  static const String routeName = '/resume-builder';
  const ResumeBuilderScreen({super.key});

  @override
  State<ResumeBuilderScreen> createState() => _ResumeBuilderScreenState();
}

class _ResumeBuilderScreenState extends State<ResumeBuilderScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final List<String> _skills = ['Flutter', 'Node.js', 'System Design', 'UI/UX'];

  @override
  void dispose() {
    _nameController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   _buildStepProgress(),
                   const SizedBox(height: 32),
                   const Text(
                    'Step 1: Identity & Bio',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Your digital identity on MarketHub Careers.',
                    style: TextStyle(color: Color(0xFF64748B), fontSize: 16),
                  ),
                  const SizedBox(height: 40),
                  _buildInputLabel('FULL NAME'),
                  CustomTextField(controller: _nameController, hintText: 'Abhay Singh'),
                  const SizedBox(height: 24),
                  _buildInputLabel('PROFESSIONAL BIO'),
                  CustomTextField(
                    controller: _bioController, 
                    hintText: 'Passionate developer building the future of e-commerce...',
                    maxLines: 4,
                  ),
                  const SizedBox(height: 32),
                  _buildInputLabel('CORE SKILLS'),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      ..._skills.map((skill) => Chip(
                        label: Text(skill),
                        backgroundColor: const Color(0xFFEEF2FF),
                        labelStyle: const TextStyle(color: Color(0xFF6366F1), fontWeight: FontWeight.bold, fontSize: 12),
                        deleteIcon: const Icon(Icons.close, size: 14, color: Color(0xFF6366F1)),
                        onDeleted: () {},
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        side: BorderSide.none,
                      )),
                      ActionChip(
                        label: const Icon(Icons.add, size: 16, color: Colors.white),
                        backgroundColor: const Color(0xFF6366F1),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 48),
                   _buildSectionHeader('Experience'),
                  _buildExperienceCard('Senior Flutter Developer', 'MarketHub Corp', '2022 - Present'),
                  const SizedBox(height: 16),
                  _buildExperienceCard('Full Stack Engineer', 'Freelance', '2020 - 2022'),
                  const SizedBox(height: 60),
                  CustomButton(
                    text: 'Generate AI Resume',
                    onTap: () {},
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 120,
      backgroundColor: const Color(0xFF0F172A),
      flexibleSpace: FlexibleSpaceBar(
        title: const Text('Digital Resume', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16)),
        background: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF1E293B), Color(0xFF0F172A)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  Widget _buildStepProgress() {
    return Row(
      children: [
        _stepCircle('1', true),
        _stepLine(true),
        _stepCircle('2', false),
        _stepLine(false),
        _stepCircle('3', false),
      ],
    );
  }

  Widget _stepCircle(String text, bool isActive) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF6366F1) : const Color(0xFFF1F5F9),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: isActive ? Colors.white : const Color(0xFF94A3B8),
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Widget _stepLine(bool isActive) {
    return Expanded(
      child: Container(
        height: 2,
        color: isActive ? const Color(0xFF6366F1) : const Color(0xFFF1F5F9),
      ),
    );
  }

  Widget _buildInputLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        label,
        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF94A3B8), letterSpacing: 1),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
          const Icon(Icons.add_circle_outline_rounded, color: Color(0xFF6366F1)),
        ],
      ),
    );
  }

  Widget _buildExperienceCard(String role, String company, String period) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: const Color(0xFFF1F5F9), borderRadius: BorderRadius.circular(12)),
            child: const Icon(Icons.work_outline_rounded, color: Color(0xFF64748B)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(role, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                Text('$company • $period', style: const TextStyle(color: Color(0xFF64748B), fontSize: 13)),
              ],
            ),
          ),
          const Icon(Icons.edit_note_rounded, color: Color(0xFFCBD5E1)),
        ],
      ),
    );
  }
}
