import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';


class MealsDetailsScreen extends StatelessWidget {
  const MealsDetailsScreen({super.key, required this.meal, required this.onToggleFavorite});

  final Meal meal;
  final Function(Meal meal)? onToggleFavorite;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        
        appBar: AppBar(
          title: Text(meal.title),
          actions: [
            IconButton(
              onPressed: () {
                onToggleFavorite?.call(meal);
              }, 
              icon: const Icon(Icons.star_border),
            ),
          ],
        ),
        
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(meal.imageUrl, height: 300, width: double.infinity, fit: BoxFit.cover),
              const SizedBox(height: 14),
              Text(
                'Ingredients',  style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onPrimary,),
              ),
              const SizedBox(height: 8),
              for(final ingredient in meal.ingredients) Text(ingredient, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onSurface,),),

              const SizedBox(height: 24),
              Text(
                'Steps',  style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onPrimary,),
              ),
              const SizedBox(height: 8),
              for(final steps in meal.steps) Text(steps, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onSurface,),),

              const SizedBox(height: 24),
              
              
            ],
          ),
        )
      );
  
  }
}