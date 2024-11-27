import 'package:ecommerce_flutter/models/product_model.dart';
import 'package:ecommerce_flutter/views/admin/product/add_product.dart';
import 'package:ecommerce_flutter/views/admin/product/aproductVM.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AProductScreen extends StatelessWidget {
  static const String routeName = '/a-product-screen';

  const AProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        backgroundColor: Colors.teal,
      ),
      body: Consumer<AProductVM>(
        builder: (context, productVM, child) {
          final products = productVM.products;

          return ListView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductCard(
                product: product,
                onDelete: () => _confirmDelete(context, productVM, product),
                onUpdate: () => _showUpdatePopup(context, productVM, product),
              );
            },
          );
        },
      ),
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton(
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
          backgroundColor: Colors.teal,
          child: const Icon(Icons.add),
        ),
      ),
      endDrawer: const AddProductDrawer(),
    );
  }

  void _confirmDelete(
      BuildContext context, AProductVM productVM, ProductModel product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Delete'),
        content: Text('Are you sure you want to delete ${product.name}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              productVM.dtlProduct(product.id!.toInt());

              Navigator.of(context).pop();
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _showUpdatePopup(
      BuildContext context, AProductVM vm, ProductModel product) {
    // Local variables to temporarily store updated values
    String updatedName = product.name ?? '';
    String updatedDescription = product.description ?? '';
    double updatedPrice = product.price ?? 0.0;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Update Product'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                initialValue: updatedName,
                decoration: const InputDecoration(
                  labelText: 'Product Name',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  updatedName = value;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                initialValue: updatedDescription,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  updatedDescription = value;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                initialValue: updatedPrice.toString(),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  updatedPrice = double.tryParse(value) ?? 0.0;
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              final updatedProduct = product.copyWith(
                name: updatedName,
                description: updatedDescription,
                price: updatedPrice,
              );
              await vm.updateProduct(product.id!.toInt(), updatedProduct);
              Navigator.of(context).pop();
            },
            child: const Text('Update', style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onDelete;
  final VoidCallback onUpdate;

  const ProductCard({
    required this.product,
    required this.onDelete,
    required this.onUpdate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.5),
                    color: Colors.grey[300],
                  ),
                  child: const Icon(Icons.image, size: 50, color: Colors.grey),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: onUpdate,
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: onDelete,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              product.name ?? 'Unknown Product',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 5),
            Text(
              product.description ?? 'No description available',
              style: const TextStyle(color: Colors.grey),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
            Text(
              '\$${product.price?.toStringAsFixed(2) ?? '0.00'}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.teal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
