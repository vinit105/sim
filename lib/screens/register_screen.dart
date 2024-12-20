import 'package:flutter/material.dart';

import '../ui/components.dart';
import '../ui/constants.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple.shade100,
        ),
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
                        "Register",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 28),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50),
                      child: Image(
                        image: AssetImage(""),
                        width: 200,
                        height: 200,
                        fit: BoxFit.contain,
                      ),
                    ),
                    customTextField(
                        label: 'Email',
                        icon: Icon(
                          Icons.email,
                          color: themeColor,
                        ),
                        validate: (input) => emailValidate(input),
                        controller: emailController),
                    SizedBox(
                      height: 20,
                    ),
                    customTextField(
                        label: 'Password',
                        icon: Icon(
                          Icons.lock,
                          color: themeColor,
                        ),
                        controller: passwordController,
                        validate: (text) => passwordValidate(text),
                        obscureText: true),
                    SizedBox(
                      height: 20,
                    ),
                    customTextField(
                        label: 'Confirm Password',
                        icon: Icon(
                          Icons.lock,
                          color: themeColor,
                        ),
                        controller: confirmPasswordController,
                        validate: (text) => confirmValidate(
                            text,
                            emailController.text,
                            confirmPasswordController.text),
                        obscureText: true),
                    SizedBox(
                      height: 20,
                    ),
                    customButton(
                      buttonLabel: 'Login',
                      onPressed: () {
                        print(passwordController.text);
                        print(confirmPasswordController.text);
                        if (formKey.currentState!.validate()) {
                          if (emailController.text.isNotEmpty &&
                              passwordController.text.isNotEmpty &&
                              confirmPasswordController.text.isNotEmpty) {
                            print("object");
                          }
                        }
                      },
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
