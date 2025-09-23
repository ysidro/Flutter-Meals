import 'package:flutter/material.dart';

class MealItemTraid extends StatelessWidget{
  const MealItemTraid(
    {
      super.key, 
      required this.icon, 
      required this.label
      }
    );

  final IconData icon;
  final String label;


  @override
  Widget build(BuildContext context) {
   return Row(
    children: [
      Icon(
      icon, 
      size: 12, 
      color: Colors.white
    ),
    SizedBox(),
    Text(label, style: TextStyle(color: Colors.white),),
    ],
   );
  }
}