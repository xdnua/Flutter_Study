import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lam_quen_flutter/meals_app/providers/favorites_provider.dart';
import 'package:lam_quen_flutter/meals_app/providers/filters_provider.dart';
import 'package:lam_quen_flutter/meals_app/screens/categories_screen.dart';
import 'package:lam_quen_flutter/meals_app/screens/filters_screen.dart';
import 'package:lam_quen_flutter/meals_app/widgets/main_drawer.dart';
import 'package:lam_quen_flutter/meals_app/screens/meals_screen.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() => _selectedPageIndex = index);
  }

  Future<void> _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(builder: (ctx) => const FiltersScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredMealsProvider);
    final favoriteMeals = ref.watch(favoriteMealsProvider);

    final List<Widget> pages = [
      CategoriesScreen(availableMeals: availableMeals),
      MealsScreen(title: 'Your Favorites', meals: favoriteMeals),
    ];

    final selectedPageTitle =
        _selectedPageIndex == 0 ? 'Categories' : 'Your Favorites';

    return Scaffold(
      appBar: AppBar(title: Text(selectedPageTitle)),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
