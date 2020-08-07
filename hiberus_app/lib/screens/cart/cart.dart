import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hiberusapp/constants.dart';
import 'package:hiberusapp/models/product.dart';
import 'package:hiberusapp/providers/product_provider.dart';
import 'package:hiberusapp/screens/cart/components/shopping_cart_page.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Product> products;
  ProductProvider _productProvider = ProductProvider.get();

  @override
  void initState() {
    load();
  }

  load() async {
    var result = await _productProvider.fechPorductsCart();
    setState(() {
      products = result;
    });
  }

    @override
    Widget build(BuildContext context) {
        return Scaffold (
            backgroundColor: Colors.white,
            appBar: _appBar(context),
            body: ShoppingCartPage(products: products),
        );
    }

    AppBar _appBar(BuildContext context) {
        return AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
                icon: SvgPicture.asset("assets/icons/back.svg", color: kTextColor,),
                onPressed: () {
                    Navigator.pop(context);
                }),
            actions: <Widget>[
              IconButton(
                icon: SvgPicture.asset("assets/icons/cart.svg", color: Colors.white),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
                },
              )
            ]
        );
    }
}