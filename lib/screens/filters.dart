import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meals/widgets/switch_list_item.dart';
// import 'package:meals/screens/tabs.dart';
// import 'package:meals/widgets/main_drawer.dart';

enum Filter {
  glutenFree,
  lactose,
  vegetarian,
  vegan,
}
class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {

  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFreeFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet = widget.currentFilters[Filter.lactose]!;
    _vegetarianFreeFilterSet = widget.currentFilters[Filter.vegetarian]!;
    _veganFilterSet = widget.currentFilters[Filter.vegan]!;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: MainDrawer(onSelectScreen: onSelectScreen),
      appBar: AppBar(title: const Text('Your Filters')),

      // drawer:MainDrawer(onSelectScreen: (identifier){
      //   if(identifier == 'meals'){
      //     Navigator.of(context)
      //       .push(
      //         MaterialPageRoute(
      //           builder: (ctx) => const TabsScreen(),
      //         ),
      //       );
      //   }
      // }),
  
      body: PopScope(
        
        canPop: false,
        
        onPopInvokedWithResult: (bool didPop, dynamic result) {
  
          if(didPop) return;

          Navigator.of(context).pop({
              Filter.glutenFree: _glutenFreeFilterSet,
        
              Filter.lactose: _lactoseFreeFilterSet,
        
              Filter.vegetarian: _vegetarianFreeFilterSet,
        
              Filter.vegan: _veganFilterSet,
          });
          
        },

        child: Column(
          children: [

            CustomSwitchListItem(
              title: 'Gluten-free',
              subtitle: 'Only include gluten-free meals',
              value: _glutenFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFreeFilterSet = isChecked;
                });
              },
            ),

            CustomSwitchListItem(
              title: 'Lactose-free',
              subtitle: 'Only include Lactose-free meals',
              value: _lactoseFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeFilterSet = isChecked;
                });
              },
            ),

            CustomSwitchListItem(
              title: 'Vegetarian',
              subtitle: 'Only include Vegetarian meals',
              value: _vegetarianFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _vegetarianFreeFilterSet = isChecked;
                });
              },
            ),

            CustomSwitchListItem(
              title: 'Vegan',
              subtitle: 'Only include Vegan meals',
              value: _veganFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _veganFilterSet = isChecked;
                });
              },
            ),

            // SwitchListTile(value: _glutenFreeFilterSet,
            // onChanged: (isChecked) {
            //   setState(() {
            //     _glutenFreeFilterSet = isChecked;
            //   });
            // },
            // title: Text(
            //     'Gluten-free',
            //     style: Theme.of(context).textTheme.titleLarge!.copyWith(
            //       color: Theme.of(context).colorScheme.onSurface,
            //     ),
            //   ),
            // subtitle: Text(
            //     'Only include gluten-free meals.',
            //     style: Theme.of(context).textTheme.labelMedium!.copyWith(
            //       color: Theme.of(context).colorScheme.onSurface,
            //     ),
            //   ),
            // activeThumbColor: Theme.of(context).colorScheme.tertiary,
            // contentPadding: const EdgeInsets.only(left: 34, right: 22),
            // ),

          ],
        ),
      ),
    );
  }
}
