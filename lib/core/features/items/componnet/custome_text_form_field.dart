// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomeTextFormField extends StatelessWidget {
  const CustomeTextFormField({
    Key? key,
    this.title,
    required this.hintText,
    required this.icon,
    required this.keyboardType,
    required this.onChanged,
    required this.controller,
    this.maxLines,
    this.isdescraption = false
  }) : super(key: key);

  final String? title;
  final String hintText;
  final IconData icon;
  final Function(String) onChanged;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final int? maxLines;
  final bool isdescraption;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(title !=null)
        Text(title!),
        SizedBox(height: 10),
        TextFormField(
          maxLines: maxLines??1,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey, fontSize: 14),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.orange, width: 2),
            ),

            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.red, width: 1.5),
            ),

            prefixIcon: Padding(
              padding: isdescraption ? const EdgeInsets.only(bottom:75) :EdgeInsets.zero,
              child: Icon(icon, color: Colors.orange),
            ),

            filled: true,
            fillColor: Color(0xFFF9F9F9),
          ),

          controller: controller,

          onChanged: (value) {
            onChanged(value);
          },

          keyboardType: keyboardType,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }
            return null;
          },
        ),
      ],
    );
  }
}
