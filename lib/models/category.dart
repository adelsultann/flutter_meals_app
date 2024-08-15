// ###---- why we use the Model #####----------

// Models (Category and Meal):
// These define the structure of your data with clear properties like id, title, image, etc. They separate the data structure from how it's displayed or used in the app.

// Using models makes your code more maintainable.
// If you need to add new properties to the data later

//
class Category {
  const Category({
    required this.id,
    required this.title,
    required this.image,
  });

  final String id;
  final String title;
  final String image;
}
