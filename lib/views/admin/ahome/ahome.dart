import 'package:ecommerce_flutter/views/admin/product/aproduct.dart';
import 'package:ecommerce_flutter/views/authentication/authVM.dart';
import 'package:ecommerce_flutter/views/authentication/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class AhomeScreen extends StatelessWidget {
  static const String routeName = '/a-home-screen';
  const AhomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get an instance of AuthVM
    final authVM = Provider.of<AuthVM>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Admin Dashboard"),
          backgroundColor: Colors.blueGrey,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                ),
                child: Text(
                  'Admin Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.dashboard),
                title: const Text('Dashboard'),
                onTap: () {
                  // Navigate to Dashboard
                },
              ),
              ListTile(
                leading: const Icon(Icons.people),
                title: const Text('Manage Users'),
                onTap: () {
                  // Navigate to Manage Users
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Manage Products'),
                onTap: () {
                 Navigator.pushNamed(context, AProductScreen.routeName);
                },
              ),
              const Divider(), // Divider to separate logout option
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () async {
                  // Call the logout function
                  await authVM.logoutUser();
                  // Navigate back to Login Screen after logout
                  Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                },
              ),
            ],
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Text("Admin"),
          ),
        ),
    );
  }
}
