import 'package:flutter/material.dart';

//StatelessWidget indicate that the widget dose not maintain any state

class SearchWidget extends StatelessWidget {
  const SearchWidget(
      {
      //super.key is a concise syntax introduced in Dart 2.17 to forward the key parameter to the superclass constructor in Flutter widgets.
      super.key,
      this.onSearch,
      this.onSort});

  final Function(String)? onSearch;
  final VoidCallback? onSort;

  @override
  //BuildContext context method of SearchWidget

  Widget build(BuildContext context) {
    // padding A widget that insets its child by the given padding.
    return Padding(
      //EdgeInsets, the class that is used to describe the padding dimensions.
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),

      // child is widgets witin padding
      //Container is class is is like box to store content
      // it has proerty of child which can store any widget
      //it asscept a lot of property like margin,decoration, height,alignment

      // this child is the Padding child
      child: Container(
        // this is the search bar and it's configuration
        //decoration is used to decorate the box ex give border

        decoration: BoxDecoration(
          //color: This property takes in the Color class
          color: Theme.of(context).colorScheme.primary,
          //borderRadius is property of BoxDecotation
          borderRadius: BorderRadius.circular(25),
          //boxShadow is property of BoxDecotation
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        // this child is the Container child
        //TextField widget to get input from user

        child: TextField(
          onChanged: onSearch,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "What would you like to eat?",

            hintStyle: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary, fontSize: 16),
            // icon at the begnning
            prefixIcon: Icon(Icons.search,
                color: Theme.of(context).colorScheme.onPrimary),
            // icon at the end
            suffixIcon: IconButton(
              icon: Icon(Icons.sort,
                  color: Theme.of(context).colorScheme.onPrimary),
              onPressed: onSort,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          ),
          //style is property of TextField
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
