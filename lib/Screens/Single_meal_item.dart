import 'package:delivery_app/Screens/cart_screen.dart';
import 'package:delivery_app/models/meal.dart';
import 'package:delivery_app/models/reivew.dart';
import 'package:delivery_app/widgets/Reivew_meal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:delivery_app/providers/cartProviders.dart';

class SingleMealItem extends ConsumerWidget {
  final Meal meal;

  const SingleMealItem({Key? key, required this.meal}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Review> mealReviews = getReviewsForMeal(meal.id);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Theme.of(context).colorScheme.onPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_bag_outlined,
                color: Theme.of(context).colorScheme.onPrimary),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CartScreen(),
                ),
              );
            },
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
      ),
      //This widget allows the content to scroll if it overflows the screen.
      body: SingleChildScrollView(
        //Column arranges the content vertically
        //this cilumn will hold the img,title ,price
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              meal.imageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    meal.title,
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '\$${meal.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),

                  const SizedBox(height: 8),
                  const SizedBox(height: 16),

                  //Row widget to display the content vertically
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.inversePrimary,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          onPressed: () {
                            ref.read(cartProvider.notifier).addItem(meal);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('${meal.title} added to cart')),
                            );
                          },
                          child: Text(
                            'Add To Bag',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  //Manages the state of the tab bar and its corresponding
                  DefaultTabController(
                    // the length of the tabbar
                    length: 2,

                    child: Column(
                      children: [
                        //Shows "Food Details" and "Food Reviews section
                        const TabBar(
                          tabs: [
                            Tab(text: 'Food Details'),
                            Tab(text: 'Food Reviews'),
                          ],
                          labelColor: Colors.red,
                          unselectedLabelColor: Colors.grey,
                          indicatorColor: Colors.red,
                        ),

                        Container(
                          height: 200,
                          //In a TabBarView, the first tab's content is automatically associated with the first item in the children

                          child: TabBarView(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  meal.ingredients,
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              //if mealReviews is empty we will insert text otherwise we will display the reivew
                              mealReviews.isEmpty
                                  ? const Center(child: Text('No reviews yet'))
                                  : ListView.builder(
                                      itemCount: mealReviews.length,
                                      itemBuilder: (context, index) {
                                        return ReviewItem(
                                            review: mealReviews[index]);
                                      },
                                    )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //_buildInfoItem is widget that accept icon and text
                      _buildInfoItem(Icons.access_time, '12pm-3pm'),
                      _buildInfoItem(Icons.location_on, '3.5 km'),
                      _buildInfoItem(Icons.map, 'Map View'),
                      _buildInfoItem(Icons.delivery_dining, 'Delivery'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String text) {
    //column to set the items horizontaily icon then text
    return Column(
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(height: 4),
        Text(text, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}
