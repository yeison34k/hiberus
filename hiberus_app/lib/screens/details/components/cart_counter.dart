import 'package:flutter/material.dart';
import 'package:hiberusapp/constants.dart';

class CartCounter extends StatefulWidget {
    @override
    _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
    int numItems = 0;

    @override
    Widget build(BuildContext context) {
        return Row(
            children: <Widget>[
                buildOutlineButton(Icon(Icons.remove) , () {
                    setState(() {
                        if(numItems> 0)
                            numItems--;
                    });
                }),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin / 2),
                    child: Text(
                        numItems.toString().padLeft(2, "0"),
                        style: Theme.of(context).textTheme.headline),
                ),
                buildOutlineButton(Icon(Icons.add) , () {
                    setState(() {
                        numItems++;
                    });
                })
            ],
        );
    }


    SizedBox buildOutlineButton(Icon icon, Function press ) {
        return SizedBox(
            width: 40,
            height: 33,
            child: OutlineButton(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                child: icon,
                onPressed: press,
            ),
        );
    }
}