import 'package:flutter/material.dart';

class CartContanir extends StatelessWidget {
   CartContanir({super.key , required this.child});
Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xFFF6F6F6),
      ),
      child: child,
    );
  }
}
