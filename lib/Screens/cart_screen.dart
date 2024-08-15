import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:delivery_app/providers/cartProviders.dart';

class CartScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //This line uses Riverpod's watch method to listen for changes in the
    //cartProvide || whenever the value sotred in cartProvider change the
    //widget will be rebuild | it watch the state
    final cartItems = ref.watch(cartProvider);
    // provides access to methods for addin or removing
    //read is usefuel when you need to perform actions that modify the
    //cart content such as add,delete
    final cartNotifier = ref.read(cartProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: cartItems.isEmpty
          ? const Center(child: Text('Your cart is empty'))
          : ListView.builder(
              //we add +1 to the itemCount in ListView so that we can render the
              //total ammount suppose cartItems.length is 3 that means itemcount is 4
              // the item builder will call the _buildCartItem then we add + 1
              //so the index < cartItems.length will be false then will go to the else
              // to show the totalamount
              itemCount: cartItems.length + 1, // +1 for the total amount row
              itemBuilder: (context, index) {
                if (index < cartItems.length) {
                  return _buildCartItem(
                      context, cartItems[index], cartNotifier);
                } else {
                  return _buildTotalAmount(context, cartNotifier.totalAmount);
                }
              },
            ),
      bottomNavigationBar: cartItems.isEmpty
          ? null
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  // TODO: Implement checkout functionality
                },
                child: const Text(
                  'Proceed to Checkout',
                ),
              ),
            ),
    );
  }

  Widget _buildCartItem(
      BuildContext context, CartItem item, CartNotifier cartNotifier) {
    return Card(
      margin: const EdgeInsets.all(3),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Image.asset(
              item.meal.imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16),
            // Expanded widget tells its child to take up as much space as possible within the parent
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.meal.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimary,
                      )),
                  Text(
                    '\$${item.meal.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () =>
                      cartNotifier.updateQuantity(item.meal.id, -1),
                ),
                Text('${item.quantity}'),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => cartNotifier.updateQuantity(item.meal.id, 1),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTotalAmount(BuildContext context, double totalAmount) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Total Amount:',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          Text('\$${totalAmount.toStringAsFixed(2)}',
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ],
      ),
    );
  }
}
