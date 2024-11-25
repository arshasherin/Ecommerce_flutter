import 'package:ecommerce_flutter/views/authentication/authVM.dart';
import 'package:ecommerce_flutter/views/authentication/login.dart';
import 'package:ecommerce_flutter/views/user/product/uproduct.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UhomeScreen extends StatelessWidget {
    static const String routeName = '/u-home-screen';
  const UhomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
      final authVM = Provider.of<AuthVM>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Navigate to notifications
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
                  // Call the logout function
                  await authVM.logoutUser();
                  // Navigate back to Login Screen after logout
                  Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildFeatureCard(
              icon: Icons.shopping_cart,
              label: "Products",
              onTap: () {
                  Navigator.pushNamed(context, UProductScreen.routeName);
              },
            ),
            _buildFeatureCard(
              icon: Icons.favorite,
              label: "Wishlist",
              onTap: () {
                // Navigate to Wishlist
              },
            ),
            _buildFeatureCard(
              icon: Icons.history,
              label: "Orders",
              onTap: () {
                // Navigate to Orders
              },
            ),
            _buildFeatureCard(
              icon: Icons.settings,
              label: "Settings",
              onTap: () {
                // Navigate to Settings
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          // Handle bottom navigation bar tap
        },
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.teal),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.teal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
