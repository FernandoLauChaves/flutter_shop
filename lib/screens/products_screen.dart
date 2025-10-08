import 'package:flutter/material.dart';
import '../components/custom_drawer.dart';
import '../components/product_card.dart';
import '../components/filter_bar.dart';
import '../data/products_data.dart';
import '../models/product.dart';
import 'product_detail_screen.dart';
import 'home_screen.dart';
import 'favorites_screen.dart';
import 'about_screen.dart';
import '../services/favorites_notifier.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<Product> _allProducts = [];
  List<Product> _filteredProducts = [];
  List<String> _categories = [];
  String _selectedCategory = 'Todas';
  String _sortBy = 'Nome A-Z';
  bool _isLoading = true;

  final List<String> _sortOptions = [
    'Nome A-Z',
    'Nome Z-A',
    'Preço: Menor para Maior',
    'Preço: Maior para Menor',
  ];

  @override
  void initState() {
    super.initState();
    FavoritesNotifier().loadFavorites();
    _loadProducts();
  }

  void _loadProducts() {
    setState(() {
      _isLoading = true;
    });

    _allProducts = List.from(ProductsData.products);
    _categories = ['Todas', ...ProductsData.categories];
    _applyFilters();

    setState(() {
      _isLoading = false;
    });
  }

  void _applyFilters() {
    List<Product> filtered = List.from(_allProducts);

    // Filtrar por categoria
    if (_selectedCategory != 'Todas') {
      filtered = filtered
          .where((product) => product.category == _selectedCategory)
          .toList();
    }

    // Ordenar
    switch (_sortBy) {
      case 'Nome A-Z':
        filtered.sort((a, b) => a.name.compareTo(b.name));
        break;
      case 'Nome Z-A':
        filtered.sort((a, b) => b.name.compareTo(a.name));
        break;
      case 'Preço: Menor para Maior':
        filtered.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Preço: Maior para Menor':
        filtered.sort((a, b) => b.price.compareTo(a.price));
        break;
    }

    setState(() {
      _filteredProducts = filtered;
    });
  }

  void _onCategoryChanged(String category) {
    setState(() {
      _selectedCategory = category;
    });
    _applyFilters();
  }

  void _onSortChanged(String sort) {
    setState(() {
      _sortBy = sort;
    });
    _applyFilters();
  }

  void _navigateToHome() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
      (route) => false,
    );
  }

  void _navigateToFavorites() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FavoritesScreen()),
    );
  }

  void _navigateToAbout() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AboutScreen()),
    );
  }

  void _navigateToProductDetail(Product product) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailScreen(
          product: product,
          onFavoriteToggled: _loadProducts,
        ),
      ),
    );
    _loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Produtos')),
      drawer: CustomDrawer(
        currentRoute: '/products',
        onHomeTap: _navigateToHome,
        onProductsTap: () => Navigator.pop(context),
        onFavoritesTap: _navigateToFavorites,
        onAboutTap: _navigateToAbout,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                // Barra de filtros integrada
                FilterBar(
                  selectedCategory: _selectedCategory,
                  sortBy: _sortBy,
                  categories: _categories,
                  sortOptions: _sortOptions,
                  onCategoryChanged: _onCategoryChanged,
                  onSortChanged: _onSortChanged,
                ),

                // Contador de produtos
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Row(
                    children: [
                      Text(
                        '${_filteredProducts.length} produtos encontrados',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurface.withValues(
                            alpha: 0.7,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Grid de produtos
                Expanded(
                  child: _filteredProducts.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.search_off,
                                size: 64,
                                color: theme.colorScheme.onSurface.withValues(
                                  alpha: 0.5,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Nenhum produto encontrado',
                                style: theme.textTheme.titleLarge?.copyWith(
                                  color: theme.colorScheme.onSurface.withValues(
                                    alpha: 0.7,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Tente ajustar os filtros',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.colorScheme.onSurface.withValues(
                                    alpha: 0.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : LayoutBuilder(
                          builder: (context, constraints) {
                            // Calcular número de colunas baseado na largura da tela
                            int crossAxisCount = 2;
                            double childAspectRatio = 0.8;

                            if (constraints.maxWidth > 1200) {
                              crossAxisCount = 4;
                              childAspectRatio = 0.9;
                            } else if (constraints.maxWidth > 800) {
                              crossAxisCount = 3;
                              childAspectRatio = 0.85;
                            } else if (constraints.maxWidth > 600) {
                              crossAxisCount = 2;
                              childAspectRatio = 0.8;
                            } else {
                              crossAxisCount = 2;
                              childAspectRatio = 0.75;
                            }

                            return GridView.builder(
                              padding: const EdgeInsets.all(16),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: crossAxisCount,
                                    childAspectRatio: childAspectRatio,
                                    crossAxisSpacing: 12,
                                    mainAxisSpacing: 12,
                                  ),
                              itemCount: _filteredProducts.length,
                              itemBuilder: (context, index) {
                                final product = _filteredProducts[index];
                                return ProductCard(
                                  product: product,
                                  onTap: () =>
                                      _navigateToProductDetail(product),
                                  onFavoriteToggled: _loadProducts,
                                );
                              },
                            );
                          },
                        ),
                ),
              ],
            ),
    );
  }
}
