import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hiberusapp/constants.dart';
import 'package:hiberusapp/models/product.dart';
import 'package:hiberusapp/providers/http.dart';
import 'package:hiberusapp/providers/product_provider.dart';
import 'package:hiberusapp/screens/bill/bill.dart';
import 'package:hiberusapp/styles/light_color.dart';
import 'package:hiberusapp/styles/theme.dart';
import 'package:hiberusapp/widget/title_text.dart';


class PaymentPage extends StatefulWidget {
  PaymentPage({Key key, this.title}) : super(key: key);

    final String title;

    @override
    _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
    String paymentMethodValue = "Credit card";
    List<Product> products;
    HttpProvider httpProvider = HttpProvider.get();
    ProductProvider productProvider = ProductProvider.get();

    final ipController = TextEditingController();
    final clientIdController = TextEditingController();
    final directionController = TextEditingController();
    final phoneController = TextEditingController();
    final identityController = TextEditingController();
    final nameController = TextEditingController();
    final payMethodController = TextEditingController();

    loadProducts() async {
      var response = await productProvider.fechPorductsCart();
      products = response;
    }

    @override
    void initState() {
      ipController.text = "192.168.1.2"; //default value
      loadProducts();
    }

    @override
    void dispose() {
      // Limpia el controlador cuando el Widget se descarte
      ipController.dispose();
      clientIdController.dispose();
      directionController.dispose();
      phoneController.dispose();
      identityController.dispose();
      nameController.dispose();
      payMethodController.dispose();
      super.dispose();
    }

    Widget _entryField(String title, controller) {
        return Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                    Text(
                        title,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(
                        height: 10,
                    ),
                    TextField(
                      controller: controller,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Color(0xfff3f3f4),
                          filled: true))
                ],
            ),
        );
    }

    Widget _entryFieldDrop(String title, controller) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            SizedBox(
              height: 5,
            ),
            new DropdownButtonFormField<String>(
              value: paymentMethodValue,
              items: <String>['Credit card', 'Cash payment'].map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
              onChanged: (String newValue) {
                setState(() {
                  paymentMethodValue = newValue;
                });
              },
            ),
          ],
        ),
      );
    }

    mappingProducts() async {
      List<Map<String, dynamic>> productsResponse = new List();

      if(products != null)
        products.forEach((x) {
          if(x!= null) {
            Map<String, dynamic> row = {
              "id": x.id,
              "quantity": x.total,
              "cost": x.total * x.price
          };
          productsResponse.add(row);
        }
      });

      return productsResponse;
    }

    saveOrder() async {
      var producs = await mappingProducts();
      var dataRequest = Product.buidData(clientIdController.text,
        directionController.text, phoneController.text,
        identityController.text, nameController.text,
        paymentMethodValue, producs);

      var data = await httpProvider.guardar(ipController.text, dataRequest);
      Navigator.push(context, MaterialPageRoute(builder: (context) => BillPage(data: data)));
    }

    Widget _submitButton(BuildContext context) {
        return FlatButton(
            onPressed: () {
              saveOrder();
            },
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: LightColor.orange,
            child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 12),
                width: AppTheme.fullWidth(context) * .7,
                child: TitleText(
                    text: 'Payment',
                    color: LightColor.background,
                    fontWeight: FontWeight.w500,
                ),
            ));
    }

    Widget _emailPasswordWidget() {
        return Column(
            children: <Widget>[
              _entryField("Ip server", ipController),
              _entryField("Client id", clientIdController),
              _entryField("Direction", directionController),
              _entryField("Phone", phoneController),
              _entryField("Client identity", identityController),
              _entryField("Client name", nameController),
              _entryFieldDrop("Payment method", payMethodController),
            ],
        );
    }

    @override
    Widget build(BuildContext context) {
        final height = MediaQuery.of(context).size.height;
        return Scaffold(
            appBar: _appBar(context),
            body: Container(
                height: height,
                child: Stack(
                    children: <Widget>[
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: SingleChildScrollView(
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                        SizedBox(height: 10),
                                        _emailPasswordWidget(),
                                        SizedBox(height: 20),
                                        _submitButton(context),
                                    ],
                                ),
                            ),
                        ),
                    ],
                ),
            )
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
        );
    }
}