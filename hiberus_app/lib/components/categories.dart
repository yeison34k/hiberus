import 'package:flutter/material.dart';
import 'package:hiberusapp/constants.dart';

class Categories extends StatefulWidget {
    @override
    _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
    List<String> categories = ["Hand Bag", "Jewellery", "Footwear", "Dresses"];
    int selectedIndex = 0;
    @override
    Widget build(BuildContext context) {
        return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: SizedBox(
                height: 25,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) => buildCategory(index)),
            ),
        );
    }

    Widget buildCategory(int index) {
        return GestureDetector(
            onTap: () {
                setState(() {
                    selectedIndex = index;
                });
            },
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                        Text(categories[index], style: TextStyle(fontWeight: FontWeight.bold)),
                        Container(
                            margin: EdgeInsets.only(top: kDefaultPaddin / 4 ),
                            height: 2,
                            width: 30,
                            color: selectedIndex == index ? Colors.black : Colors.transparent
                        )
                    ],
                )
            )
        );
    }
}