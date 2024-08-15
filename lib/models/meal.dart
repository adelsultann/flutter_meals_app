// ###---- why we use the Model #####----------

// Models (Category and Meal):
// These define the structure of your data with clear properties like id, title, image, etc. They separate the data structure from how it's displayed or used in the app.

// Using models makes your code more maintainable.
// If you need to add new properties to the data later

class Meal {
  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.rating,
    required this.numberOfRating,
    required this.price,
  });

  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final String ingredients;
  final double rating;
  final int numberOfRating;
  final double price;
}
