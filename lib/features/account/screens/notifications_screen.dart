import 'package:amazon_clone/common/widgets/loader.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/account/services/account_services.dart';
import 'package:amazon_clone/models/notification.dart' as model;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationsScreen extends StatefulWidget {
  static const String routeName = '/notifications';
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<model.Notification>? notifications;
  final AccountServices accountServices = AccountServices();

  @override
  void initState() {
    super.initState();
    fetchNotifications();
  }

  void fetchNotifications() async {
    notifications = await accountServices.fetchNotifications(context: context);
    setState(() {});
  }

  void markAsRead(String id) {
    accountServices.markAsRead(context: context, id: id);
    fetchNotifications(); // Refresh
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
          elevation: 0,
          title: const Text(
            'Notifications',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: notifications == null
          ? const Loader()
          : notifications!.isEmpty
              ? _buildEmptyState()
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: notifications!.length,
                  itemBuilder: (context, index) {
                    final notification = notifications![index];
                    return _buildNotificationCard(notification);
                  },
                ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.notifications_off_rounded, size: 80, color: Colors.grey.shade300),
          const SizedBox(height: 20),
          const Text(
            'No Notifications',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF64748B)),
          ),
          const SizedBox(height: 8),
          const Text(
            "You're all caught up! Check back later for updates.",
            style: TextStyle(fontSize: 14, color: Color(0xFF94A3B8)),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationCard(model.Notification notification) {
    final date = DateFormat('MMM dd, hh:mm a').format(DateTime.fromMillisecondsSinceEpoch(notification.createdAt));
    
    return GestureDetector(
      onTap: () => markAsRead(notification.id),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: notification.isRead ? 0.6 : 1.0,
        child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: notification.isRead ? const Color(0xFFE2E8F0) : const Color(0xFF6366F1).withOpacity(0.3),
              width: notification.isRead ? 1 : 2,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: _getIconColor(notification.type).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(_getIcon(notification.type), color: _getIconColor(notification.type), size: 20),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          notification.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: notification.isRead ? const Color(0xFF64748B) : const Color(0xFF1E293B),
                          ),
                        ),
                        if (!notification.isRead)
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(color: Color(0xFF6366F1), shape: BoxShape.circle),
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      notification.body,
                      style: TextStyle(color: const Color(0xFF64748B), fontSize: 13, height: 1.4),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      date,
                      style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 11),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getIcon(String type) {
    switch (type) {
      case 'order': return Icons.shopping_bag_rounded;
      case 'promo': return Icons.local_offer_rounded;
      default: return Icons.notifications_rounded;
    }
  }

  Color _getIconColor(String type) {
    switch (type) {
      case 'order': return const Color(0xFF6366F1);
      case 'promo': return const Color(0xFFF59E0B);
      default: return const Color(0xFF64748B);
    }
  }
}
