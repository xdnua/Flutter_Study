import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lam_quen_flutter/meals_app/providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    // Danh sách filter với tiêu đề và mô tả
    final filterOptions = [
      {
        'filter': Filter.glutenFree,
        'title': 'Gluten-Free',
        'subtitle': 'Only include gluten-free meals.',
      },
      {
        'filter': Filter.lactoseFree,
        'title': 'Lactose-Free',
        'subtitle': 'Only include lactose-free meals.',
      },
      {
        'filter': Filter.vegetarian,
        'title': 'Vegetarian',
        'subtitle': 'Only include vegetarian meals.',
      },
      {
        'filter': Filter.vegan,
        'title': 'Vegan',
        'subtitle': 'Only include vegan meals.',
      },
    ];

    Widget buildSwitchTile(Filter filter, String title, String subtitle) {
      return SwitchListTile(
        value: activeFilters[filter]!,
        onChanged: (value) {
          ref.read(filtersProvider.notifier).setFilter(filter, value);
        },
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
        activeColor: Theme.of(context).colorScheme.tertiary,
        contentPadding: const EdgeInsets.only(left: 34, right: 22),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),
      body: ListView(
        children: filterOptions
            .map((option) => buildSwitchTile(
                  option['filter'] as Filter,
                  option['title'] as String,
                  option['subtitle'] as String,
                ))
            .toList(),
      ),
    );
  }
}
