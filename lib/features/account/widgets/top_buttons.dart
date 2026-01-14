import 'package:amazon_clone/features/account/widgets/account_button.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopButtons extends StatelessWidget {
  const TopButtons({super.key});

  void logOut(BuildContext context) {
    Provider.of<UserProvider>(context, listen: false).signOut();
    Navigator.pushNamedAndRemoveUntil(
      context,
      AuthScreen.routeName,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(
              text: 'Your Orders',
              onTap: () {},
            ),
            AccountButton(
              text: 'Turn Seller',
              onTap: () {},
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            AccountButton(
              text: 'Log Out',
              onTap: () => logOut(context),
            ),
            AccountButton(
              text: 'Your Wish List',
              onTap: () {
                Navigator.pushNamed(context, '/wishlist');
              },
            ),
          ],
        ),
      ],
    );
  }
}
