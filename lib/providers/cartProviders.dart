// lib/providers/cart_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:delivery_app/models/meal.dart';

//CartItem is a class representing an item in the cart, containing a meal and its quantity.

class CartItem {
  final Meal meal;
  int quantity;

  CartItem({required this.meal, this.quantity = 1});
}

//CartNotifier extends StateNotifier, which is a Riverpod class for managing mutable state.
class CartNotifier extends
// [CartItem(meal: Meal(id: 'm1', name: 'Pizza', price: 10.0), quantity: 1)]
    StateNotifier<List<CartItem>> {
  // we initializesd the class with the empty list we define in the Cartitem
//The constructor initializes the state with an empty list.
  CartNotifier() : super([]);

  void addItem(Meal meal) {
    //The state is a list of CartItem objects.
    // state is property of the StateNotifer it contain the empty list at the initalization

// this line searches current cart for an item with the same ID as the meal we trying to add
//note If not found, existingIndex will be -1.
    final existingIndex = state.indexWhere((item) => item.meal.id == meal.id);
    print(existingIndex);
    //check if the items already on the cart
    if (existingIndex >= 0) {
      state = [
        //if item in the cart we will increase the quantity by 1
        for (final item in state)
          if (item.meal.id == meal.id)
            CartItem(meal: item.meal, quantity: item.quantity + 1)
          //this else for all other items keep them as they are
          else
            item
      ];
    } else {
      //if the items dosen't exist in the cart
      //this create new list that including all items ...state + the new Cartitem
      state = [...state, CartItem(meal: meal)];
    }
  }

  void removeItem(String mealId) {
    state = state.where((item) => item.meal.id != mealId).toList();
  }

  void updateQuantity(String mealId, int delta) {
    //This creates a new list (maintaining immutability).
    state = [
      // iterates through all items that matches our mealId,
      for (final item in state)
        // if its find match
        if (item.meal.id == mealId)
          // create new Cartitem with the quantity adjusted by delta
          CartItem(meal: item.meal, quantity: item.quantity + delta)
        else
          //For all other items, it keeps them as they are.
          item
    ];
    //Removing items with zero or negative quantity
    state = state.where((item) => item.quantity > 0).toList();
  }

  double get totalAmount {
    return state.fold(
        0, (sum, item) => sum + (item.meal.price * item.quantity));
  }
}
//Creating a StateNotifierProvider offers several important benefits in your Flutter app:
//Centralized State Management | provides a single, centralized place to manage your cart items state.
//Easy Access Across the App

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>((ref) {
  return CartNotifier();
});
