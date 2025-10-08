import 'package:flutter/material.dart';
import '../components/custom_drawer.dart';
import '../components/product_card.dart';
import '../models/product.dart';
import '../services/favorites_service.dart';
import 'product_detail_screen.dart';
import 'home_screen.dart';
import 'products_screen.dart';
import 'about_screen.dart';
import '../components/filter_bar.dart'; // Added import for FilterBar

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<Product> _favoriteProducts = [];
  List<Product> _filteredProducts = [];
  List<String> _categories = [];
  String _selectedCategory = 'Todas';
  String _sortBy = 'Data de Adição';
  bool _isLoading = true;

  final List<String> _sortOptions = [
    'Data de Adição',
    'Nome A-Z',
    'Nome Z-A',
    'Preço: Menor para Maior',
    'Preço: Maior para Menor',
  ];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Recarregar favoritos quando a tela for exibida novamente
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final favoriteProducts = await FavoritesService.getFavoriteProducts();
      final categories = favoriteProducts
          .map((product) => product.category)
          .toSet()
          .toList();

      setState(() {
        _favoriteProducts = favoriteProducts;
        _categories = ['Todas', ...categories];
        _applyFilters();
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _applyFilters() {
    List<Product> filtered = List.from(_favoriteProducts);

    // Filtrar por categoria
    if (_selectedCategory != 'Todas') {
      filtered = filtered
          .where((product) => product.category == _selectedCategory)
          .toList();
    }

    // Ordenar
    switch (_sortBy) {
      case 'Data de Adição':
        // Ordenar por data de adição (mais recente primeiro)
        filtered.sort((a, b) => b.dateAdded.compareTo(a.dateAdded));
        break;
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

  void _navigateToHome() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
      (route) => false,
    );
  }

  void _navigateToProducts() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProductsScreen()),
    );
  }

  void _navigateToAbout() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AboutScreen()),
    );
  }

  void _navigateToProductDetail(Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailScreen(product: product),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Favoritos'),
        // Remover actions de filtro duplicado
      ),
      drawer: CustomDrawer(
        currentRoute: '/favorites',
        onHomeTap: _navigateToHome,
        onProductsTap: _navigateToProducts,
        onFavoritesTap: () => Navigator.pop(context),
        onAboutTap: _navigateToAbout,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                FilterBar(
                  selectedCategory: _selectedCategory,
                  sortBy: _sortBy,
                  categories: _categories,
                  sortOptions: _sortOptions,
                  onCategoryChanged: (category) {
                    setState(() {
                      _selectedCategory = category;
                    });
                    _applyFilters();
                  },
                  onSortChanged: (sort) {
                    setState(() {
                      _sortBy = sort;
                    });
                    _applyFilters();
                  },
                ),

                // Contador de produtos
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Text(
                        '${_filteredProducts.length} produtos favoritados',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurface.withValues(
                            alpha: 0.7,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

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
                                  onFavoriteToggled: _loadFavorites,
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
