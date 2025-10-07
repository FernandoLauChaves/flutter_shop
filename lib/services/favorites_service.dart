import '../models/product.dart';
import '../data/products_data.dart';
import 'auth_service.dart';

class FavoritesService {
  static Future<List<Product>> getFavoriteProducts() async {
    final currentUser = await AuthService.getCurrentUser();
    if (currentUser == null) return [];

    final allProducts = ProductsData.products;
    return allProducts
        .where((product) => currentUser.favoriteProducts.contains(product.id))
        .toList();
  }

  static Future<bool> isFavorite(String productId) async {
    final currentUser = await AuthService.getCurrentUser();
    if (currentUser == null) return false;

    return currentUser.favoriteProducts.contains(productId);
  }

  static Future<void> toggleFavorite(String productId) async {
    final currentUser = await AuthService.getCurrentUser();
    if (currentUser == null) return;

    final favoriteProducts = List<String>.from(currentUser.favoriteProducts);

    if (favoriteProducts.contains(productId)) {
      favoriteProducts.remove(productId);
    } else {
      favoriteProducts.add(productId);
    }

    final updatedUser = currentUser.copyWith(
      favoriteProducts: favoriteProducts,
    );
    await AuthService.updateUser(updatedUser);
  }

  static Future<void> addToFavorites(String productId) async {
    final currentUser = await AuthService.getCurrentUser();
    if (currentUser == null) return;

    final favoriteProducts = List<String>.from(currentUser.favoriteProducts);
    if (!favoriteProducts.contains(productId)) {
      favoriteProducts.add(productId);
      final updatedUser = currentUser.copyWith(
        favoriteProducts: favoriteProducts,
      );
      await AuthService.updateUser(updatedUser);
    }
  }

  static Future<void> removeFromFavorites(String productId) async {
    final currentUser = await AuthService.getCurrentUser();
    if (currentUser == null) return;

    final favoriteProducts = List<String>.from(currentUser.favoriteProducts);
    favoriteProducts.remove(productId);

    final updatedUser = currentUser.copyWith(
      favoriteProducts: favoriteProducts,
    );
    await AuthService.updateUser(updatedUser);
  }

  static Future<List<String>> getFavoriteCategories() async {
    final favoriteProducts = await getFavoriteProducts();
    return favoriteProducts.map((product) => product.category).toSet().toList();
  }

  static Future<int> getFavoriteCount() async {
    final currentUser = await AuthService.getCurrentUser();
    if (currentUser == null) return 0;

    return currentUser.favoriteProducts.length;
  }
}
