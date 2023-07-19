import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String text;
  final Color? color;
  final double size;
  final TextOverflow overflow;

  const BigText({
    super.key,this.size = 35,
    required this.text,
    this.color = Colors.black,
    this.overflow=TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      overflow: overflow,
      maxLines: 1,
      style: TextStyle(
          color: color,
          fontSize: size ,
          fontWeight: FontWeight.w400,
          fontFamily: 'BalsamiqSans'
      ),
    );
  }
}
