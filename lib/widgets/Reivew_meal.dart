import 'package:delivery_app/models/reivew.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReviewItem extends StatelessWidget {
  final Review review;

  const ReviewItem({
    super.key,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    //Card is widget for creating visually appeling and organized content
    return Card(
      color: Theme.of(context).colorScheme.inversePrimary,
      // These are the CCard peoperties like elevation to add shadow, margin
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      //the child here accept widget we use Padding to add padding to all its children
      child: Padding(
        padding: const EdgeInsets.all(11),
        // Column to orgnize the its children horizantaliy
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //we create Row as childern to add the usernam and rating
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Expanded Its purpose is to ensure that the username text takes up as much horizontal
                Expanded(
                  child: Text(
                    review.userName,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.onPrimary),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                //why it is the _buildRatingStars widget not function
                //it has direct access to the widget properties
                //in this way it has acces to the buildcontext
                // the underscore makes it as private
                _buildRatingStars(review.rating),
              ],
            ),
            const SizedBox(height: 8),
            Text(review.comment,
                style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).colorScheme.onPrimary)),
            const SizedBox(height: 8),
            Text(
              DateFormat('MMMM d, y').format(review.date),
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingStars(double rating) {
    return Row(
      //List.generate(5, ...) creates a list of 5 items, representing the 5 stars
      children: List.generate(5, (index) {
        return Icon(
          //For each star, it checks if the index is less than the floor of the rating
          //If true, it shows a filled star (Icons.star)
          // if false show an empty star
          index < rating.floor() ? Icons.star : Icons.star_border,
          // all startswill be same color and font 18 the different is the fill
          color: Colors.amber,
          size: 18,
        );
      }),
    );
  }
}
