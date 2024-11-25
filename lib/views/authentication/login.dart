import 'package:ecommerce_flutter/views/authentication/authVM.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login-screen';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<AuthVM>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Login",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.5),
                  ),
                  prefixIcon: const Icon(Icons.person),
                ),
                onChanged: (value) =>
                    vm.user = vm.user.copyWith(username: value),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.5),
                  ),
                  prefixIcon: const Icon(Icons.lock),
                ),
                obscureText: true,
                onChanged: (value) =>
                    vm.user = vm.user.copyWith(password: value),
              ),
              const SizedBox(height: 30),
             ElevatedButton(
              onPressed: () async {
             

                // Call the login function from AuthVM
                await vm.login((success) {},context,);
              },
              child: const Text('Login'),
            ),

            ],
          ),
        ),
      ),
    );
  }
}
