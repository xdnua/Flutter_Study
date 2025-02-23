import 'package:flutter/material.dart';
import 'package:lam_quen_flutter/meals_app/models/meal.dart';
import 'package:lam_quen_flutter/meals_app/screens/meal_details_screen.dart';
import 'package:lam_quen_flutter/meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meals});

  final String? title;
  final List<Meal> meals;

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) => MealDetailsScreen(meal: meal)),
    );
  }

  Widget _buildEmptyContent(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh ... nothing here!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            'Try selecting a different category!',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final content = meals.isEmpty
        ? _buildEmptyContent(context)
        : ListView.builder(
            itemCount: meals.length,
            itemBuilder: (ctx, index) => MealItem(
              meal: meals[index],
              onSelectMeal: (meal) => _selectMeal(context, meal),
            ),
          );

    return title == null
        ? content
        : Scaffold(
            appBar: AppBar(title: Text(title!)),
            body: content,
          );
  }
}
