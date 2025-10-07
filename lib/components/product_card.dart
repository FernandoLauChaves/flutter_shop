import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/favorites_service.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  final VoidCallback? onTap;
  final bool showFavoriteButton;

  const ProductCard({
    super.key,
    required this.product,
    this.onTap,
    this.showFavoriteButton = true,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _isFavorite = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _checkFavoriteStatus();
  }

  Future<void> _checkFavoriteStatus() async {
    final isFavorite = await FavoritesService.isFavorite(widget.product.id);
    if (mounted) {
      setState(() {
        _isFavorite = isFavorite;
      });
    }
  }

  Future<void> _toggleFavorite() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    try {
      await FavoritesService.toggleFavorite(widget.product.id);
      setState(() {
        _isFavorite = !_isFavorite;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              _isFavorite
                  ? 'Produto adicionado aos favoritos!'
                  : 'Produto removido dos favoritos!',
            ),
            backgroundColor: Theme.of(context).primaryColor,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Erro ao atualizar favoritos'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
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

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: Colors.grey[200],
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.broken_image,
                          size: 40,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    // Botão de favorito
                    if (widget.showFavoriteButton)
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.9),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: _isLoading
                                ? SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        theme.primaryColor,
                                      ),
                                    ),
                                  )
                                : Icon(
                                    _isFavorite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: _isFavorite
                                        ? Colors.red
                                        : theme.primaryColor,
                                    size: 20,
                                  ),
                            onPressed: _toggleFavorite,
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
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // Distribui o espaço
                  children: [
                    // Nome do produto
                    Text(
                      widget.product.name,
                      style: TextStyle(
                        fontSize: nameFontSize,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // Categoria
                    Text(
                      widget.product.category,
                      style: TextStyle(
                        fontSize: categoryFontSize,
                        color: Colors.grey[600],
                      ), // Reduzido de 12 para 10
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
  }
}
