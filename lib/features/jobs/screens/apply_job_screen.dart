import 'package:amazon_clone/common/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ApplyJobScreen extends StatefulWidget {
  static const String routeName = '/apply-job';
  final Map<String, dynamic> job;
  const ApplyJobScreen({super.key, required this.job});

  @override
  State<ApplyJobScreen> createState() => _ApplyJobScreenState();
}

class _ApplyJobScreenState extends State<ApplyJobScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isUploading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Complete Application', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Applying for ${widget.job['title']}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0D9488))),
              const SizedBox(height: 8),
              Text(widget.job['company'], style: const TextStyle(color: Colors.grey)),
              const SizedBox(height: 32),
              _buildField('Full Name', 'e.g. Abhay Pratap'),
              const SizedBox(height: 20),
              _buildField('Email Address', 'e.g. abhay@example.com'),
              const SizedBox(height: 20),
              _buildField('Portfolio/LinkedIn URL', 'https://...'),
              const SizedBox(height: 32),
              const Text('Resume', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () {
                  setState(() => _isUploading = true);
                  Future.delayed(const Duration(seconds: 2), () => setState(() => _isUploading = false));
                },
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(color: const Color(0xFFF1F5F9), borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xFFE2E8F0), style: BorderStyle.solid)),
                  child: Center(
                    child: _isUploading 
                      ? const CircularProgressIndicator(color: Color(0xFF0D9488))
                      : const Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.upload_file_rounded, color: Color(0xFF0D9488)), Text('Upload PDF/Doc', style: TextStyle(color: Colors.grey, fontSize: 12))]),
                  ),
                ),
              ),
              const SizedBox(height: 48),
              CustomButton(
                text: 'Submit Application',
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                        title: const Text('Submitted!'),
                        content: const Text('Your application has been successfully sent to the hiring team.'),
                        actions: [TextButton(onPressed: () { Navigator.pop(context); Navigator.pop(context); Navigator.pop(context); }, child: const Text('Great!'))],
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
        const SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
            filled: true,
            fillColor: const Color(0xFFF8FAFC),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
          ),
        ),
      ],
    );
  }
}
