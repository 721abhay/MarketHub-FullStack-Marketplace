import 'package:amazon_clone/common/widgets/bottom_bar.dart';
import 'package:amazon_clone/common/widgets/error_boundary.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:amazon_clone/providers/localization_provider.dart';
import 'package:amazon_clone/router/app_router.dart';
import 'package:amazon_clone/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => LocalizationProvider(),
    ),
  ], child: const ErrorBoundary(child: MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MarketHub',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings),
      home: const BottomBar(), // SKIP AUTH - GO DIRECTLY TO HOME
    );
  }
}
