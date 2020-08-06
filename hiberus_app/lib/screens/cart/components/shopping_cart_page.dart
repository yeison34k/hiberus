import 'package:flutter/material.dart';
import 'package:hiberusapp/models/product.dart';
import 'package:hiberusapp/providers/product_provider.dart';
import 'package:hiberusapp/screens/payment/payment.dart';
import 'package:hiberusapp/styles/light_color.dart';
import 'package:hiberusapp/styles/theme.dart';
import 'package:hiberusapp/widget/title_text.dart';


class ShoppingCartPage extends StatefulWidget {
  final List<Product> products;

  ShoppingCartPage({Key key, this.products}) : super(key: key);

  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  ProductProvider _productProvider = ProductProvider.get();

  Widget _cartItems() {
    if (widget.products != null)
      return Column(children: widget.products
        .asMap()
        .entries
        .map((x) {
        return _item(x.value, x.key);
      }).toList());


    return Column();
  }

  void removeProduct(id, index) {
    setState(() {
      _productProvider.removeProduct(id);
      widget.products.removeAt(index);
    });
  }

  Widget _item(Product model, int index) {
    return Column(
        children: <Widget>[
          Container(
            height: 80,
            child: Row(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1.2,
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          height: 70,
                          width: 70,
                          child: Stack(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: LightColor.lightGrey,
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        bottom: 0,
                        child: Image.asset(model.image, width: 64),
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: ListTile(
                        title: TitleText(
                          text: model.title,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                        subtitle: Row(
                          children: <Widget>[
                            TitleText(
                              text: '\$ ',
                              color: LightColor.red,
                              fontSize: 12,
                            ),
                            TitleText(
                              text: (model.price * model.total).toString(),
                              fontSize: 14,
                            ),
                          ],
                        ),
                        trailing: Wrap(
                          spacing: 3,
                          children: <Widget>[
                            Container(
                              width: 35,
                              height: 35,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: LightColor.lightGrey.withAlpha(150),
                                borderRadius: BorderRadius.circular(10)),
                              child: TitleText(
                                text: 'x${model.total}',
                                fontSize: 12,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                removeProduct(model.id, index);
                              },
                              child: Container(
                                width: 35,
                                height: 35,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: LightColor.lightGrey.withAlpha(150),
                                  borderRadius: BorderRadius.circular(10)),
                                child: Icon(Icons.delete_forever, color: Colors.red,),
                              ),
                            )
                          ],
                        )
                    )
                )
              ],
            ),
          ),
        ],
    );
  }

  Widget _price() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        TitleText(
          text: '${getTotalItems()} Items',
          color: LightColor.grey,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        TitleText(
          text: '\$${getPrice()}',
          fontSize: 18,
        ),
      ],
    );
  }

  Widget _submitButton(BuildContext context) {
    return FlatButton(
        onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentPage()));
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: LightColor.orange,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 12),
          width: AppTheme.fullWidth(context) * .7,
          child: TitleText(
            text: 'Next',
            color: LightColor.background,
            fontWeight: FontWeight.w500,
          ),
        ));
  }

  double getPrice() {
    double price = 0;
    if(widget.products!= null)
      widget.products.forEach((x) {
        price += x.price * x.total;
      });
    return price;
  }

  int getTotalItems() {
    int totalItems = 0;
    if(widget.products!= null)
      widget.products.forEach((x) {
        totalItems +=  x.total;
      });
    return totalItems;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppTheme.padding,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _cartItems(),
            Divider(
              thickness: 1,
              height: 70,
            ),
            _price(),
            SizedBox(height: 30),
            _submitButton(context),
          ],
        ),
      ),
    );
  }
}
