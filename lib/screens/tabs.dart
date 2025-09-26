import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState(){
    return _TabsScreenState();
  }  
}

class _TabsScreenState extends State<TabsScreen>{
  int _selectedPageIndex = 0;
  
  final List<Meal> _favoriteMeals = [];

  void _showInfoMessage(String message){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _toggleFavoriteStatus(Meal meal){
    final isExisting = _favoriteMeals.contains(meal);

    if(isExisting){
      setState(() {
        _favoriteMeals.remove(meal);
        _showInfoMessage('Meal removed from favorites!');
      });
    } else {
      setState(() {
        _favoriteMeals.add(meal);
        _showInfoMessage('Meal has marked a favorites!');
      });
    }
  }

  void _selectedPage(int index){
    setState(() {
      _selectedPageIndex = index;
      if(_selectedPageIndex == 1){
        
      }
    });
  }

  void _setScreen(String identifier){
    Navigator.of(context).pop();
    if(identifier == 'meals'){
      setState(() {
        _selectedPageIndex = 0;
      });
    }
    if(identifier == 'filters'){
      setState(() {
        //_selectedPageIndex = 1;
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const FiltersScreen()));
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
  
    Widget activePage =  CategoriesScreens(onToggleFavorite: _toggleFavoriteStatus,);
    var activePageTitle = 'Categories';
    if(_selectedPageIndex == 1){
      activePage = MealsScreen( meals: _favoriteMeals, onToggleFavorite: _toggleFavoriteStatus);
      activePageTitle = 'Your Favorites';
    }

    return  Scaffold(
      
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: activePage,
      
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        currentIndex: _selectedPageIndex,
        items: const [
      
          BottomNavigationBarItem(
            
            icon: Icon(Icons.set_meal),
            label: 'Meals',
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