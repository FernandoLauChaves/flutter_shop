import 'package:flutter/material.dart';

class FilterBar extends StatelessWidget {
  final String selectedCategory;
  final String sortBy;
  final List<String> categories;
  final List<String> sortOptions;
  final Function(String) onCategoryChanged;
  final Function(String) onSortChanged;

  const FilterBar({
    super.key,
    required this.selectedCategory,
    required this.sortBy,
    required this.categories,
    required this.sortOptions,
    required this.onCategoryChanged,
    required this.onSortChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border(
          bottom: BorderSide(
            color: theme.primaryColor.withOpacity(0.2),
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          // Filtros em linha
          Row(
            children: [
              // Filtro de categoria
              Expanded(
                child: InkWell(
                  onTap: () => _showCategoryFilter(context),
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: theme.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: theme.primaryColor.withOpacity(0.3),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.category,
                          size: 16,
                          color: theme.primaryColor,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            selectedCategory,
                            style: TextStyle(
                              color: theme.primaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: theme.primaryColor,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 12),

              // Filtro de ordenação
              Expanded(
                child: InkWell(
                  onTap: () => _showSortFilter(context),
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: theme.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: theme.primaryColor.withOpacity(0.3),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.sort, size: 16, color: theme.primaryColor),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            sortBy,
                            style: TextStyle(
                              color: theme.primaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: theme.primaryColor,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showCategoryFilter(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height * 0.6;
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (context) => Container(
        constraints: BoxConstraints(maxHeight: maxHeight),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Filtrar por Categoria',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: categories
                    .map(
                      (category) => ListTile(
                        title: Text(
                          category,
                          style: TextStyle(
                            color: selectedCategory == category
                                ? Theme.of(context).primaryColor
                                : Colors.white,
                            fontWeight: selectedCategory == category
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                        trailing: selectedCategory == category
                            ? Icon(
                                Icons.check,
                                color: Theme.of(context).primaryColor,
                              )
                            : null,
                        onTap: () {
                          onCategoryChanged(category);
                          Navigator.pop(context);
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSortFilter(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height * 0.6;
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (context) => Container(
        constraints: BoxConstraints(maxHeight: maxHeight),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ordenar por',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: sortOptions
                    .map(
                      (option) => ListTile(
                        title: Text(
                          option,
                          style: TextStyle(
                            color: sortBy == option
                                ? Theme.of(context).primaryColor
                                : Colors.white,
                            fontWeight: sortBy == option
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                        trailing: sortBy == option
                            ? Icon(
                                Icons.check,
                                color: Theme.of(context).primaryColor,
                              )
                            : null,
                        onTap: () {
                          onSortChanged(option);
                          Navigator.pop(context);
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
