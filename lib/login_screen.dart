import 'package:flutter/material.dart';
import 'package:flutter_testing/validator.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _key,
          child: Column(children: [
            TextFormField(
              validator: (value) => Validator.validateEmail(value ?? ""),
              controller: _emailController,
              key: const ValueKey("email_id"),
              decoration: const InputDecoration(hintText: "Enter Email Id"),
            ),
            TextFormField(
              validator: (value) => Validator.validatePassword(value ?? ""),
              controller: _passwordController,
              key: const ValueKey("password"),
              decoration: const InputDecoration(hintText: "Enter password"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  if (_key.currentState?.validate() == true) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  }
                },
                child: const Text('Submit'))
          ]),
        ),
      ),
    );
  }
}
