import 'package:ecommerce_flutter/constant/constant.dart';
import 'package:ecommerce_flutter/views/admin/ahome/dashboard_graph.dart';
import 'package:ecommerce_flutter/views/authentication/login.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../authentication/authVM.dart';
import '../product/aproduct.dart';
import '../userManag/auser.dart';

class AhomeScreen extends StatelessWidget {
  static const String routeName = '/a-home-screen';
  const AhomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authVM = Provider.of<AuthVM>(context, listen: false);

    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 250,
            color: CustomColors.appBarTextColor,
            child: Column(
              children: [
                40.height,
                const CircleAvatar(
                  radius: 50,
                ),
                10.height,
                const Text('Daniel Kevin', style: TextStyle(color: CustomColors.headingTextColor, fontSize: 18)),
                const Text('danielkevin@gmail.com', style: TextStyle(color: Colors.grey)),
                20.height,
                ListTile(
                  leading: const Icon(Icons.dashboard, color: CustomColors.headingTextColor),
                  title: const Text(
                    'Dashboard',
                    style: TextStyle(color: CustomColors.headingTextColor),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.people, color: CustomColors.headingTextColor),
                  title: const Text(
                    'Manage Users',
                    style: TextStyle(color: CustomColors.headingTextColor),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, UserList.routeName);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.analytics, color: CustomColors.headingTextColor),
                  title: const Text(
                    'Manage Products',
                    style: TextStyle(color: CustomColors.headingTextColor),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, AProductScreen.routeName);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout, color: CustomColors.headingTextColor),
                  title: const Text(
                    'Logout',
                    style: TextStyle(color: CustomColors.headingTextColor),
                  ),
                  onTap: () async {
                    await authVM.logoutUser();
                    Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                  },
                ),
              ],
            ),
          ),
          const VerticalDivider(thickness: 2, color: CustomColors.lightGrey, width: 5),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Dashboard",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    20.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildMetricCard("Total Revenue", "\$11,354.00", Colors.black),
                        _buildMetricCard("Total Customer", "45,439", Colors.blue),
                        _buildMetricCard("Total Profit", "\$8,354.00", Colors.green),
                      ],
                    ),
                    20.height, 
                    SpendingStatisticGraph(),
                    10.height,
                    const Text(
                      "Latest Orders",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    10.height,
                    Container(
                      color: Colors.grey.shade300, 
                      child: const Center(child: Text("Order Table Placeholder")),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCard(String title, String value, Color color) {
    return Expanded(
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 10),
              Text(
                value,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
