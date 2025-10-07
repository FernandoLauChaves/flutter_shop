import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/auth_service.dart';
import '../services/favorites_service.dart';

class UserInfoDialog extends StatefulWidget {
  const UserInfoDialog({super.key});

  @override
  State<UserInfoDialog> createState() => _UserInfoDialogState();
}

class _UserInfoDialogState extends State<UserInfoDialog> {
  User? _currentUser;
  int _favoriteCount = 0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  Future<void> _loadUserInfo() async {
    try {
      final user = await AuthService.getCurrentUser();
      final favoriteCount = await FavoritesService.getFavoriteCount();

      if (mounted) {
        setState(() {
          _currentUser = user;
          _favoriteCount = favoriteCount;
          _isLoading = false;
        });
      }
    } catch (e) {
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

    return AlertDialog(
      backgroundColor: Colors.grey[900],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Row(
        children: [
          Icon(Icons.person, color: theme.primaryColor, size: 28),
          const SizedBox(width: 8),
          const Text(
            'Informações do Usuário',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      content: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _currentUser == null
          ? const Text(
              'Erro ao carregar informações do usuário',
              style: TextStyle(color: Colors.white),
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoRow(
                  icon: Icons.person_outline,
                  label: 'Nome',
                  value: _currentUser!.name,
                ),
                const SizedBox(height: 16),
                _buildInfoRow(
                  icon: Icons.email_outlined,
                  label: 'E-mail',
                  value: _currentUser!.email,
                ),
                const SizedBox(height: 16),
                _buildInfoRow(
                  icon: Icons.favorite,
                  label: 'Produtos Favoritos',
                  value: '$_favoriteCount itens',
                ),
                const SizedBox(height: 16),
                _buildInfoRow(
                  icon: Icons.calendar_today,
                  label: 'Membro desde',
                  value: _formatDate(_currentUser!.createdAt),
                ),
              ],
            ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'Fechar',
            style: TextStyle(
              color: theme.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.grey[400], size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }
}
