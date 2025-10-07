import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../screens/login_screen.dart';

class CustomDrawer extends StatelessWidget {
  final VoidCallback? onHomeTap;
  final VoidCallback? onProductsTap;
  final VoidCallback? onFavoritesTap;
  final VoidCallback? onAboutTap;
  final String? currentRoute;

  const CustomDrawer({
    super.key,
    this.onHomeTap,
    this.onProductsTap,
    this.onFavoritesTap,
    this.onAboutTap,
    this.currentRoute,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Drawer(
      backgroundColor: Colors.grey[900],
      child: Column(
        children: [
          // Header do drawer
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  theme.primaryColor,
                  theme.primaryColor.withOpacity(0.8),
                ],
              ),
            ),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.store, size: 60, color: Colors.white),
                  SizedBox(height: 8),
                  Text(
                    'Flutter Store',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Itens do menu
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildDrawerItem(
                  context: context,
                  icon: Icons.home,
                  title: 'Início',
                  onTap: () {
                    Navigator.pop(context);
                    if (currentRoute != '/home') {
                      onHomeTap?.call();
                    }
                  },
                ),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.shopping_bag,
                  title: 'Produtos',
                  onTap: () {
                    Navigator.pop(context);
                    if (currentRoute != '/products') {
                      onProductsTap?.call();
                    }
                  },
                ),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.favorite,
                  title: 'Minha Lista',
                  onTap: () {
                    Navigator.pop(context);
                    if (currentRoute != '/favorites') {
                      onFavoritesTap?.call();
                    }
                  },
                ),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.info,
                  title: 'Sobre',
                  onTap: () {
                    Navigator.pop(context);
                    if (currentRoute != '/about') {
                      onAboutTap?.call();
                    }
                  },
                ),
                const Divider(color: Colors.grey),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.logout,
                  title: 'Sair',
                  onTap: () async {
                    Navigator.pop(context);
                    await AuthService.logout();
                    if (context.mounted) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                        (route) => false,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white, size: 24),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
      hoverColor: Colors.grey[800],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }
}
