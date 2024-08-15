import 'package:flutter/material.dart';
import '../models/category.dart';

class SingleCategory extends StatelessWidget {
  const SingleCategory({
    Key? key,
    required this.category,
    required this.selectedCategory,
  }) : super(key: key);

//category is an instance og the Category we defined in the model
  final Category category;
// callback function when user taps on category
  final VoidCallback selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      //InkWell wraps a Container to create tappable area
      child: InkWell(
        onTap: selectedCategory,
        //Container is class is is like box to store content
        child: Container(
          //set the width and height for the Container
          width: 200,
          height: 80,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          //ClipRRect widget to clips its child using rounded rectangle
          // it has many Properties like child|clipBehaviour
          // this child is the container child
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            // stack widget is used to overlays child on top of each other
            // it has childern properties
            child: Stack(
              children: <Widget>[
                Image.asset(
                  category.image,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),

                //Overlays a black transparent
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                ),
                //Positions the category title text at the bottom center.
                Positioned(
                  bottom: 10,
                  left: 10,
                  right: 10,
                  child: Text(
                    category.title,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
