import 'package:flutter/material.dart';
import 'package:hiberusapp/components/categories.dart';
import 'package:hiberusapp/components/item_card.dart';
import 'package:hiberusapp/constants.dart';
import 'package:hiberusapp/models/Product.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
            Padding(
               padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin),
               child: Text(
                   "Women",
                   style: Theme.of(context)
                       .textTheme
                       .headline
                       .copyWith(fontWeight: FontWeight.bold)
                )
            ),
            Categories(),
            Expanded(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: kDefaultPaddin,
                            crossAxisSpacing: kDefaultPaddin,
                            childAspectRatio: 0.75
                        ),
                        itemCount: products.length,
                        itemBuilder: (context, index)  =>  ItemCard(product: products[index])
                    )
                ),
            )
       ],
    );
  }
}

