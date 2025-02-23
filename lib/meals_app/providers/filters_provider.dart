import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lam_quen_flutter/meals_app/providers/meals_provider.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false
        });

  void setFilters(Map<Filter, bool> chosenFilters) {
    if (state == chosenFilters) return; // Tránh update nếu giống nhau
    state = {...chosenFilters};
  }

  void setFilter(Filter filter, bool isActive) {
    if (state[filter] == isActive) return; // Tránh update nếu không có thay đổi
    state = {...state}..[filter] = isActive;
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
  (ref) => FiltersNotifier(),
);

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);

  return meals.where((meal) {
    return {
      Filter.glutenFree: meal.isGlutenFree,
      Filter.lactoseFree: meal.isLactoseFree,
      Filter.vegetarian: meal.isVegetarian,
      Filter.vegan: meal.isVegan
    }.entries.every((filter) => !activeFilters[filter.key]! || filter.value);
  }).toList();
});
