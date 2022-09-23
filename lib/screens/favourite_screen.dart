import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {

  final favouriteMeals;
  const FavouriteScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Center(
        child: Text("You don't have favourite meals !"),
      );
    }
    else
    {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favouriteMeals[index].id,
            imageUrl: favouriteMeals[index].imageUrl,
            title: favouriteMeals[index].title,
            affordability: favouriteMeals[index].affordability,
            complexity: favouriteMeals[index].complexity,
            duration: favouriteMeals[index].duration,
          );
        },
        itemCount: favouriteMeals.length,
      );
    }
  }
}
