import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rearch/rearch.dart';
import 'package:rearch_demo/features/products/data/product_model.dart';
import 'package:rearch_demo/shared/utils.dart';

// The Service Capsule
class ProductService {
  Future<List<Product>> fetchProducts() async {
    AppLogger.logger.info('Fetching products from API');
    try {
      // Replace with your actual API endpoint or local asset path
      final response = await http.get(
        Uri.parse('https://dummyjson.com/products'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final products = ProductResponse.fromJson(data).products;
        AppLogger.logger.info(
          'Successfully fetched ${products.length} products',
        );
        return products;
      } else {
        AppLogger.logger.warning(
          'Failed to load products: HTTP ${response.statusCode}',
        );
        throw Exception('Failed to load products');
      }
    } catch (e) {
      AppLogger.logger.severe('Error fetching products: $e');
      rethrow;
    }
  }
}

ProductService productServiceCapsule(CapsuleHandle use) => ProductService();

// The Logic Capsule (Managing the state)
AsyncValue<List<Product>> productsStateCapsule(CapsuleHandle use) {
  final api = use(productServiceCapsule);
  final (refreshCount, _) = use.state(0);

  return use.future(
    use.memo(
      () => api.fetchProducts(),
      [refreshCount], // When refreshCount changes, this re-runs
    ),
  );
}

// Action Capsule to trigger a refresh
void Function() refreshProductsAction(CapsuleHandle use) {
  final (refreshCount, setRefreshCount) = use.state(0);

  // Pass the new integer value directly
  return () => setRefreshCount(refreshCount + 1);
}