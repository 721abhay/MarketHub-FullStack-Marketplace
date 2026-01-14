import 'package:amazon_clone/common/widgets/loader.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/admin/services/admin_services.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:flutter/material.dart';

class AdminSellersScreen extends StatefulWidget {
  const AdminSellersScreen({super.key});

  @override
  State<AdminSellersScreen> createState() => _AdminSellersScreenState();
}

class _AdminSellersScreenState extends State<AdminSellersScreen> {
  List<User>? users;
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    users = await adminServices.fetchAllUsers(context);
    setState(() {});
  }

  void verifySeller(String userId, bool isVerified) {
    adminServices.verifySeller(
      context: context,
      userId: userId,
      isVerified: isVerified,
      onSuccess: () {
        fetchUsers();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (users == null) return const Loader();

    final sellers = users!.where((u) => u.type == 'seller').toList();

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
            'Seller Moderation',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: sellers.isEmpty
          ? const Center(child: Text('No sellers found.'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: sellers.length,
              itemBuilder: (context, index) {
                final seller = sellers[index];
                final isVerified = seller.sellerDetails?.isVerified ?? false;

                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.02),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: const Color(0xFFEEF2FF),
                        child: Text(
                          seller.name[0].toUpperCase(),
                          style: const TextStyle(
                            color: Color(0xFF6366F1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              seller.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              seller.email,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFF64748B),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: isVerified ? const Color(0xFFD1FAE5) : const Color(0xFFFEF3C7),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                isVerified ? 'Verified' : 'Pending',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: isVerified ? const Color(0xFF065F46) : const Color(0xFF92400E),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Switch(
                        activeThumbColor: const Color(0xFF10B981),
                        value: isVerified,
                        onChanged: (val) => verifySeller(seller.id, val),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
