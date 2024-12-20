import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/screens/register_screen.dart';
import 'package:untitled1/services/network_service.dart';
import 'package:untitled1/ui/components.dart';
import '../models/user.dart';
import '../providers/user_provider.dart';
import '../ui/constants.dart';
import 'dashboard_screen.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, value, child) {
        value.load();
        return value.user == null ? LoginScreen() : HomeScreen();
      },
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    NetworkService networkService = NetworkService();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.purple.shade100,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 28),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(vertical: 50),
                    //   child: Image(
                    //     image: AssetImage(""),
                    //     width: 200,
                    //     height: 200,
                    //     fit: BoxFit.contain,
                    //   ),
                    // ),
                    customTextField(
                      label: 'Email',
                      icon: Icon(
                        Icons.email,
                        color: themeColor,
                      ),
                      controller: emailController,
                      validate: (input) => emailValidate(input),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    customTextField(
                        label: 'Password',
                        validate: (text) => passwordValidate(text),
                        icon: Icon(
                          Icons.lock,
                          color: themeColor,
                        ),
                        controller: passwordController,
                        obscureText: true),
                    SizedBox(
                      height: 20,
                    ),
                    customButton(
                      buttonLabel: 'Login',
                      onPressed: () {
                        print(passwordController.text.length);
                        if (formKey.currentState!.validate()) {
                          if (emailController.text.isNotEmpty &&
                              passwordController.text.isNotEmpty) {
                            final user = NetworkService.getLoginData(
                                "eve.holt@reqres.in", "cityslicka");
                            print(user);

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Login successful")),
                            );
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ));
                          }
                        }
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      height: 5,
                      color: black,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Click Here',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegisterScreen(),
                                  ),
                                );
                              },
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                        text: 'New User? ',
                        style: TextStyle(color: Colors.black, fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
