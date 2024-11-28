import 'package:ecommerce_flutter/models/product_model.dart';
import 'package:ecommerce_flutter/views/admin/product/add_product.dart';
import 'package:ecommerce_flutter/views/admin/product/aproductVM.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AProductScreen extends StatelessWidget {
  static const String routeName = '/a-product-screen';

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Assign the key to the Scaffold
      appBar: AppBar(
        title: const Text(
          'Products',
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.teal,
        elevation: 4,
        centerTitle: true,
      ),
      body: Consumer<AProductVM>(
        builder: (context, productVM, child) {
          final categories = productVM.categoryWithProductsModel;

          if (categories.isEmpty && !productVM.isLoaded) {
            productVM.fetchCategories();
          }

          return categories.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    // Category Filter using Chips
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 8),
                      child: Row(
                        children: [
                          // "Show All" Chip
                          _buildCategoryChip(
                            label: 'Show All',
                            isSelected: productVM.selectedCategoryId == null,
                            onSelected: () => productVM.clearSelectedCategory(),
                          ),
                          // Category Chips
                          ...productVM.categories.map((category) {
                            final isSelected =
                                productVM.selectedCategoryId == category.id;

                            return _buildCategoryChip(
                              label: category.name ?? 'No Category',
                              isSelected: isSelected,
                              onSelected: () => productVM.fetchProducts(
                                  categoryId: category.id),
                            );
                          }).toList(),
                        ],
                      ),
                    ),

                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 8),
                        itemCount: categories.length,
                        itemBuilder: (context, categoryIndex) {
                          final category = categories[categoryIndex];
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.teal.withOpacity(0.1),
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(10),
                                    ),
                                  ),
                                  child: Text(
                                    category.category ?? 'No Category',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.teal,
                                    ),
                                  ),
                                ),
                                Divider(
                                  color: Colors.teal.withOpacity(0.3),
                                  thickness: 1,
                                ),
                                _buildProductList(context, productVM, category),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _scaffoldKey.currentState
              ?.openEndDrawer(); // Use the Scaffold's key to open the drawer
        },
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      endDrawer: Container(  width: MediaQuery.of(context).size.width * 0.5,
child: const AddProductDrawer()),
    );
  }

  Widget _buildCategoryChip({
    required String label,
    required bool isSelected,
    required VoidCallback onSelected,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: ChoiceChip(
        label: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : Colors.teal,
          ),
        ),
        selected: isSelected,
        selectedColor: Colors.teal,
        backgroundColor: Colors.teal.withOpacity(0.2),
        onSelected: (_) => onSelected(),
      ),
    );
  }

  Widget _buildProductList(BuildContext context, AProductVM productVM,
      CategoryWithProductsModel category) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: (category.products?.length ?? 0) ~/ 2 +
          (category.products!.length % 2 == 0 ? 0 : 1),
      itemBuilder: (context, rowIndex) {
        final startIndex = rowIndex * 2;
        final product1 = category.products![startIndex];
        final product2 = (startIndex + 1 < category.products!.length)
            ? category.products![startIndex + 1]
            : null;

        return Row(
          children: [
            // First product card
            Expanded(
              child: _buildProductCard(context, productVM, product1),
            ),
            const SizedBox(width: 10), // Space between the cards
            if (product2 != null)
              Expanded(
                child: _buildProductCard(context, productVM, product2),
              ),
          ],
        );
      },
    );
  }

  Widget _buildProductCard(
      BuildContext context, AProductVM productVM, ProductModel product) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      elevation: 2.4,
      child: InkWell(
        onTap: () {
          _showUpdatePopup(context, productVM, product);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.teal.withOpacity(0.1),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(8),
                ),
              ),
              child: Image.network(product.imageUrl.toString()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.name ?? 'No Name',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            _buildPriceWidget(product),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.teal),
                    onPressed: () {
                      _showUpdatePopup(context, productVM, product);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      _confirmDelete(context, productVM, product);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceWidget(ProductModel product) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: Text(
        'Price: \$${product.price?.toStringAsFixed(2) ?? '0.00'}',
        style: const TextStyle(
          fontSize: 12,
          color: Colors.teal,
          fontWeight: FontWeight.w500,
        ),
      ),
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
