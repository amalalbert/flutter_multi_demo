import 'package:flutter/material.dart';
import 'package:flutter_rearch/flutter_rearch.dart';
import 'package:rearch/rearch.dart';
import 'package:rearch_demo/features/products/data/product_repository.dart';

class ProductListScreen extends RearchConsumer {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetHandle use) {
    final productsAsync = use(productsStateCapsule);
    final refresh = use(refreshProductsAction);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Store Products'),
        actions: [
          IconButton(onPressed: refresh, icon: const Icon(Icons.refresh)),
        ],
      ),
      body: switch (productsAsync) {
        AsyncData(data: final products) => RefreshIndicator(
            onRefresh: () async => refresh(),
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTile(
                  leading: Image.network(product.thumbnail, width: 50),
                  title: Text(product.title),
                  subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                  trailing: const Icon(Icons.chevron_right),
                );
              },
            ),
          ),
        AsyncLoading() => const Center(child: CircularProgressIndicator()),
        AsyncError(error: final err) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Error: $err', textAlign: TextAlign.center),
                ElevatedButton(onPressed: refresh, child: const Text('Try Again')),
              ],
            ),
          ),
      },
    );
  }
}