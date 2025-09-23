import 'package:flutter/material.dart';
import 'package:meals/models/category.dart' as model;

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key, required this.category, required this.onSelectCategory});

  final model.Category category;
  final void Function() onSelectCategory;
  @override
  Widget build(BuildContext context) {
    return InkWell( 
      onTap: onSelectCategory,
      splashColor: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(15),
      child: Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            category.color.withValues(alpha: 0.55),
            category.color.withValues(alpha: 0.91),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        category.title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    )
    );
  }
}
