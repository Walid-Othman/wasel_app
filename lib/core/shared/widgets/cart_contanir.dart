import 'package:flutter/material.dart';

class CartContanir extends StatelessWidget {
  const CartContanir({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xFFF6F6F6),
      ),
      child: child,
    );
  }
}
