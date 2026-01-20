import 'package:markethub/features/auth/screens/splash_screen.dart';
import 'package:markethub/common/widgets/error_boundary.dart';
import 'package:markethub/features/auth/services/auth_service.dart';
import 'package:markethub/providers/user_provider.dart';
import 'package:markethub/providers/localization_provider.dart';
import 'package:markethub/router/app_router.dart';
import 'package:markethub/theme/app_theme.dart';
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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MarketHub',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings),
      home: const SplashScreen(),
      /* home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? const BottomBar()
          : const AuthScreen(), */
    );
  }
}
