import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/category_model.dart';
import 'aproductVM.dart';

class Category extends StatelessWidget {
  final CategoryModel? category;
  final bool? isUpdate;
  const Category({super.key, this.category,this.isUpdate});

  @override
  Widget build(BuildContext context) {
    return Consumer<AProductVM>(builder: (context, vm, child) {
      return AlertDialog(
        title: const Text("Add Category"),
        content: TextFormField(
          initialValue: category?.name,
          decoration: const InputDecoration(hintText: "Enter category name"),
          onChanged: (value) {
            vm.category = vm.category.copyWith(name: value);
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              if (vm.category.name!.isNotEmpty) {
             isUpdate==true?vm.addCategory(vm.category,isUpdate):vm.addCategory(category,isUpdate);
                Navigator.pop(context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Category name cannot be empty"),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: const Text("Add"),
          ),
        ],
      );
    });
  }
}
