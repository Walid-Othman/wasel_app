import 'package:flutter/material.dart';


class EditReviewScreen extends StatelessWidget {
  const EditReviewScreen({super.key,required this.data});
   final  data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Edit Review")));
  }
}
