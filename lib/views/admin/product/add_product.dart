import 'package:ecommerce_flutter/models/category_model.dart';
import 'package:ecommerce_flutter/views/admin/product/aproductVM.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../../constant/constant.dart';
import '../../../constant/custombutton.dart';
import 'category.dart';

class AddProductDrawer extends StatelessWidget {
  const AddProductDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<AProductVM>(context, listen: false);
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Add New Product', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: CustomColors.headingTextColor)),
            20.height,
            Center(
              child: Container(
                height: 190,
                width: 150,
                decoration: BoxDecoration(
                  color: CustomColors.borderColor,
                  border: Border.all(color: CustomColors.lightGrey, width: 1.0),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Product Image", style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12, fontWeight: FontWeight.w400)),
                      Container(
                        height: 99,
                        width: 99,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: CustomColors.backgroundColor,
                          image: const DecorationImage(image: NetworkImage(""), fit: BoxFit.cover),
                        ),
                      ),
                      5.height,
                      CustomButton(borderRadius: 5, icon: Icons.file_upload, text: "", color: CustomColors.primaryColors, textColor: Colors.white, iconSize: 20, fontSize: 12, height: 30, width: 99, onTap: () {}),
                    ],
                  ),
                ),
              ),
            ),
            10.height,
            TextFormField(
              decoration: const InputDecoration(labelText: 'Product Name', border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
              onChanged: (x) {
                vm.product = vm.product.copyWith(name: x);
              },
            ),
            10.height,
            TextFormField(
              maxLines: 4,
              decoration: const InputDecoration(labelText: 'Description', border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
              onChanged: (x) {
                vm.product = vm.product.copyWith(description: x);
              },
            ),
            10.height,
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Price', border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
              onChanged: (x) {
                vm.product = vm.product.copyWith(price: double.parse(x));
              },
            ),
            10.height,
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(labelText: 'Image URL', border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
              onChanged: (x) {
                vm.product = vm.product.copyWith(imageUrl: x);
              },
            ),
            10.height,
            Consumer<AProductVM>(
              builder: (context, vm, child) {
                return Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<CategoryModel>(
                          decoration: const InputDecoration(labelText: 'Category', border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                          value: vm.categories.contains(vm.selectedCategory) ? vm.selectedCategory : null,
                          items: vm.categories.map((category) => DropdownMenuItem<CategoryModel>(value: category, child: Text(category.name.toString()))).toList(),
                          onChanged: (value) {
                            if (value != null) {
                              vm.selectCategory(value);
                            }
                          }),
                    ),
                    if (vm.selectedCategory?.name != null) 10.width,
                    if (vm.selectedCategory?.name != null)
                      IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Category(
                                  isUpdate: true,
                                  category: vm.selectedCategory,
                                );
                              },
                            );
                          },
                          icon: const Icon(Icons.update)),
                    if (vm.selectedCategory?.name != null) 5.width,
                    if (vm.selectedCategory?.name != null)
                      IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text(
                                      "Are you sure you want to delete this category?",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    actions: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text("Cancel", style: TextStyle(color: CustomColors.primaryColors))),
                                          TextButton(
                                              onPressed: () {
                                                vm.deleteCategory(vm.selectedCategory?.id);
                                                Navigator.pop(context);
                                              },
                                              child: const Text("Delete", style: TextStyle(color: CustomColors.primaryColors))),
                                        ],
                                      )
                                    ],
                                  );
                                });
                          },
                          icon: const Icon(Icons.delete)),
                    10.width,
                    CustomButton(
                      height: 40,
                      color: CustomColors.primaryColors,
                      icon: Icons.add,
                      iconSize: 16,
                      iconColor: CustomColors.appBarTextColor,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const Category(
                              isUpdate: false,
                            );
                          },
                        );
                      },
                    ),
                  ],
                );
              },
            ),
            20.height,
            CustomButton(
              height: 40,
              width: double.infinity,
              text: "Add Product",
              color: CustomColors.primaryColors,
              textColor: CustomColors.appBarTextColor,
              onTap: () async {
                await vm.addProduct((success) {
                  if (success) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Product Added Successfully"), backgroundColor: Colors.green),
                    );
                    Navigator.pop(context);
                    vm.fetchProducts();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Failed to Add Product"), backgroundColor: Colors.red),
                    );
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
