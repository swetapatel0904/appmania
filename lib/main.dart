import 'package:appmania/screen/home/home_screen.dart';
import 'package:appmania/screen/item/item_screen.dart';
import 'package:appmania/screen/cart/cart_screen.dart';
import 'package:flutter/material.dart';
void main()
{
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
          routes:{
          "/":(context)=>HomeScreen(),
          "item":(context)=>ItemScreen(),
          "cart":(context)=>CartScreen(),
        }
        )
  );
}