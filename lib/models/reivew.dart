// lib/models/review.dart

class Review {
  final String id;
  final String mealId;
  final String userName;
  final double rating;
  final String comment;
  final DateTime date;

  Review({
    required this.id,
    required this.mealId,
    required this.userName,
    required this.rating,
    required this.comment,
    required this.date,
  });
}

final List<Review> dummyReviews = [
  Review(
    id: 'r1',
    mealId: 'm8',
    userName: 'John Doe',
    rating: 4.5,
    comment: 'Delicious! The carbonara was creamy and flavorful.',
    date: DateTime(2024, 3, 15),
  ),
  Review(
    id: 'r2',
    mealId: 'm1',
    userName: 'Jane Smith',
    rating: 4.0,
    comment: 'Good taste, but portion size was a bit small.',
    date: DateTime(2024, 3, 10),
  ),
  Review(
    id: 'r3',
    mealId: 'm2',
    userName: 'Mike Johnson',
    rating: 4.0,
    comment: "Best Kabsa I've ever had! Authentic and full of flavor.',",
    date: DateTime(2024, 3, 12),
  ),
  Review(
    id: 'r4',
    mealId: 'm3',
    userName: 'Sarah Lee',
    rating: 4.5,
    comment: 'Loved the Jarish! Great texture and taste.',
    date: DateTime(2024, 3, 8),
  ),
  // Add more reviews for other meals...
];

// Function to get reviews for a specific meal
List<Review> getReviewsForMeal(String mealId) {
  return dummyReviews.where((review) => review.mealId == mealId).toList();
}
