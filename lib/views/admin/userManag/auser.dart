import 'package:ecommerce_flutter/models/user_model.dart';
import 'package:ecommerce_flutter/views/admin/userManag/userVM.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  static const String routeName = '/a-users-screen';
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User List',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.teal,
        elevation: 4,
        centerTitle: true,
      ),
      body: Consumer<UserVM>(builder: (context, vm, _) {
        final data = vm.users;

        if (data.isEmpty) {
          return const Center(
            child: Text(
              "No users available",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          itemCount: data.length,
          itemBuilder: (context, index) {
            final user = data[index];

            return Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.6),
                ),
                elevation: 3,
                shadowColor: Colors.teal.withOpacity(0.3),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  leading: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.teal.shade100,
                        child: Text(
                          user.username!.substring(0, 1).toUpperCase(),
                          style: const TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 2,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            "Active",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  title: Text(
                    user.username!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.lock_outline,
                              size: 16,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "Password: ${user.password}",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(
                              Icons.person_outline,
                              size: 16,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "Type: ${user.type}",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_forever_rounded,
                        color: Colors.redAccent, size: 28),
                    onPressed: () {
                      // Add delete functionality here
                    },
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
