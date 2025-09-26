import 'package:flutter/material.dart';

import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meals, required this.onToggleFavorite});

  final String? title;
  final List<Meal> meals;
  final Function(Meal meal)? onToggleFavorite;

  void selectMeal(BuildContext context, meal){
    //Navigator.push( MaterialPageRoute(builder: (ctx) => MealsDetailsScreen(meal: meal)));
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => MealsDetailsScreen(meal: meal, onToggleFavorite: onToggleFavorite)));
  }


  @override
  Widget build(BuildContext context) {
    Widget content =  Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            Text('Uh oh ... nothing here!',style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),),
            const SizedBox(height: 16),
            Text('Try selecting a different category!', style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),),
          ],
        ),
      );

    if (meals.isNotEmpty) {

      content = ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) => MealItem(
            meal: meals[index], 
            onSelectMeal: (meal){
              selectMeal(context, meal);
            },
          ), 
        );
    }

    /*
    itemBuilder: (ctx, index) {
            return Text(meals[index].title, style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ) );
          }
    */ 
    
    if(title == null){
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content
      );
  
  }
}