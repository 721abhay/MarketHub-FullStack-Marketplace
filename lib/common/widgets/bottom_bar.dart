import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/account/screens/account_screen.dart';
import 'package:amazon_clone/features/cart/screens/cart_screen.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:amazon_clone/features/hub/screens/main_hub_dashboard.dart';
import 'package:amazon_clone/features/seller/screens/dashboard_screen.dart';
import 'package:amazon_clone/features/seller/screens/products_screen.dart';
import 'package:amazon_clone/features/seller/screens/seller_orders_screen.dart';
import 'package:amazon_clone/features/admin/screens/admin_dashboard_screen.dart';
import 'package:amazon_clone/features/admin/screens/admin_sellers_screen.dart';
import 'package:amazon_clone/features/admin/screens/admin_products_screen.dart';
import 'package:amazon_clone/providers/user_provider.dart';
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
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

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

    // BUYER ITEMS
    List<BottomNavigationBarItem> buyerItems = [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home_max_rounded),
        label: 'Home',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.hub_rounded),
        label: 'Hub',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.person_pin_rounded),
        label: 'Account',
      ),
      BottomNavigationBarItem(
        icon: Badge(
          label: Text(userCartLen.toString()),
          backgroundColor: GlobalVariables.secondaryColor,
          child: const Icon(Icons.shopping_bag_rounded),
        ),
        label: 'Cart',
      ),
    ];

    // SELLER ITEMS
    List<BottomNavigationBarItem> sellerItems = [
      const BottomNavigationBarItem(
        icon: Icon(Icons.dashboard_rounded),
        label: 'Dashboard',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.inventory_2_rounded),
        label: 'Products',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.assignment_rounded),
        label: 'Orders',
      ),
    ];

    // ADMIN ITEMS
    List<BottomNavigationBarItem> adminItems = [
      const BottomNavigationBarItem(
        icon: Icon(Icons.analytics_rounded),
        label: 'Insights',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.admin_panel_settings_rounded),
        label: 'Sellers',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.gavel_rounded),
        label: 'Moderate',
      ),
    ];

    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _page,
          selectedItemColor: GlobalVariables.selectedNavBarColor,
          unselectedItemColor: GlobalVariables.unselectedNavBarColor,
          backgroundColor: GlobalVariables.backgroundColor,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          unselectedLabelStyle: const TextStyle(fontSize: 12),
          iconSize: 24,
          onTap: updatePage,
          items: user.type == 'admin' 
              ? adminItems 
              : (user.type == 'seller' ? sellerItems : buyerItems),
        ),
      ),
    );
  }
}
