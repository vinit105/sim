import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/providers/user_provider.dart';
import 'package:untitled1/ui/components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (ctx, value, child) {
        return SafeArea(
          child: Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.3,
                ),
                Center(
                  child: Text(
                    "Welcome",
                    style: TextStyle(fontSize: 32),
                  ),
                ),
                Card(
                  child: Text(
                    "Email: ${value.user!.email}",
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                Card(
                  child: Text(
                    "Password: ${value.user!.password}",
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                Card(
                  child: Text(
                    "Token: ${value.user!.token!}",
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                customButton(
                  buttonLabel: 'LogOut',
                  onPressed: () {
                    value.remove();
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
