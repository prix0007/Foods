import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoritesMeal;
  const FavoriteScreen(this.favoritesMeal);

  @override
  Widget build(BuildContext context) {
    if (favoritesMeal.isEmpty) {
      return Container(
        child: Text('You have no favorites yet - start adding some'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoritesMeal[index].id,
            title: favoritesMeal[index].title,
            imageUrl: favoritesMeal[index].imageUrl,
            duration: favoritesMeal[index].duration,
            complexity: favoritesMeal[index].complexity,
            affordability: favoritesMeal[index].affordability,
          );
        },
        itemCount: favoritesMeal.length,
      );
    }
  }
}
