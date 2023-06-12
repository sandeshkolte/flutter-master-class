import 'package:catalog_app/pages/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(children: [
        Image.asset("assets/Boy.jpg"),
        const SizedBox(
          height: 25,
        ),
        const Text(
          "Welcome",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Enter username",
                labelText: "Username",
              ),
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Enter password",
                labelText: "Password",
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
                onPressed: () {
                  HomePage();
                },
                child: Text("Login"))
          ]),
        ),
      ]),
    );
  }
}
