import 'package:flutter/material.dart';
import 'favorites_service.dart';

class FavoritesNotifier extends ChangeNotifier {
  static final FavoritesNotifier _instance = FavoritesNotifier._internal();
  factory FavoritesNotifier() => _instance;
  FavoritesNotifier._internal();

  Set<String> _favoriteIds = {};

  Future<void> loadFavorites() async {
    final products = await FavoritesService.getFavoriteProducts();
    _favoriteIds = products.map((p) => p.id).toSet();
    notifyListeners();
  }

  bool isFavorite(String productId) => _favoriteIds.contains(productId);

  Future<void> toggleFavorite(String productId) async {
    await FavoritesService.toggleFavorite(productId);
    await loadFavorites();
  }
}
