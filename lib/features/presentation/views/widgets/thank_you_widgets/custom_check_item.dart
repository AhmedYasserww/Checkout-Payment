import 'package:flutter/material.dart';
class CustomCheckItem extends StatelessWidget {
  const CustomCheckItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 50,
      backgroundColor: Color(0xffEDEDED),
      child: CircleAvatar(
        radius: 40,
        backgroundColor: Color(0xff34A853),
        child: Icon(Icons.check,color: Colors.white,size: 50,),
      ),
    );
  }
}