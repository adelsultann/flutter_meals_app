import 'package:delivery_app/Screens/mealScreen.dart';
import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../widgets/SingleCategory.dart';
import '../models/category.dart';

class Categoryitems extends StatelessWidget {
  const Categoryitems({
    super.key,
  });

  void _selectCategory(BuildContext context, Category category) {
    //This variable stores the filtered list of meal based on selected category
    final filteredMeals = dummyMeals
        // this line filters the dummyMeals and check if its categories list contains the id of selected category
        .where((meal) => meal.categories.contains((category.id)))
        .toList();

    // this line use the Navigator to switch to new route which is the Mealscreen
    Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) => Mealscreen(meals: filteredMeals)));
    // print(filteredMeals);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      // utilize the LastView to iterate over the available Categories
      // list and create the ListTitle to each items
      //this child is the SizeBox child inside it all the widgets
      child: ListView.builder(
        // set the horizontal scrolling direction list
        scrollDirection: Axis.horizontal,
        // Sets the number of items to be built
        itemCount: categories.length,
        //itemBuilder is the call back function
        //context is the provided by the widget in the build Context
        itemBuilder: (context, index) {
          // inside the itembuilder we will create SingleCategory to each category
          return SingleCategory(
            category: categories[index],
            // selectedCategory here is property or Function as a Parameter
            // it will triggered when user taps on the SingleCategory
            // function to be called when tapped on category
            selectedCategory: () {
              _selectCategory(context, categories[index]);

              // print('Selected category: ${categories[index].title}');
            },
          );
        },
      ),
    );
  }
}
