import 'package:delivery_app/models/meal.dart';

import '../models/category.dart';

// ###---- why we use Dummy data #####----------

// Dummy data allows you to write unit tests for your widgets and logic without relying on external data sources
//Using dummy data lets you start designing your UI and functionality early on without waiting for a backend to be implemented

final List<Category> categories = [
  const Category(
    id: 'c1',
    title: 'Saudi Cuisine',
    image: 'assets/images/category/saudiFood.png',
  ),
  const Category(
    id: 'c2',
    title: 'Fast Food',
    image: 'assets/images/category/fastfood.png',
  ),
  const Category(
    id: 'c3',
    title: 'Italian Cuisine',
    image: 'assets/images/category/italianFood.png',
  ),
  const Category(
    id: 'c4',
    title: 'Drinks',
    image: 'assets/images/category/drinks.png',
  ),
  const Category(
    id: 'c5',
    title: 'Dessert',
    image: 'assets/images/category/dessert.png',
  )
];

final List<Meal> dummyMeals = [
  const Meal(
    id: 'm1',
    categories: ['c1'],
    title: 'Spaghetti Carbonara',
    imageUrl: 'assets/images/daily_meal/Espaguetis_carbonara.jpg',
    ingredients: 'Pasta, Eggs, Pecorino cheese, Guanciale, Black pepper',
    rating: 4.7,
    numberOfRating: 128,
    price: 12.99,
  ),
  const Meal(
    id: 'm2',
    categories: ['c1'],
    title: 'Kabsa',
    imageUrl: 'assets/images/daily_meal/Kabsa.jpg',
    ingredients:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when to make a type specimen book",
    rating: 4.5,
    numberOfRating: 256,
    price: 10.99,
  ),
  const Meal(
    id: 'm3',
    categories: ['c1'],
    title: 'Jarish SaudiCuisine',
    imageUrl: 'assets/images/daily_meal/Jarish_SaudiCuisine.JPG',
    ingredients: 'Chicken, Yogurt, Tomato sauce, Cream, Spices',
    rating: 4.8,
    numberOfRating: 192,
    price: 14.99,
  ),
  const Meal(
    id: 'm4',
    categories: ['c3'],
    title: 'Caesar Salad',
    imageUrl: 'assets/images/daily_meal/Caeser.jpg',
    ingredients: 'Romaine lettuce, Croutons, Parmesan cheese, Caesar dressing',
    rating: 4.3,
    numberOfRating: 87,
    price: 8.99,
  ),
  const Meal(
    id: 'm5',
    categories: [
      'c2',
    ],
    title: 'Beef Burger',
    imageUrl: 'assets/images/daily_meal/burger.jpg',
    ingredients: 'Beef patty, Bun, Cheese, Lettuce, Tomato, Onion, Pickles',
    rating: 4.6,
    numberOfRating: 301,
    price: 11.99,
  ),
  const Meal(
    id: 'm6',
    categories: ['c2'],
    title: 'Sushi Roll Platter',
    imageUrl: 'assets/images/daily_meal/sushi.jpg',
    ingredients: 'Rice, Nori, Salmon, Tuna, Avocado, Cucumber',
    rating: 4.9,
    numberOfRating: 178,
    price: 22.99,
  ),
  const Meal(
    id: 'm7',
    categories: ['c4'],
    title: 'Coca Cola Zero ',
    imageUrl: 'assets/images/daily_meal/Caffeine_Free_Coca-Cola_Zero.jpg',
    ingredients: 'Rice noodles, Shrimp, Tofu, Eggs, Peanuts, Bean sprouts',
    rating: 4.5,
    numberOfRating: 145,
    price: 13.99,
  ),
  const Meal(
    id: 'm8',
    categories: [
      'c3',
    ],
    title: 'Greek Salad',
    imageUrl: 'assets/images/daily_meal/salad.jpg',
    ingredients: 'Tomatoes, Cucumbers, Onion, Feta cheese, Olives, Olive oil',
    rating: 4.4,
    numberOfRating: 112,
    price: 9.99,
  ),
];
