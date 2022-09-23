import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final saveFilters;
  final filters;
  const FiltersScreen(this.filters,this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;
  bool _isLactoseFree = false;

  @override
  initState(){
    _isGlutenFree = widget.filters['gluten'];
    _isVegan = widget.filters['vegan'];
    _isVegetarian = widget.filters['vegetarian'];
    _isLactoseFree = widget.filters['lactose'];
    super.initState();
  }

  Widget buildSwitchTile(
      String title, String subtitle, bool currentValue, updateValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: [
          IconButton(
            onPressed: (){
              final selectedFilters = {
                'gluten': _isGlutenFree,
                'lactose': _isLactoseFree,
                'vegan': _isVegan,
                'vegetarian': _isVegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust Your Meal Selection:",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchTile("Gluten-free",
                    "Only include Gluten-free meals.", _isGlutenFree, (newVal) {
                  setState(() {
                    _isGlutenFree = newVal;
                  });
                }),
                buildSwitchTile(
                    "Lactose-free",
                    "Only include Lactose-free meals.",
                    _isLactoseFree, (newVal) {
                  setState(() {
                    _isLactoseFree = newVal;
                  });
                }),
                buildSwitchTile("Vegan", "Only include Vegan meals.", _isVegan,
                    (newVal) {
                  setState(() {
                    _isVegan = newVal;
                  });
                }),
                buildSwitchTile("Vegetarian", "Only include Vegetarian meals.",
                    _isVegetarian, (newVal) {
                  setState(() {
                    _isVegetarian = newVal;
                  });
                }),
              ],
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
