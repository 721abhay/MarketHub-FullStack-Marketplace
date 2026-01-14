import 'package:markethub/features/account/screens/wallet_screen.dart';
import 'package:markethub/features/finance/screens/finance_home_screen.dart';
import 'package:markethub/features/finance/screens/stock_tracker_screen.dart';
import 'package:markethub/features/finance/screens/crypto_vault_screen.dart';
import 'package:markethub/features/finance/screens/insurance_screen.dart';
import 'package:markethub/features/finance/screens/file_claim_screen.dart';
import 'package:flutter/material.dart';

class FinanceRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case FinanceHomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => const FinanceHomeScreen());
      case WalletScreen.routeName:
        return MaterialPageRoute(builder: (_) => const WalletScreen());
      case StockTrackerScreen.routeName:
        return MaterialPageRoute(builder: (_) => const StockTrackerScreen());
      case CryptoVaultScreen.routeName:
        return MaterialPageRoute(builder: (_) => const CryptoVaultScreen());
      case InsuranceCenterScreen.routeName:
        return MaterialPageRoute(builder: (_) => const InsuranceCenterScreen());
      case FileClaimScreen.routeName:
        return MaterialPageRoute(builder: (_) => const FileClaimScreen());
      default:
        return null;
    }
  }
}
