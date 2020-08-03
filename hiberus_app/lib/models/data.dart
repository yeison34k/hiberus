import 'package:hiberusapp/models/product.dart';

class AppData {
  static List<Product> productList = [
    Product(
        id:1,
        title: 'Nike Air Max 200',
        price: 240.00,
        image: 'assets/images/shooe_tilt_1.png',
        isSelected: true,
        isliked: false,
        category: "Trending Now"),
    Product(
        id:2,
        title: 'Nike Air Max 97',
        price: 220.00,
        isliked: false,
        image: 'assets/images/shoe_tilt_2.png',
        category: "Trending Now"),
  ];

  static List<Product> cartList = [
    Product(
        id:1,
        title: 'Nike Air Max 200',
        price: 240.00,
        isSelected: true,
        isliked: false,
        image: 'assets/images/small_tilt_shoe_1.png',
        category: "Trending Now"),
    Product(
        id:2,
        title: 'Nike Air Max 97',
        price: 190.00,
        isliked: false,
        image: 'assets/images/bag_1.png',
        category: "Trending Now"),
    Product(
        id:1,
        title: 'Nike Air Max 92607',
        price: 220.00,
        isliked: false,
        image: 'assets/images/small_tilt_shoe_3.png',
        category: "Trending Now"),
     Product(
        id:2,
        title: 'Nike Air Max 200',
        price: 240.00,
        isSelected: true,
        isliked: false,
        image: 'assets/images/small_tilt_shoe_1.png',
        category: "Trending Now"),
  ];

  static List<String> showThumbnailList = [
    "assets/images/shoe_thumb_5.png",
    "assets/images/shoe_thumb_1.png",
    "assets/images/shoe_thumb_4.png",
    "assets/images/shoe_thumb_3.png",
  ];

  static String description = "Clean lines, versatile and timeless—the people shoe returns with the Nike Air Max 90. Featuring the same iconic Waffle sole, stitched overlays and classic TPU accents you come to love, it lets you walk among the pantheon of Air. ßNothing as fly, nothing as comfortable, nothing as proven. The Nike Air Max 90 stays true to its OG running roots with the iconic Waffle sole, stitched overlays and classic TPU details. Classic colours celebrate your fresh look while Max Air cushioning adds comfort to the journey.";
}
