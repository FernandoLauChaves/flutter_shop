import 'package:flutter/material.dart';
import '../components/custom_drawer.dart';
import 'home_screen.dart';
import 'products_screen.dart';
import 'favorites_screen.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  void _navigateToHome(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
      (route) => false,
    );
  }

  void _navigateToProducts(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProductsScreen()),
    );
  }

  void _navigateToFavorites(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FavoritesScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Sobre o App')),
      drawer: CustomDrawer(
        currentRoute: '/about',
        onHomeTap: () => _navigateToHome(context),
        onProductsTap: () => _navigateToProducts(context),
        onFavoritesTap: () => _navigateToFavorites(context),
        onAboutTap: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Center(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: theme.primaryColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.store,
                      size: 80,
                      color: theme.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Flutter Store',
                    style: theme.textTheme.displayMedium?.copyWith(
                      color: theme.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Versão 1.0.0',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.onSurface.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Descrição do app
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: theme.primaryColor.withOpacity(0.2)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: theme.primaryColor,
                        size: 24,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Sobre o Aplicativo',
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'O Flutter Store é uma aplicação móvel desenvolvida para simular uma loja virtual especializada em componentes de computador. Nossa plataforma oferece uma experiência completa de compras, permitindo que os usuários explorem uma ampla variedade de produtos de alta qualidade.',
                    style: theme.textTheme.bodyLarge?.copyWith(height: 1.6),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Com uma interface moderna e intuitiva, os usuários podem navegar por diferentes categorias de produtos, visualizar detalhes completos, favoritar itens de interesse e gerenciar sua lista pessoal de produtos preferidos.',
                    style: theme.textTheme.bodyLarge?.copyWith(height: 1.6),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Mercado de computadores
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: theme.primaryColor.withOpacity(0.2)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.computer, color: theme.primaryColor, size: 24),
                      const SizedBox(width: 8),
                      Text(
                        'Mercado de Computadores',
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'O mercado de componentes de computador está em constante evolução, com novas tecnologias surgindo regularmente. Processadores mais rápidos, placas de vídeo com maior poder de processamento gráfico, memórias mais eficientes e periféricos cada vez mais precisos são apenas alguns exemplos das inovações que impulsionam este setor.',
                    style: theme.textTheme.bodyLarge?.copyWith(height: 1.6),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Nossa loja virtual busca acompanhar essas tendências, oferecendo produtos das melhores marcas do mercado, desde componentes básicos até equipamentos de última geração para entusiastas e profissionais.',
                    style: theme.textTheme.bodyLarge?.copyWith(height: 1.6),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Saudação da equipe
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: theme.primaryColor.withOpacity(0.2)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.people, color: theme.primaryColor, size: 24),
                      const SizedBox(width: 8),
                      Text(
                        'Saudação da Equipe',
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'A equipe de desenvolvimento do Flutter Store gostaria de agradecer por escolher nossa aplicação. Estamos comprometidos em fornecer a melhor experiência possível para nossos usuários, combinando tecnologia de ponta com uma interface amigável e intuitiva.',
                    style: theme.textTheme.bodyLarge?.copyWith(height: 1.6),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Esperamos que você aproveite ao máximo todas as funcionalidades disponíveis em nosso aplicativo. Seja para encontrar o processador ideal para seu novo PC, a placa de vídeo perfeita para gaming, ou qualquer outro componente que você precise, estamos aqui para ajudar.',
                    style: theme.textTheme.bodyLarge?.copyWith(height: 1.6),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Desejamos que você tenha uma excelente experiência de compras e que encontre exatamente o que procura!',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      height: 1.6,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Informações técnicas
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: theme.colorScheme.background,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: theme.primaryColor.withOpacity(0.2)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.code, color: theme.primaryColor, size: 24),
                      const SizedBox(width: 8),
                      Text(
                        'Informações Técnicas',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildTechInfo('Desenvolvido com', 'Flutter'),
                  _buildTechInfo('Framework', 'Material Design 3'),
                  _buildTechInfo('Armazenamento', 'SharedPreferences'),
                  _buildTechInfo('Navegação', 'Material Page Route'),
                  _buildTechInfo('Estado', 'StatefulWidget'),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Footer
            Center(
              child: Column(
                children: [
                  Text(
                    '© 2024 Flutter Store',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurface.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Desenvolvido com ❤️ usando Flutter',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurface.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTechInfo(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
