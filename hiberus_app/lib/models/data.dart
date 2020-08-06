import 'package:flutter/cupertino.dart';
import 'package:hiberusapp/models/product.dart';

class AppData {
    static String description = "Clean lines, versatile and timeless—the people shoe returns with the Nike Air Max 90. Featuring the same iconic Waffle sole, stitched overlays and classic TPU accents you come to love, it lets you walk among the pantheon of Air. ßNothing as fly, nothing as comfortable, nothing as proven. The Nike Air Max 90 stays true to its OG running roots with the iconic Waffle sole, stitched overlays and classic TPU details. Classic colours celebrate your fresh look while Max Air cushioning adds comfort to the journey.";
    static String dummyText = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";

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


  static List<Product> products = [
      Product(
          id: 1,
          title: "Office Code",
          price: 234.00,
          size: 12,
          description: dummyText,
          image: "assets/images/bag_1.png",
          color: Color(0xFF3D82AE)),
      Product(
          id: 2,
          title: "Belt Bag",
          price: 234,
          size: 8,
          description: dummyText,
          image: "assets/images/bag_2.png",
          color: Color(0xFFD3A984)),
      Product(
          id: 3,
          title: "Hang Top",
          price: 234,
          size: 10,
          description: dummyText,
          image: "assets/images/bag_3.png",
          color: Color(0xFF989493)),
      Product(
          id: 4,
          title: "Old Fashion",
          price: 234,
          size: 11,
          description: dummyText,
          image: "assets/images/bag_4.png",
          color: Color(0xFFE6B398)),
      Product(
          id: 5,
          title: "Office Code",
          price: 234,
          size: 12,
          description: dummyText,
          image: "assets/images/bag_5.png",
          color: Color(0xFFFB7883)),
      Product(
          id: 6,
          title: "Office Code",
          price: 234,
          size: 12,
          description: dummyText,
          image: "assets/images/bag_6.png",
          color: Color(0xFFAEAEAE),
      ),
  ];

}
