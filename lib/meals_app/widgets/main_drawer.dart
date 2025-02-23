import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget buildListTile(String title, IconData icon, String identifier) {
      return ListTile(
        title: Text(
          title,
          style: theme.textTheme.titleSmall!.copyWith(
            color: theme.colorScheme.onBackground,
          ),
        ),
        leading: Icon(
          icon,
          size: 26,
          color: theme.colorScheme.onBackground,
        ),
        onTap: () => onSelectScreen(identifier),
      );
    }

    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  theme.colorScheme.primaryContainer,
                  theme.colorScheme.primaryContainer.withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                const Icon(Icons.fastfood_outlined, size: 48),
                const SizedBox(width: 18),
                Text(
                  'Cooking Up!',
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                ),
              ],
            ),
          ),
          buildListTile('Meals', Icons.restaurant, 'meals'),
          buildListTile('Filters', Icons.settings, 'filters'),
        ],
      ),
    );
  }
}
