import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  final Function toggleFavorite;
  final Function mealFavorite;

  MealDetailScreen(this.toggleFavorite, this.mealFavorite);

  Widget buildSectionTitle(BuildContext ctx, String title) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(title, style: Theme.of(ctx).textTheme.headline6));
  }

  Widget buildContainer(BuildContext ctx, Widget child) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 2, color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 200,
        width: 300,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 300,
                width: double.infinity,
                child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover)),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
                context,
                ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Card(
                        color: Theme.of(context).accentColor,
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Text(selectedMeal.ingredients[index])));
                  },
                  itemCount: selectedMeal.ingredients.length,
                )),
            buildSectionTitle(context, 'Steps to make'),
            buildContainer(
                context,
                ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Column(children: [
                      ListTile(
                          leading: CircleAvatar(child: Text('# ${index + 1}')),
                          title: Text(selectedMeal.steps[index])),
                      Divider()
                    ]);
                  },
                  itemCount: selectedMeal.steps.length,
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          mealFavorite(mealId) ? Icons.favorite : Icons.favorite_border,
          color: Colors.white,
        ),
        onPressed: () {
          toggleFavorite(mealId);
        },
      ),
    );
  }
}
