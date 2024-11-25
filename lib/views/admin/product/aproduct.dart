import 'package:ecommerce_flutter/models/product_model.dart';
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

          // Display products in a list view
          return ListView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductCard(product: product);
            },
          );
        },
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({required this.product, super.key});

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
          mainAxisSize:
              MainAxisSize.min, // Set to min to shrink-wrap the column
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image (Placeholder for now)
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.5),
                color: Colors.grey[300],
              ),
              child: const Icon(Icons.image, size: 50, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            // Product Name
            Text(
              product.name ?? 'Unknown Product',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 5),
            // Product Description
            Text(
              product.description ?? 'No description available',
              style: const TextStyle(color: Colors.grey),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10), // Adjusted spacing
            // Product Price
            Text(
              '\$${product.price?.toStringAsFixed(2) ?? '0.00'}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 5),
            // Add to Cart Button
            ElevatedButton(
              onPressed: () {
                // TODO: Implement add-to-cart functionality
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${product.name} added to cart!'),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
