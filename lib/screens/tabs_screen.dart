import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import '../screens/categories_screen.dart';
import '../screens/favourite_screen.dart';

class TabsScreen extends StatefulWidget {
  final favouriteMeals;
  const TabsScreen(this.favouriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
   late List _pages;

   @override
   void initState(){
     _pages = [
       {
         'page' : CategoriesScreen(),
         'title' : 'Categories',
       },
       {
         'page' : FavouriteScreen(widget.favouriteMeals),
         'title' : 'Favourite',
       },
     ];
     super.initState();
   }

  int _selectedPageIndex = 0;

  void _selectPage(int value) {
    setState(() {
      _selectedPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favourite",
          ),
        ],
      ),
      body: _pages[_selectedPageIndex]['page'],
      drawer: MainDrawer(),
    );
  }
}