import 'package:markethub/constants/global_variables.dart';
import 'package:markethub/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';

enum Auth {
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  bool _isSeller = false;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
      type: _isSeller ? 'seller' : 'user',
    );
  }

  void signInUser() {
    authService.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: Stack(
        children: [
          // Elegant Background Accents
          Positioned(
            top: -100,
            left: -50,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF6366F1).withValues(alpha: 0.05),
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   const SizedBox(height: 20),
                   // Brand Logo & Text
                   Center(
                     child: Column(
                       children: [
                         Container(
                           padding: const EdgeInsets.all(24),
                           decoration: BoxDecoration(
                             gradient: GlobalVariables.appBarGradient,
                             borderRadius: BorderRadius.circular(28),
                             boxShadow: [
                               BoxShadow(
                                 color: const Color(0xFF6366F1).withValues(alpha: 0.3),
                                 blurRadius: 30,
                                 offset: const Offset(0, 15),
                               ),
                             ],
                           ),
                           child: const Icon(
                             Icons.shopping_bag_rounded,
                             color: Colors.white,
                             size: 48,
                           ),
                         ),
                         const SizedBox(height: 24),
                         const Text(
                           'MarketHub',
                           style: TextStyle(
                             fontSize: 36,
                             fontWeight: FontWeight.bold,
                             color: Color(0xFF0F172A),
                             letterSpacing: -1.5,
                           ),
                         ),
                         const SizedBox(height: 8),
                         const Text(
                           'Your All-In-One Modern Marketplace',
                           style: TextStyle(
                             fontSize: 15,
                             color: Color(0xFF64748B),
                             fontWeight: FontWeight.w500,
                           ),
                         ),
                       ],
                     ),
                   ),

                   const SizedBox(height: 60),

                   // Auth Switcher
                   Container(
                     height: 64,
                     padding: const EdgeInsets.all(6),
                     decoration: BoxDecoration(
                       color: const Color(0xFFF1F5F9),
                       borderRadius: BorderRadius.circular(20),
                     ),
                     child: Row(
                       children: [
                         _AuthToggle(
                           title: 'Sign Up',
                           isActive: _auth == Auth.signup,
                           onTap: () => setState(() => _auth = Auth.signup),
                         ),
                         _AuthToggle(
                           title: 'Login',
                           isActive: _auth == Auth.signin,
                           onTap: () => setState(() => _auth = Auth.signin),
                         ),
                       ],
                     ),
                   ),

                   const SizedBox(height: 48),

                   // Input Section Header
                   Text(
                     _auth == Auth.signup ? 'Create New Account' : 'Welcome Back',
                     style: const TextStyle(
                       fontSize: 22,
                       fontWeight: FontWeight.bold,
                       color: Color(0xFF0F172A),
                       letterSpacing: -0.5,
                     ),
                   ),
                   const SizedBox(height: 8),
                   Text(
                     _auth == Auth.signup 
                        ? 'Fill in your details to start your journey.' 
                        : 'Sign in to access your personalized hub.',
                     style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 14),
                   ),

                   const SizedBox(height: 32),

                   // Forms
                   if (_auth == Auth.signup)
                      Form(
                        key: _signUpFormKey,
                        child: Column(
                          children: [
                            _CustomInput(controller: _nameController, hint: 'Full Name', icon: Icons.person_outline_rounded),
                            const SizedBox(height: 20),
                            _CustomInput(controller: _emailController, hint: 'Email Address', icon: Icons.alternate_email_rounded),
                            const SizedBox(height: 20),
                            _CustomInput(controller: _passwordController, hint: 'Secure Password', icon: Icons.lock_outline_rounded, isPass: true),
                            const SizedBox(height: 24),
                            // Seller Mode Toggle
                            _SellerToggle(
                              value: _isSeller, 
                              onChanged: (val) => setState(() => _isSeller = val),
                            ),
                            const SizedBox(height: 40),
                            _AuthButton(
                              text: 'Create Account', 
                              onTap: () {
                                if (_signUpFormKey.currentState!.validate()) signUpUser();
                              },
                            ),
                          ],
                        ),
                      )
                   else
                      Form(
                        key: _signInFormKey,
                        child: Column(
                          children: [
                            _CustomInput(controller: _emailController, hint: 'Email Address', icon: Icons.alternate_email_rounded),
                            const SizedBox(height: 20),
                            _CustomInput(controller: _passwordController, hint: 'Password', icon: Icons.lock_outline_rounded, isPass: true),
                            const SizedBox(height: 16),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {},
                                child: const Text('Forgot Password?', style: TextStyle(color: Color(0xFF6366F1), fontWeight: FontWeight.bold)),
                              ),
                            ),
                            const SizedBox(height: 24),
                            _AuthButton(
                              text: 'Login to MarketHub', 
                              onTap: () {
                                if (_signInFormKey.currentState!.validate()) signInUser();
                              },
                            ),
                          ],
                        ),
                      ),

                   const SizedBox(height: 40),
                   const Center(
                     child: Text(
                        'By continuing, you secure your data under MarketHub\'s\nTerms of Service and Privacy Policy.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8), height: 1.5),
                     ),
                   ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AuthToggle extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;
  const _AuthToggle({required this.title, required this.isActive, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: isActive ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            boxShadow: isActive ? [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ] : [],
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: isActive ? const Color(0xFF6366F1) : const Color(0xFF94A3B8),
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomInput extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final bool isPass;
  const _CustomInput({required this.controller, required this.hint, required this.icon, this.isPass = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        obscureText: isPass,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(icon, color: const Color(0xFF6366F1), size: 20),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          hintStyle: const TextStyle(color: Color(0xFF94A3B8), fontSize: 14),
        ),
        validator: (val) {
          if (val == null || val.isEmpty) return 'Please enter $hint';
          return null;
        },
      ),
    );
  }
}

class _SellerToggle extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  const _SellerToggle({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: value ? const Color(0xFF6366F1).withValues(alpha: 0.05) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: value ? const Color(0xFF6366F1) : const Color(0xFFE2E8F0)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: value ? const Color(0xFF6366F1) : const Color(0xFFF1F5F9),
                shape: BoxShape.circle,
              ),
              child: Icon(
                value ? Icons.check_rounded : Icons.storefront_rounded,
                color: value ? Colors.white : const Color(0xFF64748B),
                size: 20,
              ),
            ),
            const SizedBox(width: 16),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Apply for Seller Account', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF0F172A))),
                  Text('List and sell your own products.', style: TextStyle(fontSize: 12, color: Color(0xFF94A3B8))),
                ],
              ),
            ),
            Switch.adaptive(
              value: value, 
              onChanged: onChanged,
              activeTrackColor: const Color(0xFF6366F1),
            ),
          ],
        ),
      ),
    );
  }
}

class _AuthButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const _AuthButton({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6366F1).withValues(alpha: 0.25),
            blurRadius: 25,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF6366F1),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 22),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 0,
        ),
        child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, letterSpacing: -0.5)),
      ),
    );
  }
}
