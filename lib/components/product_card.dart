import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/favorites_notifier.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  final VoidCallback? onTap;
  final bool showFavoriteButton;
  final VoidCallback? onFavoriteToggled;

  const ProductCard({
    super.key,
    required this.product,
    this.onTap,
    this.showFavoriteButton = true,
    this.onFavoriteToggled,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ProductCard oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;

    // Ajustar tamanhos baseado na largura da tela
    double imageHeight = 120;
    double nameFontSize = 12; // Aumentado para melhor legibilidade
    double categoryFontSize = 10; // Aumentado para melhor legibilidade
    double priceFontSize = 12; // Aumentado para melhor legibilidade
    double padding = 6; // Aumentado para melhor espaçamento

    if (screenWidth > 1200) {
      imageHeight = 140;
      nameFontSize = 13; // Aumentado para telas grandes
      categoryFontSize = 11; // Aumentado para telas grandes
      priceFontSize = 13; // Aumentado para telas grandes
      padding = 8; // Aumentado para telas grandes
    } else if (screenWidth > 800) {
      imageHeight = 130;
      nameFontSize = 12; // Aumentado para telas médias
      categoryFontSize = 10; // Aumentado para telas médias
      priceFontSize = 12; // Aumentado para telas médias
      padding = 6; // Aumentado para telas médias
    }

    return AnimatedBuilder(
      animation: FavoritesNotifier(),
      builder: (context, _) {
        final isFavorite = FavoritesNotifier().isFavorite(widget.product.id);
        return Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: InkWell(
            onTap: widget.onTap,
            borderRadius: BorderRadius.circular(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Imagem do produto
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  child: SizedBox(
                    height: imageHeight,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Image.asset(
                          widget.product.imageUrl,
                          height: imageHeight,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                                color: Colors.grey[200],
                                alignment: Alignment.center,
                                child: const Icon(
                                  Icons.broken_image,
                                  size: 40,
                                  color: Colors.grey,
                                ),
                              ),
                        ),
                        if (widget.showFavoriteButton)
                          Positioned(
                            top: 8,
                            right: 8,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.9),
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                icon: _isLoading
                                    ? SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                theme.primaryColor,
                                              ),
                                        ),
                                      )
                                    : Icon(
                                        isFavorite
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: isFavorite
                                            ? Colors.red
                                            : theme.primaryColor,
                                        size: 20,
                                      ),
                                onPressed: () async {
                                  setState(() {
                                    _isLoading = true;
                                  });
                                  await FavoritesNotifier().toggleFavorite(
                                    widget.product.id,
                                  );
                                  setState(() {
                                    _isLoading = false;
                                  });
                                  if (widget.onFavoriteToggled != null) {
                                    widget.onFavoriteToggled!();
                                  }
                                  if (mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          isFavorite
                                              ? 'Produto removido dos favoritos!'
                                              : 'Produto adicionado aos favoritos!',
                                        ),
                                        backgroundColor: Theme.of(
                                          context,
                                        ).primaryColor,
                                        duration: const Duration(seconds: 2),
                                      ),
                                    );
                                  }
                                },
                                padding: const EdgeInsets.all(4),
                                constraints: const BoxConstraints(
                                  minWidth: 32,
                                  minHeight: 32,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                // Informações do produto
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.all(padding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Nome do produto
                        Text(
                          widget.product.name,
                          style: TextStyle(
                            fontSize: nameFontSize,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        // Categoria
                        Text(
                          widget.product.category,
                          style: TextStyle(
                            fontSize: categoryFontSize,
                            color: Colors.white70,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        // Preço
                        Text(
                          'R\$ ${widget.product.price.toStringAsFixed(2).replaceAll('.', ',')}',
                          style: TextStyle(
                            fontSize: priceFontSize,
                            fontWeight: FontWeight.bold,
                            color: theme.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
