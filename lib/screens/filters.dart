import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {

  var _glutenFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      drawer: MainDrawer(onSelectScreen: onSelectScreen),
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body:  Center(
        child: Column(
          children: [
            SwitchListTile(value: _glutenFree, 
            onChanged: (isCheck) {
              setState(() {
                _glutenFree = isCheck;
              });
            }, 
            title: Text(
                'Gluten-free', 
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            subtitle: Text(
                'Only include gluten-free meals.', 
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            activeThumbColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            
          ],
        ),
      ),
    );
  }
}