import 'package:delivery_app/widgets/BottomNavBarWidget.dart';
import 'package:delivery_app/widgets/CategoryItems.dart';
import 'package:delivery_app/widgets/SearchWidgets.dart';
import 'package:delivery_app/widgets/dailydeal.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //Scaffold Provides many widgets we use it to implements the basic material design visual layouts
    return Scaffold(
      // it display horizantal bar which mainly placed at the top of the Scafflod AppBar has a lot of Properties  like actions title Etc
      appBar: AppBar(
        // Use the primary color from the theme
        backgroundColor: Theme.of(context).colorScheme.background,
        //this property is used to set the z-coordinate which place this app bar relative to its parents
        // A higher value will produce a more prominent shadow
        elevation: 0,

        title: Text(
          "Delivery App",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                // Use the onPrimary color for text on primary background
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
      ),
      // Use the background color from the theme
      backgroundColor: Theme.of(context).colorScheme.surface,
      //body is property and is The primary content of the scaffold.
      //SingleChildScrollView A box in which a single widget can be scrolled vertically
      // it accept widget as child
      body: SingleChildScrollView(
        //Arranges child widgets vertically within a single column.
        child: Column(
          //<Widget> define a list of child widgets within a parent widget
          children: <Widget>[
            //SearchWidget A custom widget that show the searchbar
            const SearchWidget(),
            //SizedBox class: Adds a vertical space of 15 pixels
            const SizedBox(
              height: 15,
            ),
            // custome class that show the Categories
            Categoryitems(),

            // custome class that show the daily meal
            Dailydeal(),
            //SizedBox class: Adds a vertical space of 15 pixel
            const SizedBox(
              height: 25,
            ),

            BottomNavBarWidget()
          ],
        ),
      ),
    );
  }
}
