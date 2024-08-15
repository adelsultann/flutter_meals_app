import 'package:delivery_app/Screens/Single_meal_item.dart';
import 'package:delivery_app/models/meal.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../data/dummy_data.dart'; // Make sure this path is correct

class Dailydeal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Column widget used to lay its childern vertically
    // some of Column properties |MainAxisAlignment |CrossAxisAlignment|List<Widget> children
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // padding A widget that insets its child by the given padding.
        Padding(
          //EdgeInsets, the class that is used to describe the padding dimensions.
          padding: const EdgeInsets.all(16.0),
          // the Padding has child which will display the text
          child: Text(
            "Daily Deals",
            style: DefaultTextStyle.of(context).style.apply(
                fontSizeFactor: 2.0,
                color: Theme.of(context).colorScheme.onPrimary),
          ),
        ),

        //CarouselSlider create img slider
        //Properties of CarouselSlider | items,autoplay aspectRatio
        CarouselSlider.builder(
          //set the number of items based on dumyMeals.length
          itemCount: dummyMeals.length,
          //build each carousel item with provided Meal
          itemBuilder: (BuildContext context, int index, int realIndex) {
            Meal meal = dummyMeals[index];
            //we added the context here to access and get information about the widget position
            return _buildCarouselItem(context, meal);
          },
          // options allow us to defins various properties of the carousel behavior
          options: CarouselOptions(
            height: 300,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            //make the center item slightly larger
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }

  Widget _buildCarouselItem(BuildContext context, Meal meal) {
    //GestureDetector: Makes the item tappable
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SingleMealItem(meal: meal),
          ),
        );
      },
      //Container is class is is like box to store conten
      child: Container(
        // margin is properity of Container
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.primary,
              offset: const Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
        ),

        //ClipRRect widget to clips its child using rounded rectangle
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          //Stack Overlays child widgets on top of each other within the item:
          child: Stack(
            children: <Widget>[
              Image.asset(
                meal.imageUrl,
                height: 300.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              //positioned the img
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.9),
                        Colors.transparent
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  //Column widget used to lay its childern vertically
                  // some of Column properties |MainAxisAlignment |
                  //this column has two child widget of Row
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        meal.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),

                      //Row widget to display the content vertically
                      Row(
                        //spaceBetween to seprate the two Row
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //has its own children as well Text
                        children: <Widget>[
                          Text(
                            '\$${meal.price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              const Icon(Icons.star,
                                  color: Colors.yellow, size: 16),
                              Text(
                                ' ${meal.rating.toString()}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
