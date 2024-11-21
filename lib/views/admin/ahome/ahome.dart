import 'package:flutter/material.dart';

class AhomeScreen extends StatelessWidget {
    static const String routeName = '/a-home-screen';
  const AhomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                child:  Text(
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
                  // Navigate to Settings
                },
              ),
            ],
          ),
        ),
        body: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Text("Admin"),
            )));
  }
}
