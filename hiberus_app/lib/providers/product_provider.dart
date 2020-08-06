import 'dart:async';
import 'dart:io';
import 'package:hiberusapp/models/product.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';


class ProductProvider {
    static final ProductProvider _productProvider = new ProductProvider();
    Database db;

    var readyCompleter = Completer();
    Future get ready => readyCompleter.future;


    ProductProvider(){
      init().then((_) {
        readyCompleter.complete();
      });
    }

    static ProductProvider get() {
        return _productProvider;
    }

    Future init() async {
        Directory documentDirectory = await getApplicationDocumentsDirectory();
        final path = join(documentDirectory.path, "PorductsCarts.db");
        this.db = await openDatabase(path, version: 1,
            onCreate: (Database newDb, int version) {
                createPorductsCart(newDb, version);
            });
    }

    void createPorductsCart(Database newDb, int version) {
        newDb.execute(""" 
        create table PorductsCart (
            id  integer primary key,
            title text,
            description text, 
            category text,        
            image text, 
            size int, 
            price double,
            total int
        );
        """);
    }

    Future<List<Product>> fechPorductsCart() async {
      await ready;
      var products = await db.query("PorductsCart");
      if (products.isNotEmpty)
        return products.map<Product>((item) => new Product.fromDb(item)).toList();
    }

    Future<int> insertProduct(Product product) async {
        return await db.insert(
            'PorductsCart',
            product.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace,
        );
    }


    Future<int> removeProduct(int id) async {
      return await db.delete(
        'PorductsCart',
        where: "id = ?",
        whereArgs: [id]
      );
    }

}