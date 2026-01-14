import 'package:markethub/constants/global_variables.dart';
import 'package:markethub/features/account/screens/account_screen.dart';
import 'package:markethub/features/cart/screens/cart_screen.dart';
import 'package:markethub/features/home/screens/home_screen.dart';
import 'package:markethub/features/hub/screens/main_hub_dashboard.dart';
import 'package:markethub/features/seller/screens/dashboard_screen.dart';
import 'package:markethub/features/seller/screens/products_screen.dart';
import 'package:markethub/features/seller/screens/seller_orders_screen.dart';
import 'package:markethub/features/admin/screens/admin_dashboard_screen.dart';
import 'package:markethub/features/admin/screens/admin_sellers_screen.dart';
import 'package:markethub/features/admin/screens/admin_products_screen.dart';
import 'package:markethub/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;

  List<Widget> buyerPages = [
    const HomeScreen(),
    const MainHubDashboard(),
    const AccountScreen(),
    const CartScreen(),
  ];

  List<Widget> sellerPages = [
    const SellerDashboardScreen(),
    const SellerProductsScreen(),
    const SellerOrdersScreen(),
  ];

  List<Widget> adminPages = [
    const AdminDashboardScreen(),
    const AdminSellersScreen(),
    const AdminProductsScreen(),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    final userCartLen = user.cart.length;
    
    List<Widget> pages;
    if (user.type == 'admin') {
      pages = adminPages;
    } else if (user.type == 'seller') {
      pages = sellerPages;
    } else {
      pages = buyerPages;
    }

    return Scaffold(
      extendBody: true, // Key for floating effect
      body: pages[_page],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF6366F1).withValues(alpha: 0.15),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            currentIndex: _page,
            selectedItemColor: GlobalVariables.selectedNavBarColor,
            unselectedItemColor: GlobalVariables.unselectedNavBarColor,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 11),
            iconSize: 22,
            elevation: 0,
            onTap: updatePage,
            items: user.type == 'admin' 
                ? _buildAdminItems() 
                : (user.type == 'seller' ? _buildSellerItems() : _buildBuyerItems(userCartLen)),
          ),
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> _buildBuyerItems(int cartLen) {
    return [
      _navItem(Icons.home_filled, Icons.home_outlined, 'Home'),
      _navItem(Icons.hub_rounded, Icons.hub_outlined, 'Hub'),
      _navItem(Icons.person_rounded, Icons.person_outline_rounded, 'Account'),
      BottomNavigationBarItem(
        icon: Badge(
          label: Text(cartLen.toString()),
          backgroundColor: const Color(0xFF6366F1),
          child: const Icon(Icons.shopping_basket_outlined),
        ),
        activeIcon: Badge(
           label: Text(cartLen.toString()),
           backgroundColor: const Color(0xFF6366F1),
           child: const Icon(Icons.shopping_basket_rounded),
        ),
        label: 'Cart',
      ),
    ];
  }

  List<BottomNavigationBarItem> _buildSellerItems() {
    return [
      _navItem(Icons.dashboard_rounded, Icons.dashboard_outlined, 'Dashboard'),
      _navItem(Icons.inventory_2_rounded, Icons.inventory_2_outlined, 'Products'),
      _navItem(Icons.assignment_rounded, Icons.assignment_outlined, 'Orders'),
    ];
  }

  List<BottomNavigationBarItem> _buildAdminItems() {
    return [
      _navItem(Icons.analytics_rounded, Icons.analytics_outlined, 'Insights'),
      _navItem(Icons.admin_panel_settings_rounded, Icons.admin_panel_settings_outlined, 'Sellers'),
      _navItem(Icons.gavel_rounded, Icons.gavel_outlined, 'Moderate'),
    ];
  }

  BottomNavigationBarItem _navItem(IconData active, IconData inactive, String label) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: Icon(inactive),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: Icon(active),
      ),
      label: label,
    );
  }
}
